<?php

namespace wcf\system\user\notification\event;

use wcf\data\user\UserProfile;
use wcf\system\cache\runtime\CommentRuntimeCache;
use wcf\system\cache\runtime\UserProfileRuntimeCache;
use wcf\system\cache\runtime\ViewableArticleContentRuntimeCache;
use wcf\system\email\Email;

/**
 * User notification event for article comment responses.
 *
 * @author  Joshua Ruesweg
 * @copyright   2001-2019 WoltLab GmbH
 * @license GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @since       5.2
 */
class ArticleCommentResponseOwnerUserNotificationEvent extends AbstractCommentResponseUserNotificationEvent implements
    ITestableUserNotificationEvent
{
    use TTestableCommentResponseUserNotificationEvent;
    use TTestableArticleCommentUserNotificationEvent;

    /**
     * @inheritDoc
     */
    protected function prepare()
    {
        parent::prepare();

        ViewableArticleContentRuntimeCache::getInstance()->cacheObjectID($this->additionalData['objectID']);
    }

    /**
     * @inheritDoc
     */
    public function getMessage()
    {
        $authors = $this->getAuthors();
        if (\count($authors) > 1) {
            if (isset($authors[0])) {
                unset($authors[0]);
            }
            $count = \count($authors);

            return $this->getLanguage()->getDynamicVariable(
                'wcf.user.notification.articleComment.responseOwner.message.stacked',
                [
                    'author' => $this->author,
                    'authors' => \array_values($authors),
                    'commentID' => $this->getUserNotificationObject()->commentID,
                    'article' => ViewableArticleContentRuntimeCache::getInstance()
                        ->getObject($this->additionalData['objectID']),
                    'count' => $count,
                    'others' => $count - 1,
                    'guestTimesTriggered' => $this->notification->guestTimesTriggered,
                    'responseID' => $this->getUserNotificationObject()->responseID,
                    'commentAuthor' => $this->getCommentAuthorProfile(),
                ]
            );
        }

        return $this->getLanguage()->getDynamicVariable('wcf.user.notification.articleComment.responseOwner.message', [
            'author' => $this->author,
            'commentID' => $this->getUserNotificationObject()->commentID,
            'article' => ViewableArticleContentRuntimeCache::getInstance()
                ->getObject($this->additionalData['objectID']),
            'responseID' => $this->getUserNotificationObject()->responseID,
            'commentAuthor' => $this->getCommentAuthorProfile(),
        ]);
    }

    /**
     * @inheritDoc
     */
    public function getEmailMessage($notificationType = 'instant')
    {
        $messageID = '<com.woltlab.wcf.user.articleComment.notification/' . $this->getUserNotificationObject()->commentID . '@' . Email::getHost() . '>';

        return [
            'template' => 'email_notification_commentResponseOwner',
            'in-reply-to' => [$messageID],
            'references' => [$messageID],
            'application' => 'wcf',
            'variables' => [
                'commentID' => $this->getUserNotificationObject()->commentID,
                'article' => ViewableArticleContentRuntimeCache::getInstance()
                    ->getObject($this->additionalData['objectID']),
                'languageVariablePrefix' => 'wcf.user.notification.articleComment.responseOwner',
                'responseID' => $this->getUserNotificationObject()->responseID,
                'commentAuthor' => $this->getCommentAuthorProfile(),
            ],
        ];
    }

    /**
     * Returns the comment authors profile.
     *
     * @return      UserProfile
     */
    private function getCommentAuthorProfile()
    {
        $comment = CommentRuntimeCache::getInstance()->getObject($this->getUserNotificationObject()->commentID);

        if ($comment->userID) {
            return UserProfileRuntimeCache::getInstance()->getObject($comment->userID);
        } else {
            return UserProfile::getGuestUserProfile($comment->username);
        }
    }

    /**
     * @inheritDoc
     */
    public function getLink(): string
    {
        return ViewableArticleContentRuntimeCache::getInstance()->getObject($this->additionalData['objectID'])->getLink() . '#comment' . $this->getUserNotificationObject()->commentID . '/response' . $this->getUserNotificationObject()->responseID;
    }

    /**
     * @inheritDoc
     */
    protected function getTypeName(): string
    {
        return $this->getLanguage()->get('wcf.user.recentActivity.com.woltlab.wcf.article.recentActivityEvent');
    }

    /**
     * @inheritDoc
     */
    protected function getObjectTitle(): string
    {
        return ViewableArticleContentRuntimeCache::getInstance()
            ->getObject($this->additionalData['objectID'])->getTitle();
    }
}

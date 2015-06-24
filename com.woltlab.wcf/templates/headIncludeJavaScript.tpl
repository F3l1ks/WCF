{*
	DO NOT EDIT THIS FILE
*}

<script>
	var SID_ARG_2ND	= '';
	var WCF_PATH = '{@$__wcf->getPath()}';
	var SECURITY_TOKEN = '{@SECURITY_TOKEN}';
	var LANGUAGE_ID = {@$__wcf->getLanguage()->languageID};
	var TIME_NOW = {@TIME_NOW};
	var URL_LEGACY_MODE = {if URL_LEGACY_MODE}true{else}false{/if};
</script>

{js application='wcf' file='require' bundle='WCF.Core' core='true'}
{js application='wcf' file='require.config' bundle='WCF.Core' core='true'}
<script>
requirejs.config({
	baseUrl: '{@$__wcf->getPath()}js'
});
</script>
<script>
	(function(window) {
		var orgRequire = window.require;
		var queue = [];
		var counter = 0;
		
		window.require = function(dependencies, callback) {
			if (!Array.isArray(dependencies)) {
				return orgRequire.apply(window, arguments);
			}
			
			var i = counter++;
			queue.push(i);
			
			orgRequire(dependencies, function() {
				var args = arguments;
				
				queue[queue.indexOf(i)] = function() { callback.apply(window, args); };
				
				executeCallbacks();
			});
		};
		
		function executeCallbacks() {
			while (queue.length) {
				if (typeof queue[0] !== 'function') {
					break;
				}
				
				queue.shift()();
			}
		};
	})(window);
</script>
<script data-relocate="true">
	require(['Language', 'WoltLab/WCF/BootstrapFrontend'], function(Language, BootstrapFrontend) {
		Language.addObject({
			'__days': [ '{lang}wcf.date.day.sunday{/lang}', '{lang}wcf.date.day.monday{/lang}', '{lang}wcf.date.day.tuesday{/lang}', '{lang}wcf.date.day.wednesday{/lang}', '{lang}wcf.date.day.thursday{/lang}', '{lang}wcf.date.day.friday{/lang}', '{lang}wcf.date.day.saturday{/lang}' ],
			'__daysShort': [ '{lang}wcf.date.day.sun{/lang}', '{lang}wcf.date.day.mon{/lang}', '{lang}wcf.date.day.tue{/lang}', '{lang}wcf.date.day.wed{/lang}', '{lang}wcf.date.day.thu{/lang}', '{lang}wcf.date.day.fri{/lang}', '{lang}wcf.date.day.sat{/lang}' ],
			'__months': [ '{lang}wcf.date.month.january{/lang}', '{lang}wcf.date.month.february{/lang}', '{lang}wcf.date.month.march{/lang}', '{lang}wcf.date.month.april{/lang}', '{lang}wcf.date.month.may{/lang}', '{lang}wcf.date.month.june{/lang}', '{lang}wcf.date.month.july{/lang}', '{lang}wcf.date.month.august{/lang}', '{lang}wcf.date.month.september{/lang}', '{lang}wcf.date.month.october{/lang}', '{lang}wcf.date.month.november{/lang}', '{lang}wcf.date.month.december{/lang}' ], 
			'__monthsShort': [ '{lang}wcf.date.month.short.jan{/lang}', '{lang}wcf.date.month.short.feb{/lang}', '{lang}wcf.date.month.short.mar{/lang}', '{lang}wcf.date.month.short.apr{/lang}', '{lang}wcf.date.month.short.may{/lang}', '{lang}wcf.date.month.short.jun{/lang}', '{lang}wcf.date.month.short.jul{/lang}', '{lang}wcf.date.month.short.aug{/lang}', '{lang}wcf.date.month.short.sep{/lang}', '{lang}wcf.date.month.short.oct{/lang}', '{lang}wcf.date.month.short.nov{/lang}', '{lang}wcf.date.month.short.dec{/lang}' ],
			'wcf.clipboard.item.unmarkAll': '{lang}wcf.clipboard.item.unmarkAll{/lang}',
			'wcf.date.relative.now': '{lang}wcf.date.relative.now{/lang}',
			'wcf.date.relative.minutes': '{capture assign=relativeMinutes}{lang}wcf.date.relative.minutes{/lang}{/capture}{@$relativeMinutes|encodeJS}',
			'wcf.date.relative.hours': '{capture assign=relativeHours}{lang}wcf.date.relative.hours{/lang}{/capture}{@$relativeHours|encodeJS}',
			'wcf.date.relative.pastDays': '{capture assign=relativePastDays}{lang}wcf.date.relative.pastDays{/lang}{/capture}{@$relativePastDays|encodeJS}',
			'wcf.date.dateFormat': '{lang}wcf.date.dateFormat{/lang}',
			'wcf.date.dateTimeFormat': '{lang}wcf.date.dateTimeFormat{/lang}',
			'wcf.date.shortDateTimeFormat': '{lang}wcf.date.shortDateTimeFormat{/lang}',
			'wcf.date.hour': '{lang}wcf.date.hour{/lang}',
			'wcf.date.minute': '{lang}wcf.date.minute{/lang}',
			'wcf.date.timeFormat': '{lang}wcf.date.timeFormat{/lang}',
			'wcf.date.firstDayOfTheWeek': '{lang}wcf.date.firstDayOfTheWeek{/lang}',
			'wcf.global.button.add': '{lang}wcf.global.button.add{/lang}',
			'wcf.global.button.cancel': '{lang}wcf.global.button.cancel{/lang}',
			'wcf.global.button.close': '{lang}wcf.global.button.close{/lang}',
			'wcf.global.button.collapsible': '{lang}wcf.global.button.collapsible{/lang}',
			'wcf.global.button.delete': '{lang}wcf.global.button.delete{/lang}',
			'wcf.global.button.disable': '{lang}wcf.global.button.disable{/lang}',
			'wcf.global.button.disabledI18n': '{lang}wcf.global.button.disabledI18n{/lang}',
			'wcf.global.button.edit': '{lang}wcf.global.button.edit{/lang}',
			'wcf.global.button.enable': '{lang}wcf.global.button.enable{/lang}',
			'wcf.global.button.hide': '{lang}wcf.global.button.hide{/lang}',
			'wcf.global.button.next': '{lang}wcf.global.button.next{/lang}',
			'wcf.global.button.preview': '{lang}wcf.global.button.preview{/lang}',
			'wcf.global.button.reset': '{lang}wcf.global.button.reset{/lang}',
			'wcf.global.button.save': '{lang}wcf.global.button.save{/lang}',
			'wcf.global.button.search': '{lang}wcf.global.button.search{/lang}',
			'wcf.global.button.submit': '{lang}wcf.global.button.submit{/lang}',
			'wcf.global.button.upload': '{lang}wcf.global.button.upload{/lang}',
			'wcf.global.confirmation.cancel': '{lang}wcf.global.confirmation.cancel{/lang}',
			'wcf.global.confirmation.confirm': '{lang}wcf.global.confirmation.confirm{/lang}',
			'wcf.global.confirmation.title': '{lang}wcf.global.confirmation.title{/lang}',
			'wcf.global.decimalPoint': '{capture assign=decimalPoint}{lang}wcf.global.decimalPoint{/lang}{/capture}{$decimalPoint|encodeJS}',
			'wcf.global.error.timeout': '{lang}wcf.global.error.timeout{/lang}',
			'wcf.global.form.error.empty': '{lang}wcf.global.form.error.empty{/lang}',
			'wcf.global.form.error.greaterThan': '{lang __literal=true}wcf.global.form.error.greaterThan{/lang}',
			'wcf.global.form.error.lessThan': '{lang __literal=true}wcf.global.form.error.lessThan{/lang}',
			'wcf.global.form.input.maxItems': '{lang}wcf.global.form.input.maxItems{/lang}',
			'wcf.global.language.noSelection': '{lang}wcf.global.language.noSelection{/lang}',
			'wcf.global.loading': '{lang}wcf.global.loading{/lang}',
			'wcf.global.page.jumpTo': '{lang}wcf.global.page.jumpTo{/lang}',
			'wcf.global.page.jumpTo.description': '{lang}wcf.global.page.jumpTo.description{/lang}',
			'wcf.global.page.pageNavigation': '{lang}wcf.global.page.pageNavigation{/lang}',
			'wcf.global.page.next': '{capture assign=pageNext}{lang}wcf.global.page.next{/lang}{/capture}{@$pageNext|encodeJS}',
			'wcf.global.page.previous': '{capture assign=pagePrevious}{lang}wcf.global.page.previous{/lang}{/capture}{@$pagePrevious|encodeJS}',
			'wcf.global.pageDirection': '{lang}wcf.global.pageDirection{/lang}',
			'wcf.global.reason': '{lang}wcf.global.reason{/lang}',
			'wcf.global.sidebar.hideLeftSidebar': '{lang}wcf.global.sidebar.hideLeftSidebar{/lang}',
			'wcf.global.sidebar.hideRightSidebar': '{lang}wcf.global.sidebar.hideRightSidebar{/lang}',
			'wcf.global.sidebar.showLeftSidebar': '{lang}wcf.global.sidebar.showLeftSidebar{/lang}',
			'wcf.global.sidebar.showRightSidebar': '{lang}wcf.global.sidebar.showRightSidebar{/lang}',
			'wcf.global.success': '{lang}wcf.global.success{/lang}',
			'wcf.global.success.add': '{lang}wcf.global.success.add{/lang}',
			'wcf.global.success.edit': '{lang}wcf.global.success.edit{/lang}',
			'wcf.global.thousandsSeparator': '{capture assign=thousandsSeparator}{lang}wcf.global.thousandsSeparator{/lang}{/capture}{@$thousandsSeparator|encodeJS}',
			'wcf.page.pagePosition': '{lang __literal=true}wcf.page.pagePosition{/lang}',
			'wcf.page.sitemap': '{lang}wcf.page.sitemap{/lang}',
			'wcf.style.changeStyle': '{lang}wcf.style.changeStyle{/lang}',
			'wcf.user.activityPoint': '{lang}wcf.user.activityPoint{/lang}',
			'wcf.style.changeStyle': '{lang}wcf.style.changeStyle{/lang}',
			'wcf.user.panel.markAllAsRead': '{lang}wcf.user.panel.markAllAsRead{/lang}',
			'wcf.user.panel.markAsRead': '{lang}wcf.user.panel.markAsRead{/lang}',
			'wcf.user.panel.settings': '{lang}wcf.user.panel.settings{/lang}',
			'wcf.user.panel.showAll': '{lang}wcf.user.panel.showAll{/lang}'
			{if MODULE_LIKE}
				,'wcf.like.button.like': '{lang}wcf.like.button.like{/lang}',
				'wcf.like.button.dislike': '{lang}wcf.like.button.dislike{/lang}',
				'wcf.like.tooltip': '{lang}wcf.like.jsTooltip{/lang}',
				'wcf.like.summary': '{lang}wcf.like.summary{/lang}',
				'wcf.like.details': '{lang}wcf.like.details{/lang}'
			{/if}
			
			{event name='javascriptLanguageImport'}
		});
		
		BootstrapFrontend.setup({
			styleChanger: {if $__wcf->getStyleHandler()->countStyles() > 1}true{else}false{/if}
		});
	});
	
	// prevent jQuery and other libraries from utilizing define()
	__require_define_amd = define.amd;
	define.amd = undefined;
</script>

{if JQUERY_SOURCE == 'google'}
<script data-relocate="true" src="//ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery{if !ENABLE_DEBUG_MODE}.min{/if}.js"></script>
{elseif JQUERY_SOURCE == 'microsoft'}
<script data-relocate="true" src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.4{if !ENABLE_DEBUG_MODE}.min{/if}.js"></script>
{elseif JQUERY_SOURCE == 'cloudflare'}
<script data-relocate="true" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery{if !ENABLE_DEBUG_MODE}.min{/if}.js"></script>
{else}
{js application='wcf' lib='jquery'}
{/if}
{if JQUERY_SOURCE != 'local'}
<script data-relocate="true">
	if (!window.jQuery) {
		document.write('{js application='wcf' lib='jquery' encodeJs='true'}');
	}
</script>
{/if}

{js application='wcf' lib='jquery-ui'}
{js application='wcf' lib='jquery-ui' file='touchPunch' bundle='WCF.Combined'}
{js application='wcf' lib='jquery-ui' file='nestedSortable' bundle='WCF.Combined'}
{js application='wcf' file='WCF.Assets' bundle='WCF.Combined'}
{js application='wcf' file='WCF' bundle='WCF.Combined'}

<script data-relocate="true">
	define.amd = __require_define_amd;
	$.holdReady(true);
	
	WCF.User.init({@$__wcf->user->userID}, '{@$__wcf->user->username|encodeJS}');
</script>

{js application='wcf' file='WCF.Like' bundle='WCF.Combined'}
{js application='wcf' file='WCF.ACL' bundle='WCF.Combined'}
{js application='wcf' file='WCF.Attachment' bundle='WCF.Combined'}
{js application='wcf' file='WCF.ColorPicker' bundle='WCF.Combined'}
{js application='wcf' file='WCF.Comment' bundle='WCF.Combined'}
{js application='wcf' file='WCF.ImageViewer' bundle='WCF.Combined'}
{js application='wcf' file='WCF.Label' bundle='WCF.Combined'}
{js application='wcf' file='WCF.Location' bundle='WCF.Combined'}
{js application='wcf' file='WCF.Message' bundle='WCF.Combined'}
{js application='wcf' file='WCF.Poll' bundle='WCF.Combined'}
{js application='wcf' file='WCF.Search.Message' bundle='WCF.Combined'}
{js application='wcf' file='WCF.Tagging' bundle='WCF.Combined'}
{js application='wcf' file='WCF.User' bundle='WCF.Combined'}
{js application='wcf' file='WCF.Moderation' bundle='WCF.Combined'}

{event name='javascriptInclude'}

<noscript>
	<style>
		.jsOnly {
			display: none !important;
		}
		
		.noJsOnly {
			display: block !important;
		}
	</style>
</noscript>

<script data-relocate="true">
	//<![CDATA[
	$(function() {
		new WCF.Effect.SmoothScroll();
		
		WCF.System.PageNavigation.init('.pageNavigation');
		WCF.Date.Picker.init();
		WCF.User.Profile.ActivityPointList.init();
		
		{event name='javascriptInit'}
		
		{if $executeCronjobs}
			new WCF.Action.Proxy({
				autoSend: true,
				data: {
					className: 'wcf\\data\\cronjob\\CronjobAction',
					actionName: 'executeCronjobs'
				},
				showLoadingOverlay: false,
				failure: function() {
					return false;
				}
			});
		{/if}
		{if $__sessionKeepAlive|isset}
			new WCF.System.KeepAlive({@$__sessionKeepAlive});
		{/if}
	});
	//]]>
</script>

{include file='imageViewer'}

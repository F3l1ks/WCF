/**
 * Provides helper functions for Image metadata handling.
 *
 * @author	Tim Duesterhus
 * @copyright	2001-2019 WoltLab GmbH
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @woltlabExcludeBundle tiny
 */

/**
 * Returns whether the given canvas contains transparent pixels.
 */
export function containsTransparentPixels(canvas: HTMLCanvasElement): boolean {
  const ctx = canvas.getContext("2d");
  if (!ctx) {
    throw new Error("Unable to get canvas context.");
  }

  const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);

  for (let i = 3, max = imageData.data.length; i < max; i += 4) {
    if (imageData.data[i] !== 255) return true;
  }

  return false;
}

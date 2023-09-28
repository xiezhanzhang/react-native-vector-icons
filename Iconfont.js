/**
 * Feather icon set component.
 * Usage: <Feather name="icon-name" size={20} color="#4F8EF7" />
 */

import createIconSet from './lib/create-icon-set';
import glyphMap from './glyphmaps/iconfont.json';

const iconSet = createIconSet(glyphMap, 'Iconfont', 'iconfont.ttf');

export default iconSet;
export const {
  Button,
  getImageSource,
  getImageSourceSync,
} = iconSet;


// libraries
import flixel.addons.tile.FlxTilemapExt;
import flixel.util.FlxDirectionFlags;
import flixel.tile.FlxTile;
// var
public var map:FlxTilemapExt;
// functions
function create(){
    // map
    add(map = new FlxTilemapExt().loadMapFromCSV('data/tiled/greenHillZone_map.csv', Assets.getBitmapData(Paths.image('sonic/tilesets/greenHillZone'), true, false)));
    map.setSlopes([22, 24, 25, 28, 30], [23, 26, 27, 29, 31]);
    map.setGentle([25, 26], [24, 27]);
    map.setSteep([28, 29], [30, 31]);
    map.setTile([28, 29], [30, 31]);
    map.setTileProperties(41, FlxDirectionFlags.CEILING);
    // grass
    add(grass = new FlxTilemapExt().loadMapFromCSV('data/tiled/greenHillZone_grass.csv', Assets.getBitmapData(Paths.image('sonic/tilesets/greenHillZone'), true, false)));
}
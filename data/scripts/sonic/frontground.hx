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
    map.setSlopes([25, 27, 28, 31, 33], [26, 29, 30, 32, 34]);
    map.setGentle([28, 29], [27, 30]);
    map.setSteep([31, 32], [33, 34]);
    map.setTileProperties(41, FlxDirectionFlags.CEILING);
    map.setDownwardsGlue(true);
    // grass
    add(grass = new FlxTilemapExt().loadMapFromCSV('data/tiled/greenHillZone_grass.csv', Assets.getBitmapData(Paths.image('sonic/tilesets/greenHillZone'), true, false)));
}
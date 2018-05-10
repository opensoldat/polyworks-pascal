
object frmSoldatMapEditor: TForm1
AutoScroll = False
Color = 0
Height = 625
Left = 240
Top = 212
Width = 825
Font.Name = 'BankGothic Lt BT'
Font.Size = 9
Font.Charset =DEFAULT_CHARSET

object picButtonGfx: TImage
Color = 4865073
Font.Color = -2147483640
Height = 193
Left = 272
Top = 80
Width = 241
end


object ImageList: 
Left = 272
Top = 280
Color = -2147483643
end


object picStatus: TImage
Color = 4865073
Font.Color = 16777215
Height = 18
Left = 0
Top = 582
Width = 800

object txtZoom: TMemo
Color = 4865073
Font.Name = 'Lucida Console'
Font.Size = 8
Font.Charset =DEFAULT_CHARSET
Font.Color = 16777215
Height = 16
Left = 200
Top = 3
Width = 49
end


object lblMousePosition: TLabel
Caption         =   'Position:'
Font.Name = 'BankGothic Lt BT'
Font.Size = 8
Font.Charset =DEFAULT_CHARSET
Font.Color = 16777215
Height = 17
Left = 544
Top = 3
Width = 249
end


object lblFileName: TLabel
Color = 4865073
Caption         =   'Untitled.pms'
Font.Name = 'BankGothic Lt BT'
Font.Size = 8
Font.Charset =DEFAULT_CHARSET
Font.Color = 16777215
Height = 17
Left = 8
Top = 3
Width = 137
end


object lblZoom: TLabel
Caption         =   'Zoom:'
Font.Name = 'BankGothic Lt BT'
Font.Size = 8
Font.Charset =DEFAULT_CHARSET
Font.Color = 16777215
Height = 17
Left = 160
Top = 3
Width = 41
end


object lblCurrentTool: TLabel
Caption         =   'Current Tool:'
Font.Name = 'BankGothic Lt BT'
Font.Size = 8
Font.Charset =DEFAULT_CHARSET
Font.Color = 16777215
Height = 17
Left = 272
Top = 3
Width = 257
end

end


object picMenuBar: TImage
Color = 4865073
Font.Color = -2147483640
Height = 16
Left = 0
Top = 25
Width = 800

object picMenu: TImage
Color = 4865073
Font.Name = 'BankGothic Lt BT'
Font.Size = 8
Font.Charset =DEFAULT_CHARSET
Font.Color = 16777215
Height = 17
Left = 256
Top = 0
Width = 64
end


object picProgress: TImage
Color = 4865073
Font.Color = -2147483640
Height = 10
Left = 664
Top = 2
Width = 128
end


object picMenu: TImage
Color = 4865073
Font.Name = 'BankGothic Lt BT'
Font.Size = 8
Font.Charset =DEFAULT_CHARSET
Font.Color = 16777215
Height = 17
Left = 128
Top = 0
Width = 64
end


object picMenu: TImage
Color = 4865073
Font.Name = 'BankGothic Lt BT'
Font.Size = 8
Font.Charset =DEFAULT_CHARSET
Font.Color = 16777215
Height = 17
Left = 64
Top = 0
Width = 64
end


object picMenu: TImage
Color = 4865073
Font.Name = 'BankGothic Lt BT'
Font.Size = 8
Font.Charset =DEFAULT_CHARSET
Font.Color = 16777215
Height = 17
Left = 192
Top = 0
Width = 64
end


object picMenu: TImage
Color = 4865073
Font.Name = 'BankGothic Lt BT'
Font.Size = 8
Font.Charset =DEFAULT_CHARSET
Font.Color = 16777215
Height = 17
Left = 0
Top = 0
Width = 64
end

end


object picTitle: TImage
Color = 4865073
Font.Color = 16777215
Height = 25
Left = 0
Top = 0
Width = 800

object picHelp: TImage
Color = 4865073
Font.Color = -2147483640
Height = 16
Left = 720
Top = 0
Width = 16
end


object picMinimize: TImage
Color = 4865073
Font.Color = -2147483640
Height = 16
Left = 752
Top = 0
Width = 16
end


object picMaximize: TImage
Color = 4865073
Font.Color = -2147483640
Height = 16
Left = 768
Top = 0
Width = 16
end


object picExit: TImage
Color = 4865073
Font.Color = -2147483640
Height = 16
Left = 784
Top = 0
Width = 16
end

end


object commonDialog: 
Left = 208
Top = 40
end


object picGfx: TImage
Color = 4865073
Font.Color = -2147483640
Height = 449
Left = 168
Top = 80
Width = 97
end


object tvwScenery: 
Height = 539
Left = 0
Top = 40
Width = 382
Font.Name = 'Lucida Console'
Font.Size = 8
Font.Charset =DEFAULT_CHARSET
end


object MouseHelper: 
Left = 168
Top = 40
end


object mnuMenu: TMainMenu
Caption         =   '&File'

object mnuNew: TMainMenu
Caption         =   '&New'
end


object mnuOpen: TMainMenu
Caption         =   '&Open...'
end


object mnuOpenCompiled: TMainMenu
Caption         =   'O&pen Compiled...'
end


object mnuRecentFiles: TMainMenu
Caption         =   'Open &Recent'

object mnuRecent: TMainMenu
Caption         =   ''
end


object mnuRecent: TMainMenu
Caption         =   ''
end


object mnuRecent: TMainMenu
Caption         =   ''
end


object mnuRecent: TMainMenu
Caption         =   ''
end


object mnuRecent: TMainMenu
Caption         =   ''
end


object mnuRecent: TMainMenu
Caption         =   ''
end


object mnuRecent: TMainMenu
Caption         =   ''
end


object mnuRecent: TMainMenu
Caption         =   ''
end


object mnuRecent: TMainMenu
Caption         =   ''
end


object mnuRecent: TMainMenu
Caption         =   ''
end

end


object mnuSep3: TMainMenu
Caption         =   '-'
end


object mnuSave: TMainMenu
Caption         =   '&Save...'
end


object mnuSaveAs: TMainMenu
Caption         =   'Save &As...'
end


object mnuSep15: TMainMenu
Caption         =   '-'
end


object mnuCompile: TMainMenu
Caption         =   '&Compile to pms'
end


object mnuCompileAs: TMainMenu
Caption         =   'Compile to &pms As...'
end


object mnuSep10: TMainMenu
Caption         =   '-'
end


object mnuExport: TMainMenu
Caption         =   '&Export...'
end


object mnuImport: TMainMenu
Caption         =   '&Import...'
end


object mnuSep18: TMainMenu
Caption         =   '-'
end


object mnuRunSoldat: TMainMenu
Caption         =   '&Run Soldat'
end


object mnuSep1: TMainMenu
Caption         =   '-'
end


object mnuExit: TMainMenu
Caption         =   'E&xit'
end

end


object mnuMenu: TMainMenu
Caption         =   'Edit'

object mnuUndo: TMainMenu
Caption         =   'Undo'
end


object mnuRedo: TMainMenu
Caption         =   'Redo'
end


object mnuSep8: TMainMenu
Caption         =   '-'
end


object mnuDuplicate: TMainMenu
Caption         =   'Duplicate'
end


object mnuCopy: TMainMenu
Caption         =   'Copy'
end


object mnuPaste: TMainMenu
Caption         =   'Paste'
end


object mnuClear: TMainMenu
Caption         =   'Clear'
end


object mnuSep32: TMainMenu
Caption         =   '-'
end


object mnuSelectAll: TMainMenu
Caption         =   'Select All'
end


object mnuInvertSel: TMainMenu
Caption         =   'Invert Selection'
end


object mnuDeselect: TMainMenu
Caption         =   'Deselect'
end


object mnuSelColour: TMainMenu
Caption         =   'Select by Colour'
end


object mnuSep5: TMainMenu
Caption         =   '-'
end


object mnuArrange: TMainMenu
Caption         =   'Arrange'

object mnuBringToFront: TMainMenu
Caption         =   'Bring to Front'
end


object mnuBringForward: TMainMenu
Caption         =   'Bring Forward'
end


object mnuSendBackward: TMainMenu
Caption         =   'Send Backward'
end


object mnuSendToBack: TMainMenu
Caption         =   'Send to Back'
end

end


object mnuSep12: TMainMenu
Caption         =   '-'
end


object mnuSplit: TMainMenu
Caption         =   'Split at Vertex'
end


object mnuJoinVertices: TMainMenu
Caption         =   'Join Vertices'
end


object mnuSnapSelected: TMainMenu
Caption         =   'Snap Selected Vertices'
end


object mnuCreate: TMainMenu
Caption         =   'Create with Selected'
end


object mnuTransform: TMainMenu
Caption         =   'Transform'

object mnuRotate: TMainMenu
Caption         =   'Rotate 180°'
end


object mnuRotate: TMainMenu
Caption         =   'Rotate 90° CW'
end


object mnuRotate: TMainMenu
Caption         =   'Rotate 90° CCW'
end


object mnuSep6: TMainMenu
Caption         =   '-'
end


object mnuFlip: TMainMenu
Caption         =   'Flip Horizontal'
end


object mnuFlip: TMainMenu
Caption         =   'Flip Vertical'
end

end


object mnuSep20: TMainMenu
Caption         =   '-'
end


object mnuSever: TMainMenu
Caption         =   'Sever Connections'
end


object mnuSep16: TMainMenu
Caption         =   '-'
end


object mnuClrSketch: TMainMenu
Caption         =   'Clear sketch'
end


object mnuSep30: TMainMenu
Caption         =   '-'
end


object mnuMap: TMainMenu
Caption         =   'Map Settings...'
end


object mnuSep21: TMainMenu
Caption         =   '-'
end


object mnuPreferences: TMainMenu
Caption         =   'Preferences...'
end

end


object mnuMenu: TMainMenu
Caption         =   'Texture'

object mnuFixTexture: TMainMenu
Caption         =   'Fix Texture'
end


object mnuUntexture: TMainMenu
Caption         =   'Untexture'
end


object mnuTransformTexture: TMainMenu
Caption         =   'Transform Texture'

object mnuRotateTexture: TMainMenu
Caption         =   'Rotate 180°'
end


object mnuRotateTexture: TMainMenu
Caption         =   'Rotate 90° CW'
end


object mnuRotateTexture: TMainMenu
Caption         =   'Rotate 90° CCW'
end


object mnuSep31: TMainMenu
Caption         =   '-'
end


object mnuFlipTexture: TMainMenu
Caption         =   'Flip Horizontal'
end


object mnuFlipTexture: TMainMenu
Caption         =   'Flip Vertical'
end

end


object mnuSep9: TMainMenu
Caption         =   '-'
end


object mnuAverage: TMainMenu
Caption         =   'Average Vertex Colours'
end


object mnuApplyLight: TMainMenu
Caption         =   'Apply Light to Vertices'
end


object mnuSep17: TMainMenu
Caption         =   '-'
end


object mnuFixedTexture: TMainMenu
Caption         =   'Fixed Texture'
end


object mnuCustomX: TMainMenu
Caption         =   'User Defined X'
end


object mnuCustomY: TMainMenu
Caption         =   'User Defined Y'
end

end


object mnuMenu: TMainMenu
Caption         =   'View'

object mnuZoomIn: TMainMenu
Caption         =   'Zoom In'
end


object mnuZoomOut: TMainMenu
Caption         =   'Zoom Out'
end


object mnuFitOnScreen: TMainMenu
Caption         =   'Fit on Screen'
end


object mnuActualPixels: TMainMenu
Caption         =   'Actual Size'
end


object mnuResetView: TMainMenu
Caption         =   'Reset View'
end


object mnuSep11: TMainMenu
Caption         =   '-'
end


object mnuGrid: TMainMenu
Caption         =   'Show Grid'
end


object mnuSnapToGrid: TMainMenu
Caption         =   'Snap to Grid'
end


object mnuSnapToVerts: TMainMenu
Caption         =   'Snap to Vertices'
end


object mnuSep13: TMainMenu
Caption         =   '-'
end


object mnuBlendWireframe: TMainMenu
Caption         =   'Blend Wireframe'
end


object mnuBlendPolys: TMainMenu
Caption         =   'Blend Polys'
end


object mnuShowSceneryLayers: TMainMenu
Caption         =   'Show Scenery Layers'

object mnuShowSceneryLayer: TMainMenu
Caption         =   'Back'
end


object mnuShowSceneryLayer: TMainMenu
Caption         =   'Middle'
end


object mnuShowSceneryLayer: TMainMenu
Caption         =   'Front'
end

end


object mnuSep14: TMainMenu
Caption         =   '-'
end


object mnuRefreshBG: TMainMenu
Caption         =   'Refresh'
end

end


object mnuMenu: TMainMenu
Caption         =   'Window'

object mnuWorkspace: TMainMenu
Caption         =   'Workspace'

object mnuLoadSpace: TMainMenu
Caption         =   'Load Workspace...'
end


object mnuSaveSpace: TMainMenu
Caption         =   'Save Workspace...'
end


object mnuResetWindows: TMainMenu
Caption         =   'Reset Window Locations'
end

end


object mnuShowAll: TMainMenu
Caption         =   'Show All'
end


object mnuHideAll: TMainMenu
Caption         =   'Hide All'
end


object mnuSep2: TMainMenu
Caption         =   '-'
end


object mnuTools: TMainMenu
Caption         =   'Tools'
end


object mnuDisplay: TMainMenu
Caption         =   'Display'
end


object mnuPalette: TMainMenu
Caption         =   'Palette'
end


object mnuWaypoints: TMainMenu
Caption         =   'Waypoints'
end


object mnuScenery: TMainMenu
Caption         =   'Scenery'
end


object mnuInfo: TMainMenu
Caption         =   'Properties'
end


object mnuTexture: TMainMenu
Caption         =   'Texture'
end

end


object mnuObjects: TMainMenu
Caption         =   'Objects'

object mnuSpawn: TMainMenu
Caption         =   'Player Spawn'
end


object mnuSpawn: TMainMenu
Caption         =   'Alpha Team'
end


object mnuSpawn: TMainMenu
Caption         =   'Bravo Team'
end


object mnuSpawn: TMainMenu
Caption         =   'Charlie Team'
end


object mnuSpawn: TMainMenu
Caption         =   'Delta Team'
end


object mnuSpawn: TMainMenu
Caption         =   'Alpha Flag'
end


object mnuSpawn: TMainMenu
Caption         =   'Bravo Flag'
end


object mnuSpawn: TMainMenu
Caption         =   'Grenade Kit'
end


object mnuSpawn: TMainMenu
Caption         =   'Medikit'
end


object mnuSpawn: TMainMenu
Caption         =   'Cluster Grenades'
end


object mnuSpawn: TMainMenu
Caption         =   'Vest'
end


object mnuSpawn: TMainMenu
Caption         =   'Flame'
end


object mnuSpawn: TMainMenu
Caption         =   'Berserker'
end


object mnuSpawn: TMainMenu
Caption         =   'Predator'
end


object mnuSpawn: TMainMenu
Caption         =   'Point Match Flag'
end


object mnuSpawn: TMainMenu
Caption         =   'Rambo Bow'
end


object mnuSpawn: TMainMenu
Caption         =   'Stat Gun'
end


object mnuSepObj: TMainMenu
Caption         =   '-'
end


object mnuCollider: TMainMenu
Caption         =   'Collider'
end


object mnuSepObj2: TMainMenu
Caption         =   '-'
end


object mnuGostek: TMainMenu
Caption         =   'Gostek'
end

end


object mnuPolyTypes: TMainMenu
Caption         =   'Polygon Types'

object mnuPolyType: TMainMenu
Caption         =   'Normal'
end


object mnuPolyType: TMainMenu
Caption         =   'Only Bullets Collide'
end


object mnuPolyType: TMainMenu
Caption         =   'Only Player Collides'
end


object mnuPolyType: TMainMenu
Caption         =   'Doesn't Collide'
end


object mnuPolyType: TMainMenu
Caption         =   'Ice'
end


object mnuPolyType: TMainMenu
Caption         =   'Deadly'
end


object mnuPolyType: TMainMenu
Caption         =   'Bloody Deadly'
end


object mnuPolyType: TMainMenu
Caption         =   'Hurts'
end


object mnuPolyType: TMainMenu
Caption         =   'Regenerates'
end


object mnuPolyType: TMainMenu
Caption         =   'Lava'
end


object mnuPolyType: TMainMenu
Caption         =   'Red Bullets Collides'
end


object mnuPolyType: TMainMenu
Caption         =   'Red Players Collide'
end


object mnuPolyType: TMainMenu
Caption         =   'Blue Bullets Collides'
end


object mnuPolyType: TMainMenu
Caption         =   'Blue Players Collide'
end


object mnuPolyType: TMainMenu
Caption         =   'Yellow Bullets Collides'
end


object mnuPolyType: TMainMenu
Caption         =   'Yellow Players Collide'
end


object mnuPolyType: TMainMenu
Caption         =   'Green Bullets Collides'
end


object mnuPolyType: TMainMenu
Caption         =   'Green Players Collide'
end


object mnuPolyType: TMainMenu
Caption         =   'Bouncy'
end


object mnuPolyType: TMainMenu
Caption         =   'Explosive'
end


object mnuPolyType: TMainMenu
Caption         =   'Hurts Flaggers'
end


object mnuPolyType: TMainMenu
Caption         =   'Flagger Collides'
end


object mnuPolyType: TMainMenu
Caption         =   'Non-Flagger Collides'
end


object mnuPolyType: TMainMenu
Caption         =   'Flag Collides'
end


object mnuPolyType: TMainMenu
Caption         =   'Background'
end


object mnuPolyType: TMainMenu
Caption         =   'Background Transition'
end


object mnuSep19: TMainMenu
Caption         =   '-'
end


object mnuQuad: TMainMenu
Caption         =   'Textured Quad'
end

end


object mnuMove: TMainMenu
Caption         =   'Move'

object mnuSetRCenter: TMainMenu
Caption         =   'Set Reference Point'
end


object mnuCenterRCenter: TMainMenu
Caption         =   'Center Reference Point'
end


object mnuFixedRCenter: TMainMenu
Caption         =   'Fixed Reference Point'
end

end


object mnuWaypoint: TMainMenu
Caption         =   'Waypoint'

object mnuWayType: TMainMenu
Caption         =   'Left'
end


object mnuWayType: TMainMenu
Caption         =   'Right'
end


object mnuWayType: TMainMenu
Caption         =   'Up'
end


object mnuWayType: TMainMenu
Caption         =   'Down'
end


object mnuWayType: TMainMenu
Caption         =   'Fly'
end

end


object mnuScen: TMainMenu
Caption         =   'Scenery'

object mnuScenTrans: TMainMenu
Caption         =   'Rotate'
end


object mnuScenTrans: TMainMenu
Caption         =   'Scale'
end


object mnuScenSep: TMainMenu
Caption         =   '-'
end


object mnuScenLevel: TMainMenu
Caption         =   'Back'
end


object mnuScenLevel: TMainMenu
Caption         =   'Middle'
end


object mnuScenLevel: TMainMenu
Caption         =   'Front'
end

end


object mnuScenTree: TMainMenu
Caption         =   'Scenery Tree'

object mnuScenList: TMainMenu
Caption         =   '<list name>'
end


object mnuScenRemove: TMainMenu
Caption         =   'Remove from List'
end

end


object mnuVertexSelect: TMainMenu
Caption         =   'VertexSelect'

object mnuVSelDuplicate: TMainMenu
Caption         =   'Duplicate'
end


object mnuVSelCopy: TMainMenu
Caption         =   'Copy'
end


object mnuVSelPaste: TMainMenu
Caption         =   'Paste'
end


object mnuVSelClear: TMainMenu
Caption         =   'Clear'
end


object mnuVSel0: TMainMenu
Caption         =   '-'
end


object mnuVSelArrange: TMainMenu
Caption         =   'Arrange'

object mnuVSelBringToFront: TMainMenu
Caption         =   'Bring To Front'
end


object mnuVSelBringForward: TMainMenu
Caption         =   'Bring Forward'
end


object mnuVSelSendBackward: TMainMenu
Caption         =   'Send Backward'
end


object mnuVSelSendToBack: TMainMenu
Caption         =   'Send To Back'
end

end


object mnuVSelTransform: TMainMenu
Caption         =   'Transform'

object mnuVSelRotate: TMainMenu
Caption         =   'Rotate 180°'
end


object mnuVSelRotate: TMainMenu
Caption         =   'Rotate 90° CW'
end


object mnuVSelRotate: TMainMenu
Caption         =   'Rotate 90° CCW'
end


object mnuVSelSep1: TMainMenu
Caption         =   '-'
end


object mnuVSelFlip: TMainMenu
Caption         =   'Flip Horizontal'
end


object mnuVSelFlip: TMainMenu
Caption         =   'Flip Vertical'
end

end

end

end



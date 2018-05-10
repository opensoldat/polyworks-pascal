unit frmSoldatMapEditor;

// DISCLAIMER!
// ==================================================================
// This source code has been automatically generated.
// It still requires extensive manual fixing, debugging and testing.
// IT IS NOT GUARANTEED TO COMPILE
// AND MUCH LESS TO BEHAVE EXACTLY LIKE THE ORIGINAL SOURCE CODE.
// Use it at your sole risk and discretion.
//

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtCtrls, ComCtrls, Direct3D8, DirectInput, D3DX8;

const
  BufferSize: Longint = 10;
  ColourKey: Longint = $FF00FF00;
  FVF: Longint = 0;// = D3DFVF_XYZRHW or D3DFVF_TEX1 or D3DFVF_DIFFUSE;
  FVF2: Longint = 0; // = D3DFVF_XYZ;
  MAX_POLYS: Smallint = 4000;
  MAX_ZOOM: Single = 16;
  MIN_ZOOM: Single = 0.03125;
  TOOL_MOVE: Byte = 0;
  TOOL_CREATE: Byte = 1;
  TOOL_VSELECT: Byte = 2;
  TOOL_PSELECT: Byte = 3;
  TOOL_VCOLOUR: Byte = 4;
  TOOL_PCOLOUR: Byte = 5;
  TOOL_TEXTURE: Byte = 6;
  TOOL_SCENERY: Byte = 7;
  TOOL_WAYPOINT: Byte = 8;
  TOOL_OBJECTS: Byte = 9;
  TOOL_CLRPICKER: Byte = 10;
  TOOL_SKETCH: Byte = 11;
  TOOL_LIGHTS: Byte = 12;
  TOOL_DEPTHMAP: Byte = 13;
  TOOL_HAND: Byte = 14;
  TOOL_VSELADD: Byte = 15;
  TOOL_VSELSUB: Byte = 16;
  TOOL_PSELADD: Byte = 17;
  TOOL_PSELSUB: Byte = 18;
  TOOL_SCALE: Byte = 19;
  TOOL_ROTATE: Byte = 20;
  TOOL_CONNECT: Byte = 21;
  TOOL_QUAD: Byte = 22;
  TOOL_PIXPICKER: Byte = 23;
  TOOL_LITPICKER: Byte = 24;
  TOOL_ERASER: Byte = 25;
  TOOL_SMUDGE: Byte = 26;
  TOOL_NULL: Byte = 255;
  KEY_SHIFT: Byte = 1;
  KEY_CTRL: Byte = 2;
  KEY_ALT: Byte = 4;

type
  TfrmSoldatMapEditor = class(TForm)
    //commonDialog: MSComDlg.CommonDialog;  // TODO: finde replacement
    frmSoldatMapEditor: TForm;
    ImageList: TImageList;  //ImageList: MSComctlLib.ImageList;
    lblCurrentTool: TLabel;
    lblFileName: TLabel;
    lblMousePosition: TLabel;
    lblZoom: TLabel;
    mnuActualPixels: TMenuItem;
    mnuApplyLight: TMenuItem;
    mnuArrange: TMenuItem;
    mnuAverage: TMenuItem;
    mnuBlendPolys: TMenuItem;
    mnuBlendWireframe: TMenuItem;
    mnuBringForward: TMenuItem;
    mnuBringToFront: TMenuItem;
    mnuCenterRCenter: TMenuItem;
    mnuClear: TMenuItem;
    mnuClrSketch: TMenuItem;
    mnuCollider: TMenuItem;
    mnuCompile: TMenuItem;
    mnuCompileAs: TMenuItem;
    mnuCopy: TMenuItem;
    mnuCreate: TMenuItem;
    mnuCustomX: TMenuItem;
    mnuCustomY: TMenuItem;
    mnuDeselect: TMenuItem;
    mnuDisplay: TMenuItem;
    mnuDuplicate: TMenuItem;
    mnuExit: TMenuItem;
    mnuExport: TMenuItem;
    mnuFitOnScreen: TMenuItem;
    mnuFixedRCenter: TMenuItem;
    mnuFixedTexture: TMenuItem;
    mnuFixTexture: TMenuItem;
    mnuFlip_1: TMenuItem;
    mnuFlip_0: TMenuItem;
    mnuFlipTexture_1: TMenuItem;
    mnuFlipTexture_0: TMenuItem;
    mnuGostek: TMenuItem;
    mnuGrid: TMenuItem;
    mnuHideAll: TMenuItem;
    mnuImport: TMenuItem;
    mnuInfo: TMenuItem;
    mnuInvertSel: TMenuItem;
    mnuJoinVertices: TMenuItem;
    mnuLoadSpace: TMenuItem;
    mnuMap: TMenuItem;
    mnuMenu_4: TMenuItem;
    mnuMenu_3: TMenuItem;
    mnuMenu_2: TMenuItem;
    mnuMenu_1: TMenuItem;
    mnuMenu_0: TMenuItem;
    mnuMove: TMenuItem;
    mnuNew: TMenuItem;
    mnuObjects: TMenuItem;
    mnuOpen: TMenuItem;
    mnuOpenCompiled: TMenuItem;
    mnuPalette: TMenuItem;
    mnuPaste: TMenuItem;
    mnuPolyType_25: TMenuItem;
    mnuPolyType_24: TMenuItem;
    mnuPolyType_23: TMenuItem;
    mnuPolyType_22: TMenuItem;
    mnuPolyType_21: TMenuItem;
    mnuPolyType_20: TMenuItem;
    mnuPolyType_19: TMenuItem;
    mnuPolyType_18: TMenuItem;
    mnuPolyType_17: TMenuItem;
    mnuPolyType_16: TMenuItem;
    mnuPolyType_15: TMenuItem;
    mnuPolyType_14: TMenuItem;
    mnuPolyType_13: TMenuItem;
    mnuPolyType_12: TMenuItem;
    mnuPolyType_11: TMenuItem;
    mnuPolyType_10: TMenuItem;
    mnuPolyType_9: TMenuItem;
    mnuPolyType_8: TMenuItem;
    mnuPolyType_7: TMenuItem;
    mnuPolyType_6: TMenuItem;
    mnuPolyType_5: TMenuItem;
    mnuPolyType_4: TMenuItem;
    mnuPolyType_3: TMenuItem;
    mnuPolyType_2: TMenuItem;
    mnuPolyType_1: TMenuItem;
    mnuPolyType_0: TMenuItem;
    mnuPolyTypes: TMenuItem;
    mnuPreferences: TMenuItem;
    mnuQuad: TMenuItem;
    mnuRecent_9: TMenuItem;
    mnuRecent_8: TMenuItem;
    mnuRecent_7: TMenuItem;
    mnuRecent_6: TMenuItem;
    mnuRecent_5: TMenuItem;
    mnuRecent_4: TMenuItem;
    mnuRecent_3: TMenuItem;
    mnuRecent_2: TMenuItem;
    mnuRecent_1: TMenuItem;
    mnuRecent_0: TMenuItem;
    mnuRecentFiles: TMenuItem;
    mnuRedo: TMenuItem;
    mnuRefreshBG: TMenuItem;
    mnuResetView: TMenuItem;
    mnuResetWindows: TMenuItem;
    mnuRotate_2: TMenuItem;
    mnuRotate_1: TMenuItem;
    mnuRotate_0: TMenuItem;
    mnuRotateTexture_2: TMenuItem;
    mnuRotateTexture_1: TMenuItem;
    mnuRotateTexture_0: TMenuItem;
    mnuRunSoldat: TMenuItem;
    mnuSave: TMenuItem;
    mnuSaveAs: TMenuItem;
    mnuSaveSpace: TMenuItem;
    mnuScen: TMenuItem;
    mnuScenery: TMenuItem;
    mnuScenLevel_2: TMenuItem;
    mnuScenLevel_1: TMenuItem;
    mnuScenLevel_0: TMenuItem;
    mnuScenList: TMenuItem;
    mnuScenRemove: TMenuItem;
    mnuScenSep: TMenuItem;
    mnuScenTrans_1: TMenuItem;
    mnuScenTrans_0: TMenuItem;
    mnuScenTree: TMenuItem;
    mnuSelColour: TMenuItem;
    mnuSelectAll: TMenuItem;
    mnuSendBackward: TMenuItem;
    mnuSendToBack: TMenuItem;
    mnuSep1: TMenuItem;
    mnuSep10: TMenuItem;
    mnuSep11: TMenuItem;
    mnuSep12: TMenuItem;
    mnuSep13: TMenuItem;
    mnuSep14: TMenuItem;
    mnuSep15: TMenuItem;
    mnuSep16: TMenuItem;
    mnuSep17: TMenuItem;
    mnuSep18: TMenuItem;
    mnuSep19: TMenuItem;
    mnuSep2: TMenuItem;
    mnuSep20: TMenuItem;
    mnuSep21: TMenuItem;
    mnuSep3: TMenuItem;
    mnuSep30: TMenuItem;
    mnuSep31: TMenuItem;
    mnuSep32: TMenuItem;
    mnuSep5: TMenuItem;
    mnuSep6: TMenuItem;
    mnuSep8: TMenuItem;
    mnuSep9: TMenuItem;
    mnuSepObj: TMenuItem;
    mnuSepObj2: TMenuItem;
    mnuSetRCenter: TMenuItem;
    mnuSever: TMenuItem;
    mnuShowAll: TMenuItem;
    mnuShowSceneryLayer_2: TMenuItem;
    mnuShowSceneryLayer_1: TMenuItem;
    mnuShowSceneryLayer_0: TMenuItem;
    mnuShowSceneryLayers: TMenuItem;
    mnuSnapSelected: TMenuItem;
    mnuSnapToGrid: TMenuItem;
    mnuSnapToVerts: TMenuItem;
    mnuSpawn_16: TMenuItem;
    mnuSpawn_15: TMenuItem;
    mnuSpawn_14: TMenuItem;
    mnuSpawn_13: TMenuItem;
    mnuSpawn_12: TMenuItem;
    mnuSpawn_11: TMenuItem;
    mnuSpawn_10: TMenuItem;
    mnuSpawn_9: TMenuItem;
    mnuSpawn_8: TMenuItem;
    mnuSpawn_7: TMenuItem;
    mnuSpawn_6: TMenuItem;
    mnuSpawn_5: TMenuItem;
    mnuSpawn_4: TMenuItem;
    mnuSpawn_3: TMenuItem;
    mnuSpawn_2: TMenuItem;
    mnuSpawn_1: TMenuItem;
    mnuSpawn_0: TMenuItem;
    mnuSplit: TMenuItem;
    mnuTexture: TMenuItem;
    mnuTools: TMenuItem;
    mnuTransform: TMenuItem;
    mnuTransformTexture: TMenuItem;
    mnuUndo: TMenuItem;
    mnuUntexture: TMenuItem;
    mnuVertexSelect: TMenuItem;
    mnuVSel0: TMenuItem;
    mnuVSelArrange: TMenuItem;
    mnuVSelBringForward: TMenuItem;
    mnuVSelBringToFront: TMenuItem;
    mnuVSelClear: TMenuItem;
    mnuVSelCopy: TMenuItem;
    mnuVSelDuplicate: TMenuItem;
    mnuVSelFlip_1: TMenuItem;
    mnuVSelFlip_0: TMenuItem;
    mnuVSelPaste: TMenuItem;
    mnuVSelRotate_2: TMenuItem;
    mnuVSelRotate_1: TMenuItem;
    mnuVSelRotate_0: TMenuItem;
    mnuVSelSendBackward: TMenuItem;
    mnuVSelSendToBack: TMenuItem;
    mnuVSelSep1: TMenuItem;
    mnuVSelTransform: TMenuItem;
    mnuWaypoint: TMenuItem;
    mnuWaypoints: TMenuItem;
    mnuWayType_4: TMenuItem;
    mnuWayType_3: TMenuItem;
    mnuWayType_2: TMenuItem;
    mnuWayType_1: TMenuItem;
    mnuWayType_0: TMenuItem;
    mnuWorkspace: TMenuItem;
    mnuZoomIn: TMenuItem;
    mnuZoomOut: TMenuItem;
    //MouseHelper: MBMouseHelper.MouseHelper;  // TODO: find replacement
    picButtonGfx: TPaintBox;
    picExit: TPaintBox;
    picGfx: TPaintBox;
    picHelp: TPaintBox;
    picMaximize: TPaintBox;
    picMenu_0: TPaintBox;
    picMenu_3: TPaintBox;
    picMenu_1: TPaintBox;
    picMenu_2: TPaintBox;
    picMenu_4: TPaintBox;
    picMenuBar: TPaintBox;
    picMinimize: TPaintBox;
    picProgress: TPaintBox;
    picStatus: TPaintBox;
    picTitle: TPaintBox;
    tvwScenery: TTreeView; //MSComctlLib.TreeView;
    txtZoom: TEdit;
  private
    DX: DirectX8;  // TODO: replace
    D3D: Direct3D8;  // TODO: replace
    D3DDevice: Direct3DDevice8;
    DI: DirectInput8;
    DIDevice: DirectInputDevice8;
    DIState: DIKEYBOARDSTATE;
    hEvent: Longint;
    D3DX: D3DX8;
    mapTexture: Direct3DTexture8;
    particleTexture: Direct3DTexture8;
    patternTexture: Direct3DTexture8;
    objectsTexture: Direct3DTexture8;
    lineTexture: Direct3DTexture8;
    pathTexture: Direct3DTexture8;
    rCenterTexture: Direct3DTexture8;
    sketchTexture: Direct3DTexture8;
    renderTarget: Direct3DTexture8;
    renderSurface: Direct3DSurface8;
    backBuffer: Direct3DSurface8;
    scenerySprite: D3DXSprite;
    //--------
    Version: Longint;
    Polys: array of TPolygon;
    PolyCoords: array of TTriangle;
    Scenery: array of TScenery;
    SceneryTextures: array of TextureData;
    Spawns: array of TSpawnPoint;
    Colliders: array of TCollider;
    Waypoints: array of TWaypoint;
    Connections: array of TConnection;
    Lights: array of TLightSource;
    Options: TOptions;
    polyCount: Longint;
    sceneryCount: Longint;
    sceneryElements: Longint;
    spawnPoints: Longint;
    colliderCount: Longint;
    waypointCount: Longint;
    conCount: Smallint;
    lightCount: Smallint;
    fmapTitle: widestring;
    ftextureFile: widestring;
    maxX: Single;
    maxY: Single;
    minX: Single;
    minY: Single;
    bgPolys: array[1..4] of TCustomVertex;
    bgPolyCoords: array[1..4] of D3DVECTOR2;
    bgColours: array[1..2] of TColour;
    //--------
    sketch: array of TSketchLine;
    sketchLines: Smallint;
    selectedSketch: array[1..2] of Smallint;
    circleOn: Boolean;
    leftMouseDown: Boolean;
    initialized: Boolean;
    initialized2: Boolean;
    acquired: Boolean;
    selectionChanged: Boolean;
    clrPolys: Boolean;
    clrWireframe: Boolean;
    sslBack: Boolean;
    sslMid: Boolean;
    sslFront: Boolean;
    fbackClr: Longint;
    fpointClr: Longint;
    fselectionClr: Longint;
    fgridClr: Longint;
    fgridClr2: Longint;
    fpolyBlendSrc: Longint;
    fpolyBlendDest: Longint;
    fwireBlendSrc: Longint;
    fwireBlendDest: Longint;
    fsoldatDir: widestring;
    funcompDir: widestring;
    fprefabDir: widestring;
    fgridSpacing: Smallint;
    fgridDivisions: Smallint;
    fgridOp1: Byte;
    fgridOp2: Byte;
    noRedraw: Boolean;
    fsceneryVerts: Boolean;
    ftopmost: Boolean;
    fformHeight: Smallint;
    fformWidth: Smallint;
    fformLeft: Smallint;
    fformTop: Smallint;
    polyClr: TColour;
    opacity: Single;
    blendMode: Smallint;
    scrollCoords: array[1..2] of D3DVECTOR2;  //coordinates for scrolling
    mouseCoords: D3DVECTOR2;  //coordinates of mouse
    moveCoords: array[1..2] of D3DVECTOR2;  //coordinates for moving vertices
    selectedCoords: array[1..2] of D3DVECTOR2;  //coordinates of selected area
    selectedPolys: TSmallIntDynArray;  //list of selected polys and verts
    vertexList: array of TVertexData;  //list of polys with selected verts
    numVerts: Smallint;  //number of current vertex being created
    numCorners: Smallint;  //number of corner of scenery being created
    numSelectedPolys: Smallint;
    numSelectedScenery: Smallint;  //number of currently selected scenery
    numSelColliders: Smallint;
    numSelSpawns: Smallint;
    numSelWaypoints: Smallint;
    numSelLights: Smallint;
    fxTexture: Smallint;
    fyTexture: Smallint;
    creatingQuad: Boolean;
    currentFileName: widestring;
    prompt: Boolean;
    toolAction: Boolean;
    spaceDown: Boolean;
    currentScenery: widestring;
    zoomFactor: Single;
    pointRadius: Smallint;
    snapRadius: Smallint;
    clrRadius: Smallint;
    ohSnap: Boolean;
    snapToGrid: Boolean;
    fixedTexture: Boolean;
    showBG: Boolean;
    showPolys: Boolean;
    showTexture: Boolean;
    showWireframe: Boolean;
    showPoints: Boolean;
    showScenery: Boolean;
    showObjects: Boolean;
    showGrid: Boolean;
    showWaypoints: Boolean;
    showPath1: Boolean;
    showPath2: Boolean;
    showSketch: Boolean;
    showLights: Boolean;
    currentTool: Byte;
    currentFunction: Byte;
    particleSize: Single;
    colourMode: Byte;
    eraseCircle: Boolean;
    eraseLines: Boolean;
    polyType: Byte;
    PolyTypeClrs: array[0..25] of Longint;
    fshiftDown: Boolean;
    fctrlDown: Boolean;
    faltDown: Boolean;
    rCenter: D3DVECTOR2;
    selRect: array[0..3] of D3DVECTOR2;  // RECT
    xGridLines: array of TLine;
    yGridLines: array of TLine;
    inc: Single;
    scaleDiff: D3DVECTOR2;
    rDiff: Single;
    gostek: D3DVECTOR2;
    imageInfo: TImageInfo;
    textureDesc: D3DSURFACE_DESC;
    noneSelected: Boolean;
    currentUndo: Smallint;
    numUndo: Smallint;
    numRedo: Smallint;
    max_undo: Smallint;
    lastCompiled: widestring;
    currentWaypoint: Smallint;
    objTexSize: D3DVECTOR2;
    procedure Form_Load;
    procedure SetCursor(var Index: Smallint);
    procedure centerView;
    procedure InitDInput;
    function checkLoaded(var sceneryName: widestring): Smallint;
    function getMapDimensions: widestring;
    function getMapArea: Longint;
    procedure SaveFile(var FileName: widestring);
    procedure SaveUndo;
    procedure loadUndo(var redo: Boolean);
    function isInSector(var Index: Smallint; var X: Smallint; var Y: Smallint; div: Longint): Boolean;
    function isInSector2(var Index: Smallint; var X: Smallint; var Y: Smallint; var div: Longint): Smallint;
    function SegXHorizSeg(var A1: D3DVECTOR2; var B1: D3DVECTOR2; var A2: D3DVECTOR2; var length: Longint): Boolean;
    function SegXVertSeg(var A1: D3DVECTOR2; var B1: D3DVECTOR2; var A2: D3DVECTOR2; var length: Longint): Boolean;
    function segmentsIntersect(x1: Smallint; y1: Smallint; x2: Smallint; y2: Smallint; A1: Smallint; B1: Smallint; A2: Smallint; B2: Smallint): Boolean;
    function SegXSeg(var A1: D3DVECTOR2; var B1: D3DVECTOR2; var A2: D3DVECTOR2; var B2: D3DVECTOR2): Boolean;
    function isBetween(var p1: olevariant; var p2: olevariant; var p3: olevariant): Boolean;
    procedure initGrid;
    procedure setGrid;
    function CreateCustomVertex(X: Single; Y: Single; var z: Single; var rhw: Single; var Color: Longint; var tu: Single; var tv: Single): TCustomVertex;
    function ExModeActive: Boolean;
    function getRGB(var DecValue: Longint): TColour;
    function getAlpha(var tehColour: Longint): Byte;
    function ARGB(alphaVal: Byte; var clrVal: Longint): Longint;
    function makeColour(var red: Byte; var green: Byte; var blue: Byte): TColour;
    procedure DirectXEvent8_DXCallback(eventid: Longint);
    procedure TabPressed;
    procedure findDragPoint(var X: Single; var Y: Single);
    procedure findDragPoint2(var X: Single; var Y: Single);
    function checkDragPoint(var x1: Single; var y1: Single; var x2: Single; var y2: Single): Boolean;
    procedure Form_DblClick;
    procedure Form_MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure CreateLight(var X: Single; var Y: Single);
    procedure applyLights(var toSel: Boolean{ = false});
    procedure applyLightsToVert(var pIndex: Smallint; var vIndex: Smallint);
    procedure SnapSelection;
    function GetVertSnapCoord(var PolyNum: Smallint; var VertNum: Smallint; var GetXVal: Boolean): Smallint;
    procedure AverageVerts;
    procedure AverageVertices;
    procedure MouseDownMove(var X: Single; var Y: Single);
    procedure SelNearest(var X: Single; var Y: Single);
    procedure CreatingPoly(var Shift: Smallint; var X: Single; var Y: Single);
    procedure Form_MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure CreatingScenery(var Shift: Smallint; var X: Single; var Y: Single);
    function ConstrainAngle(var xDiff: Smallint; var yDiff: Smallint): D3DVECTOR2;
    procedure Scrolling(var X: Single; var Y: Single);
    procedure Moving(X: Single; Y: Single);
    procedure Scaling(X: Single; Y: Single; var constrained: Boolean);
    procedure ApplyTransform(var Rotating: Boolean);
    function GetAngle(xVal: Single; yVal: Single): Single;
    procedure Rotating(var X: Single; var Y: Single; var constrained: Boolean);
    procedure PrecisionColouring(var X: Single; var Y: Single);
    procedure VertexColouring(var X: Single; var Y: Single);
    procedure EditDepthMap(var X: Single; var Y: Single);
    procedure ColourPicker(var X: Single; var Y: Single);
    procedure depthPicker(var X: Single; var Y: Single);
    procedure lightPicker(var X: Single; var Y: Single);
    procedure StretchingTexture(var X: Single; var Y: Single);
    procedure Form_MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure CreateConnection(var X: Single; var Y: Single);
    procedure CreatePolys(var X: Single; var Y: Single);
    procedure startSketch(var X: Single; var Y: Single);
    procedure lineSketch(var X: Single; var Y: Single);
    procedure linkSketch(var X: Single; var Y: Single);
    procedure endSketch(var X: Single; var Y: Single);
    procedure CreateScenery(var X: Single; var Y: Single);
    procedure snapSelected(var X: Single; var Y: Single);
    procedure regionSelection(var X: Single; var Y: Single);
    function RegionSelPolys(var X: Single; var Y: Single): Boolean;
    function RegionSelObjects(var xVal: Single; var yVal: Single; var skipSel: Boolean): Boolean;
    function regionSelLights(var xVal: Single; var yVal: Single; var skipSel: Boolean): Boolean;
    function RegionSelWaypoints(var xVal: Single; var yVal: Single; var skipSel: Boolean): Boolean;
    function eraseSketch(var X: Single; var Y: Single): Byte;
    function moveLines(var X: Single; var Y: Single; var xDiff: Single; var yDiff: Single): Byte;
    procedure deleteSmallLines;
    procedure VertexSelection(var X: Single; var Y: Single);
    procedure VertexSelPolys;
    procedure VertexSelScenery;
    procedure VertexSelObjects;
    procedure VertexSelLights;
    procedure VertexSelWaypoints;
    procedure getRCenter;
    procedure compareRect(xVal: Smallint; yVal: Smallint);
    procedure vertexSelAlt(var X: Single; var Y: Single);
    procedure polySelection(var X: Single; var Y: Single);
    function PointInProp(X: Single; Y: Single; var Index: Smallint): Boolean;
    procedure ColourFill(var X: Single; var Y: Single);
    function applyBlend(var dClr: TColour): TColour;
    function diffVal(var val1: Byte; var val2: Byte): Byte;
    function lowerVal(var val1: Byte; var val2: Byte): Byte;
    function higherVal(var val1: Byte; var val2: Byte): Byte;
    function snapVertexToGrid(coord: Single; var offset: Single): Single;
    procedure deletePolys;
    function nearCoord(mouseCoord: Single; polyCoord: Single; range: Single): Boolean;
    function inSelRect(X: Single; Y: Single): Boolean;
    procedure mnuClrSketch_Click;
    procedure mnuCopy_Click;
    procedure mnuVSelBringForward_Click;
    procedure mnuVSelBringToFront_Click;
    procedure mnuVSelClear_Click;
    procedure mnuVSelCopy_Click;
    procedure mnuFlip_Click(var Index: Smallint);
    procedure mnuFlipTexture_Click(var Index: Smallint);
    procedure mnuInvertSel_Click;
    procedure mnuPaste_Click;
    procedure mnuRecent_Click(var Index: Smallint);
    procedure updateRecent(var FileName: widestring);
    procedure mnuResetView_Click;
    procedure mnuRotate_Click(var Index: Smallint);
    procedure mnuRotateTexture_Click(var Index: Smallint);
    procedure mnuSetRCenter_Click;
    procedure mnuFixedRCenter_Click;
    procedure mnuCenterRCenter_Click;
    procedure mnuShowSceneryLayer_Click(var Index: Smallint);
    procedure mnuSnapSelected_Click;
    procedure mnuVSelDuplicate_Click;
    procedure mnuVSelFlip_Click(var Index: Smallint);
    procedure mnuVSelPaste_Click;
    procedure mnuVSelRotate_Click(var Index: Smallint);
    procedure mnuVSelSendBackward_Click;
    procedure mnuVSelSendToBack_Click;
    procedure mnuWayType_Click(var Index: Smallint);
    procedure tvwScenery_Expand(Node: MSComctlLib.Node);
    procedure tvwScenery_MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure mnuScenList_Click;
    procedure mnuScenRemove_Click;
    function confirmExists(var FileName: widestring): Boolean;
    procedure txtZoom_KeyPress(var KeyAscii: Smallint);
    procedure txtZoom_LostFocus;
    function getZoomDir(var zoomDir: Single): Single;
    function pointInPoly(X: Single; Y: Single; i: Smallint): Boolean;
    function isCW(i: Smallint): Boolean;
    function Midpoint(p1: Single; p2: Single): Single;
    procedure setLightsMode(var lightsOn: Boolean);
    procedure Form_OLEDragDrop(var Data: DataObject; var Effect: Longint; var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure Form_Resize;
    procedure MouseHelper_MouseWheel(var ctrl: olevariant; var Direction: MBMouseHelper.mbDirectionConstants; var Button: Longint; var Shift: Longint; var Cancel: Boolean);
    procedure saveSettings;
    procedure saveWindow(var sectionName: widestring; var window: TForm; var collapsed: Boolean; var FileName: widestring{ = 'current.ini'});
    function SetIdePath: olevariant;
    procedure loadINI;
    function getNextValue(var sectionString: widestring; var eIndex: Smallint): widestring;
    procedure loadWorkspace(var FileName: widestring{ = 'current.ini'});
    procedure mnuExit_Click;
    procedure mnuNew_Click;
    procedure mnuOpen_Click;
    procedure mnuOpenCompiled_Click;
    procedure mnuSave_Click;
    procedure mnuSaveAs_Click;
    procedure mnuCompile_Click;
    procedure mnuCompileAs_Click;
    function recentFiles(var FileName: widestring): Boolean;
    procedure mnuExport_Click;
    procedure mnuImport_Click;
    procedure savePrefab(var FileName: widestring);
    procedure loadPrefab(var FileName: widestring);
    procedure mnuRunSoldat_Click;
    procedure SetMapList(var FileName: widestring);
    procedure mnuUndo_Click;
    procedure mnuRedo_Click;
    procedure mnuDuplicate_Click;
    procedure mnuClear_Click;
    procedure mnuSelectAll_Click;
    procedure mnuDeselect_Click;
    procedure mnuSelColour_Click;
    procedure mnuBringToFront_Click;
    procedure mnuSendToBack_Click;
    procedure mnuBringForward_Click;
    procedure mnuSendBackward_Click;
    procedure mnuFixTexture_Click;
    procedure mnuUntexture_Click;
    procedure mnuVisible_Click;
    procedure mnuAverage_Click;
    procedure mnuApplyLight_Click;
    procedure mnuSplit_Click;
    procedure mnuJoinVertices_Click;
    procedure mnuCreate_Click;
    procedure mnuSever_Click;
    procedure mnuRefreshBG_Click;
    procedure mnuPreferences_Click;
    procedure mnuMap_Click;
    procedure mnuZoomIn_Click;
    procedure mnuZoomOut_Click;
    procedure mnuGrid_Click;
    procedure mnuSnapToGrid_Click;
    procedure mnuRefresh_Click;
    procedure mnuTools_Click;
    procedure mnuDisplay_Click;
    procedure mnuPalette_Click;
    procedure mnuWaypoints_Click;
    procedure mnuScenery_Click;
    procedure mnuinfo_Click;
    procedure mnuTexture_Click;
    procedure mnuBlendWireframe_Click;
    procedure mnuBlendPolys_Click;
    procedure mnuFixedTexture_Click;
    procedure mnuSnapToVerts_Click;
    procedure mnuLoadSpace_Click;
    procedure mnuSaveSpace_Click;
    procedure mnuResetWindows_Click;
    procedure mnuShowAll_Click;
    procedure mnuHideAll_Click;
    procedure mnuGostek_Click;
    procedure mnuCollider_Click;
    procedure mnuSpawn_Click(var Index: Smallint);
    procedure mnuPolyType_Click(var Index: Smallint);
    procedure mnuQuad_Click;
    procedure mnuCustomX_Click;
    procedure mnuCustomY_Click;
    procedure mnuFitOnScreen_Click;
    procedure mnuActualPixels_Click;
    procedure mnuScenTrans_Click(var Index: Smallint);
    procedure picMenu_MouseDown(var Index: Smallint; var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure picMenu_MouseMove(var Index: Smallint; var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure picHelp_MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure picHelp_MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure picHelp_MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure picMaximize_MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure picMaximize_MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure picMaximize_MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure picMinimize_MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure picMinimize_MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure picExit_MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure picExit_MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure picExit_MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure picStatus_Click;
    procedure picTitle_DblClick;
    procedure picTitle_MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
    procedure AutoTexture;
    procedure SetTextureCoords(var X: Single; var Y: Single; var z: Single; var tu: Single; var tv: Single);
public
procedure loadCursors;
procedure initGfx;
procedure Init;
procedure resetDevice;
procedure RegainFocus;
procedure newMap;
procedure LoadFile(var FileName: widestring);
procedure setMapData;
procedure setCurrentScenery(var styleVal: Smallint{ = -1}; var sceneryName: widestring{ = ''});
procedure setCurrentTexture(var sceneryName: widestring);
procedure setSceneryLevel(level: Byte);
procedure CreateSceneryTexture(var sceneryName: widestring);
procedure RefreshSceneryTextures(var Index: Smallint);
procedure SaveAndCompile(var FileName: widestring);
procedure Render;
function FtoDW(var f: Single): Longint;
procedure applyScale(var tehXvalue: Single; var tehYvalue: Single);
procedure applyRotate(var tehValue: Single);
procedure tvwScenery_NodeClick(Node: MSComctlLib.Node);
procedure Zoom(var zoomDir: Single);
procedure zoomScroll(var zoomDir: Single; X: Smallint; Y: Smallint);
procedure setDispOptions(var layerNum: Smallint; var value: Boolean);
procedure setColourMode(clrVal: Byte);
procedure setCurrentTool(Index: Smallint);
function setTempTool(var toolNum: Byte): Byte;
procedure setMapTexture(var texturePath: widestring);
procedure setPolyColour(var Index: Smallint; var value: Byte);
procedure setPaletteColour(var red: Byte; var green: Byte; var blue: Byte);
procedure setBlendMode(var Index: Smallint);
function getColour: Longint;
procedure getOptions;
procedure setOptions;
procedure Form_Paint;
procedure Terminate;
procedure setPreferences;
function setBGColour(var Index: Smallint): Longint;
procedure setLightColour;
procedure setRadius(var R: Smallint);
function setWayType(var Index: Smallint; var tehValue: Boolean): Boolean;
procedure setPathNum(var tehValue: Byte);
function setSpecial(var tehValue: Byte): Boolean;
procedure setShowPaths;
procedure ClearUnused;
procedure loadColours;
procedure getInfo;
procedure applyPolyType(Index: Smallint);
procedure applyTextureCoords(tehValue: Single; var Index: Smallint);
procedure applyVertexAlpha(var tehValue: Single);
procedure applyBounciness(var tehValue: Single);
procedure applySceneryProp(tehValue: Single; var Index: Smallint);
procedure applyLightProp(tehValue: Single; var Index: Smallint);
procedure SetColours;
procedure picMinimize_MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
property mapTitle: widestring read fmapTitle write fmapTitle;
property textureFile: widestring read ftextureFile write ftextureFile;
property backClr: Longint read fbackClr write fbackClr;
property pointClr: Longint read fpointClr write fpointClr;
property selectionClr: Longint read fselectionClr write fselectionClr;
property gridClr: Longint read fgridClr write fgridClr;
property gridClr2: Longint read fgridClr2 write fgridClr2;
property polyBlendSrc: Longint read fpolyBlendSrc write fpolyBlendSrc;
property polyBlendDest: Longint read fpolyBlendDest write fpolyBlendDest;
property wireBlendSrc: Longint read fwireBlendSrc write fwireBlendSrc;
property wireBlendDest: Longint read fwireBlendDest write fwireBlendDest;
property soldatDir: widestring read fsoldatDir write fsoldatDir;
property uncompDir: widestring read funcompDir write funcompDir;
property prefabDir: widestring read fprefabDir write fprefabDir;
property gridSpacing: Smallint read fgridSpacing write fgridSpacing;
property gridDivisions: Smallint read fgridDivisions write fgridDivisions;
property gridOp1: Byte read fgridOp1 write fgridOp1;
property gridOp2: Byte read fgridOp2 write fgridOp2;
property sceneryVerts: Boolean read fsceneryVerts write fsceneryVerts;
property topmost: Boolean read ftopmost write ftopmost;
property formHeight: Smallint read fformHeight write fformHeight;
property formWidth: Smallint read fformWidth write fformWidth;
property formLeft: Smallint read fformLeft write fformLeft;
property formTop: Smallint read fformTop write fformTop;
property xTexture: Smallint read fxTexture write fxTexture;
property yTexture: Smallint read fyTexture write fyTexture;
property shiftDown: Boolean read fshiftDown write fshiftDown;
property ctrlDown: Boolean read fctrlDown write fctrlDown;
property altDown: Boolean read faltDown write faltDown;
end;

implementation

{$R *.DFM}

type
  //-------- TYPES --------
  TImageInfo =
  packed record
    Width: Smallint;
    miplevels: Smallint;
    Height: Smallint;
    depth: Smallint;
  end;

  TColour =
  packed record
    red: Byte;
    green: Byte;
    blue: Byte;
  end;

  TVertexData =
  packed record
    vertex: array[1..3] of Byte;
    polyType: Byte;
    colour: array[1..3] of TColour;
  end;

  TTriangle =
  packed record
    vertex: array[1..3] of D3DVECTOR2;
  end;

  TLightSource =
  packed record
    selected: Byte;
    colour: TColour;
    intensity: Single;
    range: Smallint;
    X: Single;
    Y: Single;
    z: Single;
  end;

  //-------- MAP TYPES --------
  TCustomVertex =
  packed record
    X: Single;
    Y: Single;
    z: Single;
    rhw: Single;
    Color: Longint;
    tu: Single;
    tv: Single;
  end;

  TSketchVertex =
  packed record
    X: Single;
    Y: Single;
    z: Single;
  end;

  TSketchLine =
  packed record
    vertex: array[1..2] of TSketchVertex;
  end;

  TVertexHit =
  packed record
    X: Single;  //sin of angle
    Y: Single;  //cos of angle
    z: Single;  //0
  end;

  TPolyHit =
  packed record
    vertex: array[1..3] of TVertexHit;
  end;

  TPolygon =
  packed record
    vertex: array[1..3] of TCustomVertex;
    Perp: TPolyHit;
  end;

  TLine =
  packed record
    vertex: array[1..2] of TCustomVertex;
  end;

  TProp =
  packed record
    active: wordbool;
    Style: Smallint;
    Width: Longint;
    Height: Longint;
    X: Single;
    Y: Single;
    rotation: Single;
    ScaleX: Single;
    ScaleY: Single;
    alpha: Longint;
    Color: Longint;
    level: Longint;
  end;

  TScenery =
  packed record
    Style: Smallint;
    Translation: D3DVECTOR2;
    rotation: Single;
    Scaling: D3DVECTOR2;
    alpha: Byte;
    Color: Longint;
    level: Byte;
    selected: Byte;
    screenTr: D3DVECTOR2;
  end;

  TSpawnPoint =
  packed record
    active: Longint;  //Boolean
    X: Single;
    Y: Single;
    Team: Longint;
  end;

  TSaveSpawnPoint =
  packed record
    active: Longint;  //Boolean
    X: Longint;
    Y: Longint;
    Team: Longint;
  end;

  TCollider =
  packed record
    active: Longint;  //Boolean
    X: Single;
    Y: Single;
    radius: Single;
  end;

  TOptions =
  packed record
    mapName: array[0..38] of Byte;  //String * 39
    textureName: array[0..24] of Byte;  //String * 25
    BackgroundColor: Longint;
    BackgroundColor2: Longint;
    StartJet: Longint;
    GrenadePacks: Byte;
    Medikits: Byte;
    Weather: Byte;
    Steps: Byte;
    MapRandomID: Longint;  //Integer
  end;

  TMapFile_Polygon =
  packed record
    Poly: TPolygon;
    polyType: Byte;
  end;

  TMapFile_Scenery =
  packed record
    sceneryName: array[0..50] of Byte;
    Date: Longint;
  end;

  TextureData =
  packed record
    Width: Smallint;
    Height: Smallint;
    reScale: D3DVECTOR2;
    Texture: Direct3DTexture8;
  end;

  TNewWaypoint =
  packed record
    active: Longint;
    id: Longint;
    X: Longint;
    Y: Longint;
    left: Byte;
    right: Byte;
    up: Byte;
    down: Byte;
    m2: Byte;
    pathNum: Byte;
    special: Byte;
    crap: array[1..5] of Byte;
    connectionsNum: Longint;
    Connections: array[1..20] of Longint;
  end;

  TWaypoint =
  packed record
    tempIndex: Smallint;
    selected: wordbool;
    X: Single;
    Y: Single;
    wayType: array[0..4] of wordbool;
    special: Byte;
    pathNum: Byte;
    numConnections: Byte;
  end;

  TConnection =
  packed record
    point1: Smallint;
    point2: Smallint;
  end;

procedure TfrmSoldatMapEditor.Form_Load;
var
  i: Smallint;
  temp: widestring;
  err: widestring;
  label
  ErrorHandler;
  begin
    //ON ERROR
    initialized := false;
    loadINI;
    loadWorkspace;
    loadColours;
    err := 'Error setting colours';
    self.SetColours;
    self.Show;
    err := 'Error setting directories';
    if (length(Dir(uncompDir)) = 0) or (uncompDir = '') then
      begin
        uncompDir := appPath + '\Maps\';
      end;
      if (length(Dir(prefabDir)) = 0) or (prefabDir = '') then
        begin
          prefabDir := appPath + '\Prefabs\';
        end;
        //if given directory doesn't exist, change to default
        if (length(Dir(soldatDir + 'Textures\')) = 0) or (soldatDir = '') then
          begin
            temp := GetSoldatDir;
            if (temp <> '') then
              begin
                soldatDir := temp;
                temp := '';
              end;
            end;
            frmTools.initTool(currentTool);
            initGfx;
            err := 'Error loading cursors';
            loadCursors;
            err := 'Error initializing values';
            //init values
            scrollCoords[2].X := -self.ScaleWidth / 2;
            scrollCoords[2].Y := -self.ScaleHeight / 2;
            pointRadius := 4;
            particleSize := pointRadius * 2;
            zoomFactor := 1;
            scaleDiff.X := 1;
            scaleDiff.Y := 1;
            sslBack := true;
            sslMid := true;
            sslFront := true;
            PolyTypeClrs[0] := selectionClr;
            setlength(Scenery, 0);
            setlength(SceneryTextures, 0);
            setlength(Spawns, 0);
            setlength(Colliders, 0);
            setlength(sketch, 0);
            sketch[0].vertex[1].z := 1;
            sketch[0].vertex[2].z := 1;
            Colliders[0].radius := clrRadius;
            err := 'Error initializing colour picker';
            frmColour.picClr.Cls;
            frmColour.InitClr(polyClr.red, polyClr.green, polyClr.blue);
            err := 'Error setting current tool icon (' + currentTool + ')';
            currentFunction := currentTool;
            err := 'Error initializing grid';
            initGrid;
            err := 'Error initializing D3D';
            initialized2 := false;
            Init;
            err := 'Error initializing DInput';
            InitDInput;
            err := 'Error setting up palette windows';
            //show windows
            frmTaskBar.Show;
            frmTools.Show(0, frmSoldatMapEditor);
            frmPalette.Show(0, frmSoldatMapEditor);
            frmDisplay.Show(0, frmSoldatMapEditor);
            frmWaypoints.Show(0, frmSoldatMapEditor);
            frmScenery.Show(0, frmSoldatMapEditor);
            frmInfo.Show(0, frmSoldatMapEditor);
            frmTexture.Show(0, frmSoldatMapEditor);
            //set window settings
            frmDisplay.Visible := mnuDisplay.Checked;
            frmWaypoints.Visible := mnuWaypoints.Checked;
            frmPalette.Visible := mnuPalette.Checked;
            frmTools.Visible := mnuTools.Checked;
            frmScenery.Visible := mnuScenery.Checked;
            frmInfo.Visible := mnuInfo.Checked;
            frmTexture.Visible := mnuTexture.Checked;
            frmPalette.refreshPalette(clrRadius, opacity, blendMode, colourMode);
            frmPalette.setValues(polyClr.red, polyClr.green, polyClr.blue);
            frmDisplay.setLayer(0, showBG);
            frmDisplay.setLayer(1, showPolys);
            frmDisplay.setLayer(2, showTexture);
            frmDisplay.setLayer(3, showWireframe);
            frmDisplay.setLayer(4, showPoints);
            frmDisplay.setLayer(5, showScenery);
            frmDisplay.setLayer(6, showObjects);
            frmDisplay.setLayer(7, showWaypoints);
            frmDisplay.setLayer(8, showGrid);
            frmDisplay.setLayer(9, showLights);
            frmDisplay.setLayer(10, showSketch);
            mnuFixedTexture.Checked := fixedTexture;
            mnuSnapToGrid.Checked := snapToGrid;
            mnuSnapToVerts.Checked := ohSnap;
            lblCurrentTool.Caption := frmSoldatMapEditor.ImageList.ListImages(currentFunction + 1).Tag;
            frmSoldatMapEditor.commonDialog.Filter := 'Map File (*.pms)|*.pms';
            commonDialog.Flags := cdlOFNOverwritePrompt or cdlOFNPathMustExist or cdlOFNFileMustExist;
            err := 'Error parsing command line args';
            temp := Command;
            if (RightStr(temp, 1) = '"') then
              begin
                temp := LeftStr(temp, length(temp) - 1);
                temp := RightStr(temp, length(temp) - 1);
              end;
              newMap;
              if (LowerCase(RightStr(temp, 4)) = '.pms') then
                begin
                  if (Dir(temp) <> '') then
                    begin
                      LoadFile(temp);
                    end
                  else
                    if (Dir(appPath + '\Maps\' + temp) <> '') then
                      begin
                        LoadFile(appPath + '\Maps\' + temp);
                      end
                    else
                      if (Dir(soldatDir + 'Maps\' + temp) <> '') then
                        begin
                          LoadFile(soldatDir + 'Maps\' + temp);
                        end;
                      end;
                      err := 'Error acquiring input device';
                      self.SetFocus;
                      DIDevice.Acquire;
                      acquired := true;
                      Exit;
                      ErrorHandler:
                        Application.MessageBox(pchar('Error loading' + vbNewLine + err + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
                    end;

procedure TfrmSoldatMapEditor.SetCursor(var Index: Smallint);
label
ErrorHandler;
begin
  //ON ERROR
  self.MouseIcon := frmSoldatMapEditor.ImageList.ListImages(Index).Picture;
  Exit;
  ErrorHandler:
    Application.MessageBox(pchar('Error setting cursor' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
end;

procedure TfrmSoldatMapEditor.loadCursors;
label
ErrorHandler;
begin
  //On Error Resume Next
  //ON ERROR
  ImageList.ListImages.Clear;
  //load cursors
  ImageList.ListImages.Add(TOOL_MOVE + 1, 'move', LoadPicture(appPath + '\' + gfxDir + '\cursors\move.cur'));
  ImageList.ListImages.Add(TOOL_CREATE + 1, 'create', LoadPicture(appPath + '\' + gfxDir + '\cursors\create.cur'));
  ImageList.ListImages.Add(TOOL_VSELECT + 1, 'vselect', LoadPicture(appPath + '\' + gfxDir + '\cursors\vselect.cur'));
  ImageList.ListImages.Add(TOOL_PSELECT + 1, 'pselect', LoadPicture(appPath + '\' + gfxDir + '\cursors\pselect.cur'));
  ImageList.ListImages.Add(TOOL_VCOLOUR + 1, 'vcolour', LoadPicture(appPath + '\' + gfxDir + '\cursors\vcolour.cur'));
  ImageList.ListImages.Add(TOOL_PCOLOUR + 1, 'pcolour', LoadPicture(appPath + '\' + gfxDir + '\cursors\pcolour.cur'));
  ImageList.ListImages.Add(TOOL_TEXTURE + 1, 'texture', LoadPicture(appPath + '\' + gfxDir + '\cursors\texture.cur'));
  ImageList.ListImages.Add(TOOL_SCENERY + 1, 'scenery', LoadPicture(appPath + '\' + gfxDir + '\cursors\scenery.cur'));
  ImageList.ListImages.Add(TOOL_WAYPOINT + 1, 'waypoint', LoadPicture(appPath + '\' + gfxDir + '\cursors\waypoint.cur'));
  ImageList.ListImages.Add(TOOL_OBJECTS + 1, 'objects', LoadPicture(appPath + '\' + gfxDir + '\cursors\objects.cur'));
  ImageList.ListImages.Add(TOOL_CLRPICKER + 1, 'clrpicker', LoadPicture(appPath + '\' + gfxDir + '\cursors\clrpicker.cur'));
  ImageList.ListImages.Add(TOOL_SKETCH + 1, 'sketch', LoadPicture(appPath + '\' + gfxDir + '\cursors\sketch.cur'));
  ImageList.ListImages.Add(TOOL_LIGHTS + 1, 'lights', LoadPicture(appPath + '\' + gfxDir + '\cursors\light.cur'));
  ImageList.ListImages.Add(TOOL_DEPTHMAP + 1, 'depthmap', LoadPicture(appPath + '\' + gfxDir + '\cursors\depthmap.cur'));
  ImageList.ListImages.Add(TOOL_HAND + 1, 'hand', LoadPicture(appPath + '\' + gfxDir + '\cursors\hand.cur'));
  ImageList.ListImages.Add(TOOL_VSELADD + 1, 'vseladd', LoadPicture(appPath + '\' + gfxDir + '\cursors\vseladd.cur'));
  ImageList.ListImages.Add(TOOL_VSELSUB + 1, 'vselsub', LoadPicture(appPath + '\' + gfxDir + '\cursors\vselsub.cur'));
  ImageList.ListImages.Add(TOOL_PSELADD + 1, 'pseladd', LoadPicture(appPath + '\' + gfxDir + '\cursors\pseladd.cur'));
  ImageList.ListImages.Add(TOOL_PSELSUB + 1, 'pselsub', LoadPicture(appPath + '\' + gfxDir + '\cursors\pselsub.cur'));
  ImageList.ListImages.Add(TOOL_SCALE + 1, 'scale', LoadPicture(appPath + '\' + gfxDir + '\cursors\scale.cur'));
  ImageList.ListImages.Add(TOOL_ROTATE + 1, 'rotate', LoadPicture(appPath + '\' + gfxDir + '\cursors\rotate.cur'));
  ImageList.ListImages.Add(TOOL_CONNECT + 1, 'connect', LoadPicture(appPath + '\' + gfxDir + '\cursors\connect.cur'));
  ImageList.ListImages.Add(TOOL_QUAD + 1, 'quad', LoadPicture(appPath + '\' + gfxDir + '\cursors\quad.cur'));
  ImageList.ListImages.Add(TOOL_PIXPICKER + 1, 'pixpicker', LoadPicture(appPath + '\' + gfxDir + '\cursors\pixpicker.cur'));
  ImageList.ListImages.Add(TOOL_LITPICKER + 1, 'litpicker', LoadPicture(appPath + '\' + gfxDir + '\cursors\litpicker.cur'));
  ImageList.ListImages.Add(TOOL_ERASER + 1, 'eraser', LoadPicture(appPath + '\' + gfxDir + '\cursors\eraser.cur'));
  ImageList.ListImages.Add(TOOL_SMUDGE + 1, 'smudge', LoadPicture(appPath + '\' + gfxDir + '\cursors\smudge.cur'));
  ImageList.ListImages.Item(TOOL_MOVE + 1).Tag := 'Move Selection';
  ImageList.ListImages.Item(TOOL_CREATE + 1).Tag := 'Create Polygons';
  ImageList.ListImages.Item(TOOL_VSELECT + 1).Tag := 'Select Vertices';
  ImageList.ListImages.Item(TOOL_PSELECT + 1).Tag := 'Select Polygons';
  ImageList.ListImages.Item(TOOL_VCOLOUR + 1).Tag := 'Colour Vertices';
  ImageList.ListImages.Item(TOOL_PCOLOUR + 1).Tag := 'Colour Polygons';
  ImageList.ListImages.Item(TOOL_TEXTURE + 1).Tag := 'Transform Texture';
  ImageList.ListImages.Item(TOOL_SCENERY + 1).Tag := 'Create Scenery';
  ImageList.ListImages.Item(TOOL_WAYPOINT + 1).Tag := 'Create Waypoints';
  ImageList.ListImages.Item(TOOL_OBJECTS + 1).Tag := 'Place Spawn Points or Colliders';
  ImageList.ListImages.Item(TOOL_CLRPICKER + 1).Tag := 'Pick a Vertex Colour';
  ImageList.ListImages.Item(TOOL_SKETCH + 1).Tag := 'Sketch';
  ImageList.ListImages.Item(TOOL_LIGHTS + 1).Tag := 'Create Lights';
  ImageList.ListImages.Item(TOOL_DEPTHMAP + 1).Tag := 'Edit Depth Map';
  ImageList.ListImages.Item(TOOL_HAND + 1).Tag := 'Scroll Map';
  ImageList.ListImages.Item(TOOL_VSELADD + 1).Tag := 'Add to Selection';
  ImageList.ListImages.Item(TOOL_VSELSUB + 1).Tag := 'Subtract from Selection';
  ImageList.ListImages.Item(TOOL_PSELADD + 1).Tag := 'Add to Selection';
  ImageList.ListImages.Item(TOOL_PSELSUB + 1).Tag := 'Subtract from Selection';
  ImageList.ListImages.Item(TOOL_SCALE + 1).Tag := 'Scale Selection';
  ImageList.ListImages.Item(TOOL_ROTATE + 1).Tag := 'Rotate Selection';
  ImageList.ListImages.Item(TOOL_CONNECT + 1).Tag := 'Connect Waypoints';
  ImageList.ListImages.Item(TOOL_QUAD + 1).Tag := 'Create Quad';
  ImageList.ListImages.Item(TOOL_PIXPICKER + 1).Tag := 'Pick a pixel colour';
  ImageList.ListImages.Item(TOOL_LITPICKER + 1).Tag := 'Pick a Lit Vertex Colour';
  ImageList.ListImages.Item(TOOL_ERASER + 1).Tag := 'Erase Lines';
  ImageList.ListImages.Item(TOOL_SMUDGE + 1).Tag := 'Move Lines';
  Exit;
  ErrorHandler:
    Application.MessageBox(pchar('Error loading cursors' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
end;

procedure TfrmSoldatMapEditor.initGfx;
var
  i: Smallint;
begin
  picTitle.Picture := LoadPicture(appPath + '\' + gfxDir + '\titlebar_main.bmp');
  picGfx.Picture := LoadPicture(appPath + '\' + gfxDir + '\tool_gfx.bmp');
  picButtonGfx.Picture := LoadPicture(appPath + '\' + gfxDir + '\button_gfx.bmp');
  //draw control box buttons
  mouseEvent2(picExit, 0, 0, BUTTON_SMALL, 0, BUTTON_UP);
  mouseEvent2(picMaximize, 0, 0, BUTTON_SMALL, (self.WindowState = 0), BUTTON_UP);
  mouseEvent2(picMinimize, 0, 0, BUTTON_SMALL, 0, BUTTON_UP);
  mouseEvent2(picHelp, 0, 0, BUTTON_SMALL, 0, BUTTON_UP);
  //draw menu buttons
  for i := 0 to 4 do
  begin
    mouseEvent2(picMenu(i), 0, 0, BUTTON_MENU, 0, BUTTON_UP);
  end;
end;

procedure TfrmSoldatMapEditor.centerView;
var
  i: Smallint;
begin
  if (polyCount > 0) then
    begin
      for i := 1 to polyCount do
      begin
        Polys[i].vertex[1].X := (PolyCoords[i].vertex[1].X - scrollCoords[2].X) * zoomFactor;
        Polys[i].vertex[1].Y := (PolyCoords[i].vertex[1].Y - scrollCoords[2].Y) * zoomFactor;
        Polys[i].vertex[2].X := (PolyCoords[i].vertex[2].X - scrollCoords[2].X) * zoomFactor;
        Polys[i].vertex[2].Y := (PolyCoords[i].vertex[2].Y - scrollCoords[2].Y) * zoomFactor;
        Polys[i].vertex[3].X := (PolyCoords[i].vertex[3].X - scrollCoords[2].X) * zoomFactor;
        Polys[i].vertex[3].Y := (PolyCoords[i].vertex[3].Y - scrollCoords[2].Y) * zoomFactor;
      end;
    end;
    for i := 1 to 4 do
    begin
      bgPolys[i].X := bgPolyCoords[i].X - scrollCoords[2].X * zoomFactor;
      bgPolys[i].Y := bgPolyCoords[i].Y - scrollCoords[2].Y * zoomFactor;
    end;
  end;

procedure TfrmSoldatMapEditor.Init;
var
  DispMode: D3DDISPLAYMODE;
  D3DWindow: D3DPRESENT_PARAMETERS;
  debugVal: widestring;
  label
  ErrorHandler;
  begin
    //ON ERROR
    initialized := false;
    noRedraw := false;
    selectionChanged := false;
    debugVal := 'Error creating Direct3D objects';
    if not initialized2 then
      begin
        D3DX := {UNIMPLEMENTED};
        DX := {UNIMPLEMENTED};
        D3D := DX.Direct3DCreate;
        initialized2 := true;
      end;
      debugVal := 'Error getting display mode';
      D3D.GetAdapterDisplayMode(D3DADAPTER_DEFAULT, DispMode);
      D3DWindow.Windowed := 1;
      D3DWindow.SwapEffect := D3DSWAPEFFECT_COPY;
      D3DWindow.BackBufferFormat := D3DFMT_A8R8G8B8;
      debugVal := 'Error creating D3D device';
      D3DDevice := D3D.CreateDevice(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, self.hWnd, D3DCREATE_SOFTWARE_VERTEXPROCESSING, D3DWindow); //Main screen turn on.
      debugVal := 'Error setting render states';
      D3DDevice.SetVertexShader(FVF);
      D3DDevice.SetRenderState(D3DRS_LIGHTING, false);
      D3DDevice.SetRenderState(D3DRS_CULLMODE, D3DCULL_NONE); //polys that are ccw
      D3DDevice.SetRenderState(D3DRS_POINTSPRITE_ENABLE, 1);
      D3DDevice.SetRenderState(D3DRS_POINTSCALE_ENABLE, 1);
      D3DDevice.SetRenderState(D3DRS_POINTSIZE, FtoDW(particleSize));
      D3DDevice.SetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_MODULATE);
      D3DDevice.SetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE);
      D3DDevice.SetTextureStageState(0, D3DTSS_ALPHAARG2, D3DTA_DIFFUSE);
      renderTarget := D3DX.CreateTexture(D3DDevice, 256, 256, D3DX_DEFAULT, D3DUSAGE_RENDERTARGET, D3DFMT_A8R8G8B8, D3DPOOL_DEFAULT);
      renderSurface := renderTarget.GetSurfaceLevel(0);
      backBuffer := D3DDevice.GetBackBuffer(0, D3DBACKBUFFER_TYPE_MONO);
      debugVal := 'Error creating pattern texture';
      patternTexture := D3DX.CreateTextureFromFile(D3DDevice, appPath + '\' + gfxDir + '\pattern.bmp');
      debugVal := 'Error creating objects texture';
      //----
      objectsTexture := D3DX.CreateTextureFromFileEx(D3DDevice, appPath + '\' + gfxDir + '\objects.bmp', D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_LINEAR, D3DX_FILTER_POINT, ColourKey, 0, 0);
      objectsTexture.GetLevelDesc(0, textureDesc);
      objTexSize.X := textureDesc.Width;
      objTexSize.Y := textureDesc.Height;
      //----
      debugVal := 'Error creating scenery not found texture';
      SceneryTextures[0].Texture := D3DX.CreateTextureFromFileEx(D3DDevice, appPath + '\' + gfxDir + '\notfound.bmp', D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, 0, 0);
      SceneryTextures[0].Texture.GetLevelDesc(0, textureDesc);
      SceneryTextures[0].Width := imageInfo.Width;
      SceneryTextures[0].Height := imageInfo.Height;
      SceneryTextures[0].reScale.X := SceneryTextures[0].Width / textureDesc.Width;
      SceneryTextures[0].reScale.Y := SceneryTextures[0].Height / textureDesc.Height;
      if (SceneryTextures[0].reScale.X = 0) or (SceneryTextures[0].reScale.Y = 0) then
        begin
          SceneryTextures[0].reScale.X := 1;
          SceneryTextures[0].reScale.Y := 1;
        end;
        debugVal := 'Error creating line texture';
        lineTexture := D3DX.CreateTextureFromFileEx(D3DDevice, appPath + '\' + gfxDir + '\lines.bmp', D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, 0, 0);
        debugVal := 'Error creating path texture';
        pathTexture := D3DX.CreateTextureFromFileEx(D3DDevice, appPath + '\' + gfxDir + '\path.png', D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, 0, 0);
        debugVal := 'Error creating rotation center texture';
        rCenterTexture := D3DX.CreateTextureFromFileEx(D3DDevice, appPath + '\' + gfxDir + '\rcenter.bmp', D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, 0, 0);
        debugVal := 'Error creating sketch texture';
        sketchTexture := D3DX.CreateTextureFromFileEx(D3DDevice, appPath + '\' + gfxDir + '\sketch.bmp', D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, 0, 0);
        debugVal := 'Error creating scenery sprite';
        scenerySprite := D3DX.CreateSprite(D3DDevice);
        debugVal := 'Error creating particle texture';
        particleTexture := D3DX.CreateTextureFromFileEx(D3DDevice, appPath + '\' + gfxDir + '\vertex8x8.bmp', 8, 8, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, 0, 0);
        initialized := true;
        Exit;
        ErrorHandler:
          if (D3DX = nil) then
          begin
            Application.MessageBox(pchar('Direct3D initialization failed' + vbNewLine + debugVal + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
          end
        else
        begin
          Application.MessageBox(pchar('Direct3D initialization failed' + vbNewLine + D3DX.GetErrorString(Err.Number) + vbNewLine + debugVal), pchar(''), MB_OK) {HelpFile:None, Context:None};
        end;
      end;

procedure TfrmSoldatMapEditor.InitDInput;
var
  tehValue: widestring;
  i: Longint;
  DevProp: DIPROPLONG;
  DevInfo: DirectInputDeviceInstance8;
  pBuffer: array[0..BufferSize] of DIDEVICEOBJECTDATA;
  label
  ErrorHandler;
  begin
    //ON ERROR
    tehValue := 'Error creating DI device';
    DI := DX.DirectInputCreate;
    DIDevice := DI.CreateDevice('GUID_SysKeyboard');
    tehValue := 'Error setting DI device';
    DIDevice.SetCommonDataFormat(DIFORMAT_KEYBOARD);
    DIDevice.SetCooperativeLevel(self.hWnd, DISCL_NONEXCLUSIVE or DISCL_FOREGROUND);
    tehValue := 'Error setting DI properties';
    DevProp.lHow := DIPH_DEVICE;
    DevProp.lData := BufferSize;
    DIDevice.SetProperty(DIPROP_BUFFERSIZE, DevProp);
    tehValue := 'Error setting DI device notification';
    hEvent := DX.CreateEvent(self);
    DIDevice.SetEventNotification(hEvent);
    tehValue := 'Error getting device info';
    DevInfo := DIDevice.GetDeviceInfo;
    tehValue := 'Error acquiring device';
    self.SetFocus;
    DIDevice.Acquire;
    acquired := true;
    Exit;
    ErrorHandler:
      if (tehValue <> 'Error acquiring device') then
      begin
        Application.MessageBox(pchar('DirectInput initialization failed' + vbNewLine + D3DX.GetErrorString(Err.Number) + vbNewLine + tehValue), pchar(''), MB_OK) {HelpFile:None, Context:None};
      end;
    end;

procedure TfrmSoldatMapEditor.resetDevice;
var
  DispMode: D3DDISPLAYMODE;
  D3DWindow: D3DPRESENT_PARAMETERS;
  i: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    D3D.GetAdapterDisplayMode(D3DADAPTER_DEFAULT, DispMode);
    D3DWindow.Windowed := 1;
    D3DWindow.SwapEffect := D3DSWAPEFFECT_COPY;
    D3DWindow.BackBufferFormat := D3DFMT_A8R8G8B8;
    noRedraw := true;
    if selectionChanged then
      begin
        SaveUndo;
        selectionChanged := false;
      end;
      SaveUndo;
      mnuSelectAll_Click;
      deletePolys;
      mapTexture := nil;
      particleTexture := nil;
      patternTexture := nil;
      sketchTexture := nil;
      lineTexture := nil;
      pathTexture := nil;
      rCenterTexture := nil;
      D3DDevice := nil;
      Init;
      for i := 1 to frmScenery.lstScenery.ListCount do
      begin
        RefreshSceneryTextures(i);
      end;
      setMapTexture(textureFile);
      D3DDevice.SetVertexShader(FVF);
      D3DDevice.SetRenderState(D3DRS_LIGHTING, false);
      D3DDevice.SetRenderState(D3DRS_CULLMODE, D3DCULL_NONE); //polys that are ccwise
      D3DDevice.SetRenderState(D3DRS_POINTSPRITE_ENABLE, 1);
      D3DDevice.SetRenderState(D3DRS_POINTSCALE_ENABLE, 1);
      D3DDevice.SetRenderState(D3DRS_POINTSIZE, FtoDW(particleSize));
      D3DDevice.SetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_MODULATE);
      D3DDevice.SetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE);
      D3DDevice.SetTextureStageState(0, D3DTSS_ALPHAARG2, D3DTA_DIFFUSE);
      initGrid;
      initialized := true;
      loadUndo(false);
      loadUndo(false);
      noRedraw := false;
      Render;
      Exit;
      ErrorHandler:
        Application.MessageBox(pchar('Error resetting device' + vbNewLine + D3DX.GetErrorString(Err.Number)), pchar(''), MB_OK) {HelpFile:None, Context:None};
    end;

procedure TfrmSoldatMapEditor.RegainFocus;
begin
  //ON ERROR
  self.SetFocus;
  DIDevice.Acquire;
  acquired := true;
  ctrlDown := false;
  altDown := false;
  shiftDown := false;
  SetCursor(currentFunction + 1);
end;

procedure TfrmSoldatMapEditor.newMap;
var
  i: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    prompt := false;
    Version := 11;
    commonDialog.FileName := '';
    numVerts := 0;
    toolAction := false;
    mapTitle := 'New Soldat Map';
    Options.BackgroundColor := ARGB(255, RGB(224, 224, 224));
    Options.BackgroundColor2 := ARGB(255, RGB(32, 32, 32));
    Options.textureName[0] := 0;
    Options.MapRandomID := 0;
    Options.GrenadePacks := 5;
    Options.Medikits := 5;
    Options.StartJet := 190;
    Options.Steps := 0;
    Options.Weather := 0;
    numSelectedPolys := 0;
    setlength(selectedPolys, 0);
    setlength(vertexList, 0);
    polyCount := 0;
    setlength(Polys, 0);
    setlength(vertexList, 0);
    setlength(PolyCoords, 0);
    sceneryCount := 0;
    setlength(Scenery, 0);
    sceneryElements := 0;
    setlength(SceneryTextures, 0);
    frmScenery.lstScenery.Clear;
    setCurrentScenery(0);
    tvwScenery.Nodes.Remove('In Use');
    tvwScenery.Nodes.Add('Master List', tvwFirst, 'In Use', 'In Use');
    spawnPoints := 0;
    colliderCount := 0;
    setlength(Spawns, 0);
    setlength(Colliders, 0);
    Colliders[0].radius := clrRadius;
    waypointCount := 0;
    setlength(Waypoints, 0);
    conCount := 0;
    setlength(Connections, 0);
    lightCount := 0;
    setlength(Lights, 0);
    sketchLines := 0;
    setlength(sketch, 0);
    bgColours[1] := makeColour(224, 224, 224);
    bgColours[2] := makeColour(32, 32, 32);
    maxX := 0;
    maxY := 0;
    minX := 0;
    minY := 0;
    bgPolys[1] := CreateCustomVertex(-640, -640, 1, 1, RGB(bgColours[1].blue, bgColours[1].green, bgColours[1].red), 0, 0);
    bgPolys[2] := CreateCustomVertex(-640, 640, 1, 1, RGB(bgColours[2].blue, bgColours[2].green, bgColours[2].red), 0, 0);
    bgPolys[3] := CreateCustomVertex(640, -640, 1, 1, RGB(bgColours[1].blue, bgColours[1].green, bgColours[1].red), 0, 0);
    bgPolys[4] := CreateCustomVertex(640, 640, 1, 1, RGB(bgColours[2].blue, bgColours[2].green, bgColours[2].red), 0, 0);
    for i := 1 to 4 do
    begin
      bgPolyCoords[i].X := bgPolys[i].X;
      bgPolyCoords[i].Y := bgPolys[i].Y;
    end;
    scrollCoords[1].X := 0;
    scrollCoords[1].Y := 0;
    scrollCoords[2].X := -self.ScaleWidth / 2 - 1;
    scrollCoords[2].Y := -self.ScaleHeight / 2 - 1;
    zoomFactor := 1;
    setMapData;
    txtZoom.Text := Floor(zoomFactor * 1000 + 0.5) / 10 + '%';
    if (length(Dir(soldatDir + 'Textures\' + textureFile)) <> 0) then
      begin
        setMapTexture(textureFile);
        frmTexture.setTexture(textureFile);
      end
    else
    begin
      mapTexture := nil;
    end;
    currentFileName := 'Untitled.pms';
    lblFileName.Caption := 'Untitled.pms';
    centerView;
    numUndo := 0;
    numRedo := 0;
    currentUndo := 0;
    SaveUndo;
    Render;
    Exit;
    ErrorHandler:
      Application.MessageBox(pchar('error creating new file' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
  end;

procedure TfrmSoldatMapEditor.LoadFile(var FileName: widestring);
const
  SECTOR_NUM: Longint = 25;
var
  errorVal: widestring;
  fileOpen: Boolean;
  i: Smallint;
  j: Smallint;
  k: Smallint;
  temp: Longint;
  tempString: widestring;
  polyIndex: Smallint;
  polysInSector: Smallint;
  Scenery_New: TMapFile_Scenery;
  newWaypoint: TNewWaypoint;
  Prop: TProp;
  spawn: TSaveSpawnPoint;
  toTGARes: Longint;
  offset: Smallint;
  scenIndex: Smallint;
  firstOccurence: Smallint;
  loadName: widestring;
  label
  ErrorHandler;
  begin
    //ON ERROR
    prompt := false;
    scrollCoords[1].X := 0;
    scrollCoords[1].Y := 0;
    scrollCoords[2].X := -self.ScaleWidth / 2;
    scrollCoords[2].Y := -self.ScaleHeight / 2;
    zoomFactor := 1;
    toolAction := false;
    numVerts := 0;
    sceneryCount := 0;
    sceneryElements := 0;
    frmScenery.lstScenery.Clear;
    tvwScenery.Nodes.Remove('In Use');
    tvwScenery.Nodes.Add('Master List', tvwFirst, 'In Use', 'In Use');
    numSelectedPolys := 0;
    setlength(selectedPolys, numSelectedPolys);
    currentFileName := '';
    for i := 0 to length(FileName) - 1 do
    begin
      if (Copy(FileName, length(FileName) - i, 1) <> '\') then
        begin
          currentFileName := Copy(FileName, length(FileName) - i, 1) + currentFileName;
        end
      else
      begin
        Break;
      end;
    end;
    lblFileName.Caption := currentFileName;
    Assign(file1, FileName);
    Reset(file1);
    fileOpen := true;
    errorVal := 'Error loading polys';
    maxX := 0;
    maxY := 0;
    minX := 0;
    minY := 0;
    Read(file1, Version);
    Read(file1, Options);
    Read(file1, polyCount);
    setlength(Polys, polyCount + 1);
    setlength(PolyCoords, polyCount + 1);
    setlength(vertexList, polyCount + 1);
    for i := 1 to polyCount do
    begin
      Read(file1, Polys(i));
      Read(file1, vertexList(i).polyType);
      for j := 1 to 3 do
      begin
        PolyCoords[i].vertex[j].X := Polys[i].vertex[j].X;
        PolyCoords[i].vertex[j].Y := Polys[i].vertex[j].Y;
        vertexList[i].colour[j] := getRGB(Polys[i].vertex[j].Color);
        if (PolyCoords[i].vertex[j].X > maxX) then
          begin
            maxX := PolyCoords[i].vertex[j].X;
          end;
          if (PolyCoords[i].vertex[j].X < minX) then
            begin
              minX := PolyCoords[i].vertex[j].X;
            end;
            if (PolyCoords[i].vertex[j].Y > maxY) then
              begin
                maxY := PolyCoords[i].vertex[j].Y;
              end;
              if (PolyCoords[i].vertex[j].Y < minY) then
                begin
                  minY := PolyCoords[i].vertex[j].Y;
                end;
                Polys[i].Perp.vertex(j).z := Sqr(sqr(Polys[i].Perp.vertex(j).X) + sqr(Polys[i].Perp.vertex(j).Y));
              end;
            end;
            Read(file1, temp); //sectorsdivision
            Read(file1, temp); //num sectors
            for i := -SECTOR_NUM to SECTOR_NUM do
            begin
              for j := -SECTOR_NUM to SECTOR_NUM do
              begin
                Read(file1, polysInSector); //number of polys in sector
                for k := 1 to polysInSector do //for each poly in sector
                begin
                  Read(file1, polyIndex); //load and discard poly index
                end;
              end;
            end;
            errorVal := 'Error loading scenery';
            Read(file1, sceneryCount);
            setlength(Scenery, sceneryCount);
            if (sceneryCount > 0) then
              begin
                offset := 0;
                for i := 1 to sceneryCount do
                begin
                  Read(file1, Prop);
                  if (Prop.X > 32766) or (Prop.X < -32766) or (Prop.Y > 32766) or (Prop.Y < -32766) then
                    begin
                      offset := offset + 1;
                    end
                  else
                    if (Prop.Width < 0) or (Prop.Height < 0) or (Floor(Prop.ScaleX * 1000) = 0) or (Floor(Prop.ScaleY * 1000) = 0) then
                      begin
                        offset := offset + 1;
                      end
                    else
                      if (Prop.ScaleX < -10000) or (Prop.ScaleX > 10000) or (Prop.ScaleY < -10000) or (Prop.ScaleY > 10000) then
                        begin
                          offset := offset + 1;
                        end
                      else
                        if (Prop.Style < 1) then
                          begin
                            offset := offset + 1;
                          end
                        else
                        begin
                          Scenery[i - offset].Style := Prop.Style;
                          Scenery[i - offset].Translation.X := Prop.X;
                          Scenery[i - offset].Translation.Y := Prop.Y;
                          Scenery[i - offset].screenTr.X := (Prop.X - scrollCoords[2].X) * zoomFactor;
                          Scenery[i - offset].screenTr.Y := (Prop.Y - scrollCoords[2].Y) * zoomFactor;
                          Scenery[i - offset].rotation := Prop.rotation;
                          Scenery[i - offset].Scaling.X := Prop.ScaleX;
                          Scenery[i - offset].Scaling.Y := Prop.ScaleY;
                          if (Prop.alpha < 1) then
                            begin
                              Scenery[i - offset].alpha := 255;
                            end
                          else
                            if (Prop.alpha <= 255) then
                              begin
                                Scenery[i - offset].alpha := Prop.alpha;
                              end
                            else
                            begin
                              Scenery[i - offset].alpha := 255;
                            end;
                            Scenery[i - offset].Color := Prop.Color;
                            if (Prop.level <= 255) and (Prop.level >= 0) then
                              begin
                                Scenery[i - offset].level := Prop.level;
                              end
                            else
                            begin
                              Scenery[i - offset].level := 0;
                            end;
                            Scenery[i - offset].Color := ARGB(Scenery[i - offset].alpha, Scenery[i - offset].Color);
                          end;
                        end;
                        sceneryCount := sceneryCount - offset;
                      end;
                      setlength(Scenery, sceneryCount);
                      errorVal := 'Error loading scenery elements';
                      offset := 0;
                      Read(file1, sceneryElements);
                      setlength(SceneryTextures, sceneryElements);
                      if (sceneryElements > 0) and (sceneryElements < 500) then
                        begin
                          for i := 1 to sceneryElements do
                          begin
                            tempString := '';
                            Read(file1, Scenery_New);
                            for j := 1 to Scenery_New.sceneryName[0] do
                            begin
                              tempString := tempString + Chr(Scenery_New.sceneryName[j]);
                            end;
                            if (tempString = '') then
                              begin
                                SceneryTextures[i].Texture := D3DX.CreateTextureFromFileEx(D3DDevice, appPath + '\' + gfxDir + '\notfound.bmp', D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, imageInfo, 0);
                                frmScenery.lstScenery.AddItem(tempString);
                                tvwScenery.Nodes.Add('In Use', tvwChild, tempString, tempString);
                              end
                            else
                              if (checkLoaded(tempString) > -1) then
                                begin
                                  loadName := soldatDir + 'Scenery-gfx\' + tempString;
                                  toTGARes := GifToBmp(loadName, appPath + '\Temp\gif.tga');
                                  if (RightStr(loadName, 4) = '.gif') then
                                    begin
                                      loadName := appPath + '\Temp\gif.tga';
                                    end;
                                    if (toTGARes = -1) then
                                      begin
                                        SceneryTextures[i].Texture := D3DX.CreateTextureFromFileEx(D3DDevice, loadName, D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, imageInfo, 0);
                                      end
                                    else
                                    begin
                                      SceneryTextures[i].Texture := D3DX.CreateTextureFromFileEx(D3DDevice, appPath + '\' + gfxDir + '\notfound.bmp', D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, imageInfo, 0);
                                    end;
                                    frmScenery.lstScenery.AddItem(tempString);
                                    tvwScenery.Nodes.Add('In Use', tvwChild, Unassigned, tempString);
                                  end
                                else
                                  if confirmExists(tempString) //if scenery texture is in master list then
                                    begin
                                      loadName := soldatDir + 'Scenery-gfx\' + tempString;
                                      toTGARes := GifToBmp(loadName, appPath + '\Temp\gif.tga');
                                      if (RightStr(loadName, 4) = '.gif') then
                                        begin
                                          loadName := appPath + '\Temp\gif.tga';
                                        end;
                                        if (toTGARes = -1) then
                                          begin
                                            SceneryTextures[i].Texture := D3DX.CreateTextureFromFileEx(D3DDevice, loadName, D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, imageInfo, 0);
                                          end
                                        else
                                        begin
                                          SceneryTextures[i].Texture := D3DX.CreateTextureFromFileEx(D3DDevice, appPath + '\' + gfxDir + '\notfound.bmp', D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, imageInfo, 0);
                                        end;
                                        frmScenery.lstScenery.AddItem(tempString);
                                        tvwScenery.Nodes.Add('In Use', tvwChild, tempString, tempString);
                                      end
                                    else
                                    begin
                                      SceneryTextures[i].Texture := D3DX.CreateTextureFromFileEx(D3DDevice, appPath + '\' + gfxDir + '\notfound.bmp', D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, imageInfo, 0);
                                      frmScenery.lstScenery.AddItem(tempString);
                                      tvwScenery.Nodes.Add('In Use', tvwChild, tempString, tempString);
                                    end;
                                    SceneryTextures[i].Texture.GetLevelDesc(0, textureDesc);
                                    SceneryTextures[i].Width := imageInfo.Width;
                                    SceneryTextures[i].Height := imageInfo.Height;
                                    SceneryTextures[i].reScale.X := SceneryTextures[i].Width / textureDesc.Width;
                                    SceneryTextures[i].reScale.Y := SceneryTextures[i].Height / textureDesc.Height;
                                    if (SceneryTextures[i].reScale.X = 0) or (SceneryTextures[i].reScale.Y = 0) then
                                      begin
                                        SceneryTextures[i].reScale.X := 1;
                                        SceneryTextures[i].reScale.Y := 1;
                                      end;
                                    end;
                                    for i := 1 to sceneryCount do
                                    begin
                                      if (Scenery[i].Style > sceneryElements) then
                                        begin
                                          Scenery[i].Style := sceneryElements;
                                        end
                                      else
                                        if (Scenery[i].Style < 1) then
                                          begin
                                            Scenery[i].Style := 1;
                                          end;
                                        end;
                                      end
                                    else
                                      if (sceneryElements <> 0) then
                                        begin
                                          //if we got to this point it means that scenery were loaded but scenery elements are borked
                                          //or scenery are borked too
                                          sceneryElements := 0;
                                          for i := 1 to sceneryCount do
                                          begin
                                            Scenery[i].Style := 0;
                                          end;
                                          goto ErrorHandler;
                                        end;
                                        errorVal := 'Error loading colliders';
                                        Read(file1, colliderCount);
                                        setlength(Colliders, colliderCount);
                                        for i := 1 to colliderCount do
                                        begin
                                          Read(file1, Colliders(i));
                                          Colliders[i].active := 0;
                                        end;
                                        errorVal := 'Error loading spawn points';
                                        Read(file1, spawnPoints);
                                        setlength(Spawns, spawnPoints);
                                        for i := 1 to spawnPoints do
                                        begin
                                          Read(file1, spawn);
                                          Spawns[i].X := spawn.X;
                                          Spawns[i].Y := spawn.Y;
                                          Spawns[i].Team := spawn.Team;
                                          if (Spawns[i].Team > 31) then
                                            begin
                                              Spawns[i].Team := 31;
                                            end;
                                            Spawns[i].active := 0;
                                          end;
                                          errorVal := 'Error loading waypoints';
                                          Read(file1, waypointCount);
                                          setlength(Waypoints, waypointCount);
                                          conCount := 0;
                                          setlength(Connections, conCount);
                                          for i := 1 to waypointCount do
                                          begin
                                            Read(file1, newWaypoint);
                                            Waypoints[i].tempIndex := i;
                                            Waypoints[i].pathNum := newWaypoint.pathNum;
                                            if (newWaypoint.connectionsNum >= 0) then
                                              begin
                                                Waypoints[i].numConnections := newWaypoint.connectionsNum;
                                              end
                                            else
                                            begin
                                              Waypoints[i].numConnections := 0;
                                            end;
                                            Waypoints[i].special := newWaypoint.special;
                                            Waypoints[i].X := newWaypoint.X;
                                            Waypoints[i].Y := newWaypoint.Y;
                                            Waypoints[i].wayType[0] := Boolean(newWaypoint.left);
                                            Waypoints[i].wayType[1] := Boolean(newWaypoint.right);
                                            Waypoints[i].wayType[2] := Boolean(newWaypoint.up);
                                            Waypoints[i].wayType[3] := Boolean(newWaypoint.down);
                                            Waypoints[i].wayType[4] := Boolean(newWaypoint.m2);
                                            if (newWaypoint.connectionsNum > 0) and (newWaypoint.connectionsNum <= 20) then
                                              begin
                                                conCount := conCount + newWaypoint.connectionsNum;
                                                setlength(Connections, conCount);
                                                for j := 1 to newWaypoint.connectionsNum do
                                                begin
                                                  Connections[conCount - newWaypoint.connectionsNum + j].point1 := i;
                                                  Connections[conCount - newWaypoint.connectionsNum + j].point2 := newWaypoint.Connections[j];
                                                end;
                                              end;
                                            end;
                                            if (Options.MapRandomID < 0) then
                                              begin
                                                Read(file1, lightCount);
                                                setlength(Lights, lightCount);
                                                for i := 1 to lightCount do
                                                begin
                                                  Read(file1, Lights(i));
                                                end;
                                                Read(file1, sketchLines);
                                                setlength(sketch, sketchLines);
                                                for i := 1 to sketchLines do
                                                begin
                                                  Read(file1, sketch(i));
                                                end;
                                              end
                                            else
                                            begin
                                              lightCount := 0;
                                              setlength(Lights, lightCount);
                                              sketchLines := 0;
                                              setlength(sketch, sketchLines);
                                            end;
                                            CloseFile(file1);
                                            errorVal := 'Error reloading scenery';
                                            fileOpen := false;
                                            errorVal := 'Error setting map data';
                                            setCurrentScenery(0);
                                            if (sceneryElements > 0) then
                                              begin
                                                frmScenery.lstScenery.ListIndex := 0;
                                              end;
                                              //get map title and texture
                                              mapTitle := '';
                                              for i := 1 to Options.mapName[0] do
                                              begin
                                                mapTitle := mapTitle + Chr(Options.mapName[i]);
                                              end;
                                              textureFile := '';
                                              for i := 1 to Options.textureName[0] do
                                              begin
                                                textureFile := textureFile + Chr(Options.textureName[i]);
                                              end;
                                              mapTitle := '';
                                              for i := 1 to Options.mapName[0] do
                                              begin
                                                mapTitle := mapTitle + Chr(Options.mapName[i]);
                                              end;
                                              //get background colours
                                              bgColours[1] := getRGB(Options.BackgroundColor);
                                              bgColours[2] := getRGB(Options.BackgroundColor2);
                                              //set background poly colours
                                              bgPolys[1] := CreateCustomVertex(-maxX - 640, -maxX - 640, 1, 1, RGB(bgColours[1].blue, bgColours[1].green, bgColours[1].red), 0, 0);
                                              bgPolys[2] := CreateCustomVertex(-maxX, maxX, 1, 1, RGB(bgColours[2].blue, bgColours[2].green, bgColours[2].red), 0, 1);
                                              bgPolys[3] := CreateCustomVertex(maxX, -maxX, 1, 1, RGB(bgColours[1].blue, bgColours[1].green, bgColours[1].red), 1, 0);
                                              bgPolys[4] := CreateCustomVertex(maxX, maxX, 1, 1, RGB(bgColours[2].blue, bgColours[2].green, bgColours[2].red), 1, 1);
                                              if ((maxX - minX) > (maxY - minY)) then
                                                begin
                                                  bgPolys[1].X := minX - 640;
                                                  bgPolys[1].Y := Midpoint(maxY, minY) - ((maxX - minX) / 2) - 640;
                                                  bgPolys[2].X := minX - 640;
                                                  bgPolys[2].Y := Midpoint(maxY, minY) + ((maxX - minX) / 2) + 640;
                                                  bgPolys[3].X := maxX + 640;
                                                  bgPolys[3].Y := Midpoint(maxY, minY) - ((maxX - minX) / 2) - 640;
                                                  bgPolys[4].X := maxX + 640;
                                                  bgPolys[4].Y := Midpoint(maxY, minY) + ((maxX - minX) / 2) + 640;
                                                end
                                              else
                                              begin
                                                bgPolys[1].X := Midpoint(maxX, minX) - ((maxY - minY) / 2) - 640;
                                                bgPolys[1].Y := minY - 640;
                                                bgPolys[2].X := Midpoint(maxX, minX) - ((maxY - minY) / 2) - 640;
                                                bgPolys[2].Y := maxY + 640;
                                                bgPolys[3].X := Midpoint(maxX, minX) + ((maxY - minY) / 2) + 640;
                                                bgPolys[3].Y := minY - 640;
                                                bgPolys[4].X := Midpoint(maxX, minX) + ((maxY - minY) / 2) + 640;
                                                bgPolys[4].Y := maxY + 640;
                                              end;
                                              for i := 1 to 4 do
                                              begin
                                                bgPolyCoords[i].X := bgPolys[i].X;
                                                bgPolyCoords[i].Y := bgPolys[i].Y;
                                              end;
                                              if (length(Dir(soldatDir + 'textures\' + textureFile)) <> 0) then
                                                begin
                                                  setMapTexture(textureFile);
                                                  frmTexture.setTexture(textureFile);
                                                end;
                                                Colliders[0].radius := clrRadius;
                                                setMapData;
                                                txtZoom.Text := Floor(zoomFactor * 1000 + 0.5) / 10 + '%';
                                                centerView;
                                                numUndo := 0;
                                                numRedo := 0;
                                                currentUndo := 0;
                                                if (lightCount > 0) then
                                                  begin
                                                    frmDisplay.setLayer(9, showLights);
                                                    applyLights;
                                                  end;
                                                  SaveUndo;
                                                  Render;
                                                  Exit;
                                                  ErrorHandler:
                                                    Application.MessageBox(pchar('error loading map' + vbNewLine + Error + vbNewLine + errorVal), pchar(''), MB_OK) {HelpFile:None, Context:None};
                                                  if fileOpen then
                                                    begin
                                                      CloseFile(file1);
                                                    end;
                                                    noRedraw := false;
                                                  end;

function TfrmSoldatMapEditor.checkLoaded(var sceneryName: widestring): Smallint;
var
  i: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    result := -1;
    for i := 0 to frmScenery.lstScenery.ListCount - 1 do
    begin
      if (frmScenery.lstScenery.List(i) = sceneryName) then
        begin
          result := i;
        end;
      end;
      Exit;
      ErrorHandler:
        Application.MessageBox(pchar('error checking loaded scenery' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
    end;

function TfrmSoldatMapEditor.getMapDimensions: widestring;
begin
  result := Floor(maxX - minX) + 'x' + Floor(maxY - minY);
end;

function TfrmSoldatMapEditor.getMapArea: Longint;
var
  i: Smallint;
  area: double;
  a: Single;
  b: Single;
  c: Single;
  x1: Single;
  y1: Single;
  x2: Single;
  y2: Single;
begin
  for i := 1 to polyCount do
  begin
    if (vertexList[i].polyType <> 3) then
      begin
        x1 := (PolyCoords[i].vertex[3].X - PolyCoords[i].vertex[2].X);
        y1 := (PolyCoords[i].vertex[3].Y - PolyCoords[i].vertex[2].Y);
        x2 := (PolyCoords[i].vertex[1].X - PolyCoords[i].vertex[3].X);
        y2 := (PolyCoords[i].vertex[1].Y - PolyCoords[i].vertex[3].Y);
        a := Sqr(sqr(x1) + sqr(y1));
        b := Sqr(sqr(x2) + sqr(y2));
        c := GetAngle(x1, y1) - GetAngle(x2, y2);
        area := area + (a * b * Sin(c) / 2);
      end;
    end;
    Application.MessageBox(pchar(Floor(area / ((maxX - minX) * (maxY - minY)) * 100 + 0.5) + '%'), pchar(''), MB_OK) {HelpFile:None, Context:None};
  end;

procedure TfrmSoldatMapEditor.setMapData;
begin
  frmInfo.lblCount(0).Caption := polyCount;
  frmInfo.lblCount(1).Caption := sceneryCount + '/500 (' + sceneryElements + ')';
  frmInfo.lblCount(2).Caption := spawnPoints + '/128';
  frmInfo.lblCount(3).Caption := colliderCount + '/128';
  frmInfo.lblCount(4).Caption := waypointCount + '/500';
  frmInfo.lblCount(5).Caption := conCount;
  frmInfo.lblCount(6).Caption := getMapDimensions;
end;

procedure TfrmSoldatMapEditor.setCurrentScenery(var styleVal: Smallint; var sceneryName: widestring);
label
ErrorHandler;
begin
  //ON ERROR
  if (styleVal > -1) then
    begin
      Scenery[0].Style := styleVal;
    end;
    if (sceneryName <> '') then
      begin
        currentScenery := sceneryName;
      end;
      Scenery[0].alpha := opacity * 255;
      Scenery[0].Color := ARGB(opacity * 255, RGB(polyClr.blue, polyClr.green, polyClr.red));
      Scenery[0].level := frmScenery.level;
      Scenery[0].Scaling.X := 1;
      Scenery[0].Scaling.Y := 1;
      Scenery[0].screenTr.X := mouseCoords.X;
      Scenery[0].screenTr.Y := mouseCoords.Y;
      Scenery[0].rotation := 0;
      Exit;
      ErrorHandler:
        Application.MessageBox(pchar('Error setting current scenery' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
    end;

procedure TfrmSoldatMapEditor.setCurrentTexture(var sceneryName: widestring);
var
  loadName: widestring;
  toTGARes: Longint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    loadName := soldatDir + 'Scenery-gfx\' + sceneryName;
    toTGARes := GifToBmp(loadName, appPath + '\Temp\gif.tga');
    if (RightStr(loadName, 4) = '.gif') then
      begin
        loadName := appPath + '\Temp\gif.tga';
      end;
      if (toTGARes = -1) then
        begin
          SceneryTextures[0].Texture := D3DX.CreateTextureFromFileEx(D3DDevice, loadName, D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, imageInfo, 0);
        end
      else
      begin
        SceneryTextures[0].Texture := D3DX.CreateTextureFromFileEx(D3DDevice, appPath + '\' + gfxDir + '\notfound.bmp', D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, imageInfo, 0);
      end;
      SceneryTextures[0].Texture.GetLevelDesc(0, textureDesc);
      SceneryTextures[0].Width := imageInfo.Width;
      SceneryTextures[0].Height := imageInfo.Height;
      SceneryTextures[0].reScale.X := SceneryTextures[0].Width / textureDesc.Width;
      SceneryTextures[0].reScale.Y := SceneryTextures[0].Height / textureDesc.Height;
      if (SceneryTextures[0].reScale.X = 0) or (SceneryTextures[0].reScale.Y = 0) then
        begin
          SceneryTextures[0].reScale.X := 1;
          SceneryTextures[0].reScale.Y := 1;
        end;
        setCurrentScenery(0);
        Scenery[0].Style := 0;
        Exit;
        ErrorHandler:
          Application.MessageBox(pchar('Error creating current scenery texture' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
      end;

procedure TfrmSoldatMapEditor.setSceneryLevel(level: Byte);
begin
  Scenery[0].level := level;
end;

procedure TfrmSoldatMapEditor.CreateSceneryTexture(var sceneryName: widestring);
var
  loadName: widestring;
  toTGARes: Longint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    sceneryElements := sceneryElements + 1;
    setlength(SceneryTextures, sceneryElements);
    loadName := soldatDir + 'Scenery-gfx\' + sceneryName;
    toTGARes := GifToBmp(loadName, appPath + '\Temp\gif.tga');
    if (RightStr(loadName, 4) = '.gif') then
      begin
        loadName := appPath + '\Temp\gif.tga';
      end;
      if (toTGARes = -1) then
        begin
          SceneryTextures[sceneryElements].Texture := D3DX.CreateTextureFromFileEx(D3DDevice, loadName, D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, imageInfo, 0);
        end
      else
      begin
        SceneryTextures[sceneryElements].Texture := D3DX.CreateTextureFromFileEx(D3DDevice, appPath + '\' + gfxDir + '\notfound.bmp', D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, imageInfo, 0);
      end;
      frmScenery.lstScenery.AddItem(sceneryName);
      tvwScenery.Nodes.Add('In Use', tvwChild, sceneryName, sceneryName);
      SceneryTextures[sceneryElements].Texture.GetLevelDesc(0, textureDesc);
      SceneryTextures[sceneryElements].Width := imageInfo.Width;
      SceneryTextures[sceneryElements].Height := imageInfo.Height;
      SceneryTextures[sceneryElements].reScale.X := SceneryTextures[sceneryElements].Width / textureDesc.Width;
      SceneryTextures[sceneryElements].reScale.Y := SceneryTextures[sceneryElements].Height / textureDesc.Height;
      if (SceneryTextures[sceneryElements].reScale.X = 0) or (SceneryTextures[sceneryElements].reScale.Y = 0) then
        begin
          SceneryTextures[sceneryElements].reScale.X := 1;
          SceneryTextures[sceneryElements].reScale.Y := 1;
        end;
        Exit;
        ErrorHandler:
          Application.MessageBox(pchar('Error creating scenery texture: ' + sceneryName + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
        SceneryTextures[sceneryElements] := SceneryTextures[0];
      end;

procedure TfrmSoldatMapEditor.RefreshSceneryTextures(var Index: Smallint);
var
  sceneryName: widestring;
  scenNum: Smallint;
  loadName: widestring;
  toTGARes: Longint;
begin
  if (frmScenery.lstScenery.ListCount = 0) then
    begin
      Exit;
    end;
    sceneryName := frmScenery.lstScenery.List(Index - 1);
    loadName := soldatDir + 'Scenery-gfx\' + sceneryName;
    toTGARes := GifToBmp(loadName, appPath + '\Temp\gif.tga');
    if (RightStr(loadName, 4) = '.gif') then
      begin
        loadName := appPath + '\Temp\gif.tga';
      end;
      if (toTGARes = -1) then
        begin
          SceneryTextures[Index].Texture := D3DX.CreateTextureFromFileEx(D3DDevice, loadName, D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, imageInfo, 0);
        end
      else
      begin
        SceneryTextures[Index].Texture := D3DX.CreateTextureFromFileEx(D3DDevice, appPath + '\' + gfxDir + '\notfound.bmp', D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColourKey, imageInfo, 0);
      end;
      SceneryTextures[Index].Texture.GetLevelDesc(0, textureDesc);
      SceneryTextures[Index].Width := imageInfo.Width;
      SceneryTextures[Index].Height := imageInfo.Height;
      SceneryTextures[Index].reScale.X := SceneryTextures[Index].Width / textureDesc.Width;
      SceneryTextures[Index].reScale.Y := SceneryTextures[Index].Height / textureDesc.Height;
      if (SceneryTextures[Index].reScale.X = 0) or (SceneryTextures[Index].reScale.Y = 0) then
        begin
          SceneryTextures[Index].reScale.X := 1;
          SceneryTextures[Index].reScale.Y := 1;
        end;
      end;

procedure TfrmSoldatMapEditor.SaveFile(var FileName: widestring);
const
  SECTOR_NUM: Longint = 25;
  zero: Smallint = 0;
var
  i: Smallint;
  j: Smallint;
  k: Smallint;
  X: Smallint;
  Y: Smallint;
  xOffset: Smallint;
  yOffset: Smallint;
  xDiff: Single;
  yDiff: Single;
  length: Single;
  VertNum: Byte;
  mapWidth: Longint;
  mapHeight: Longint;
  Polygon: TMapFile_Polygon;
  sectorsDivision: Longint;
  Scenery_New: TMapFile_Scenery;
  newWaypoint: TNewWaypoint;
  sceneryName: widestring;
  Prop: TProp;
  spawn: TSaveSpawnPoint;
  tempClr: TColour;
  connectedNum: Smallint;
  fileOpen: Boolean;
  label
  ErrorHandler;
  begin
    self.MousePointer := 11;
    //refresh background
    mnuRefreshBG_Click;
    mapWidth := maxX - minX;
    mapHeight := maxY - minY;
    Options.BackgroundColor := ARGB(255, RGB(bgColours[1].blue, bgColours[1].green, bgColours[1].red));
    Options.BackgroundColor2 := ARGB(255, RGB(bgColours[2].blue, bgColours[2].green, bgColours[2].red));
    //set texture name
    Options.textureName[0] := length(textureFile);
    for i := 1 to length(textureFile) do
    begin
      Options.textureName[i] := Asc(Copy(textureFile, i, 1));
    end; //set map name
    Options.mapName[0] := length(mapTitle);
    if (Options.mapName[0] > 38) then
      begin
        Options.mapName[0] := 38;
      end;
      for i := 1 to Options.mapName[0] do
      begin
        Options.mapName[i] := Asc(Copy(mapTitle, i, 1));
      end;
      Options.MapRandomID := -1;
      if (mapWidth > mapHeight) then
        begin
          sectorsDivision := Floor((mapWidth + 100) / 25);
        end
      else
      begin
        sectorsDivision := Floor((mapHeight + 100) / 25);
      end;
      Assign(file1, FileName);
      Reset(file1);
      fileOpen := true;
      Write(file1, Version);
      Write(file1, Options);
      //save polys
      Write(file1, polyCount);
      for i := 1 to polyCount do
      begin
        Polygon.Poly := Polys[i];
        for j := 1 to 3 do
        begin
          Polygon.Poly.vertex[j].X := PolyCoords[i].vertex[j].X;
          Polygon.Poly.vertex[j].Y := PolyCoords[i].vertex[j].Y;
          Polygon.Poly.vertex[j].Color := ARGB(getAlpha(Polys[i].vertex[j].Color), RGB(vertexList[i].colour[j].blue, vertexList[i].colour[j].green, vertexList[i].colour[j].red));
          VertNum := j + 1;
          if (VertNum > 3) then
            begin
              VertNum := 1;
            end;
            xDiff := PolyCoords[i].vertex[VertNum].X - PolyCoords[i].vertex[j].X;
            yDiff := PolyCoords[i].vertex[j].Y - PolyCoords[i].vertex[VertNum].Y;
            if (xDiff = 0) and (yDiff = 0) then
              begin
                length := 1;
              end
            else
            begin
              length := Sqr(sqr(xDiff) + sqr(yDiff));
            end;
            Polygon.Poly.Perp.vertex(j).X := (yDiff / length) * Polygon.Poly.Perp.vertex(j).z;
            Polygon.Poly.Perp.vertex(j).Y := (xDiff / length) * Polygon.Poly.Perp.vertex(j).z;
            Polygon.Poly.Perp.vertex(j).z := 1;
          end;
          Polygon.polyType := vertexList[i].polyType;
          Write(file1, Polygon);
        end;
        Write(file1, sectorsDivision);
        Write(file1, SECTOR_NUM);
        for i := -25 to 25 do
        begin
          for j := -25 to 25 do
          begin
            Write(file1, zero);
          end;
        end;
        Write(file1, sceneryCount);
        for i := 1 to sceneryCount do
        begin
          Prop.active := true;
          Prop.alpha := Scenery[i].alpha;
          tempClr := getRGB(Scenery[i].Color);
          Prop.Color := ARGB(255, RGB(tempClr.blue, tempClr.green, tempClr.red));
          Prop.Width := SceneryTextures[Scenery[i].Style].Width;
          Prop.Height := SceneryTextures[Scenery[i].Style].Height;
          Prop.level := Scenery[i].level;
          Prop.rotation := Scenery[i].rotation;
          Prop.ScaleX := Scenery[i].Scaling.X;
          Prop.ScaleY := Scenery[i].Scaling.Y;
          Prop.X := Scenery[i].Translation.X - xOffset;
          Prop.Y := Scenery[i].Translation.Y - yOffset;
          Prop.Style := Scenery[i].Style;
          Write(file1, Prop);
        end;
        Write(file1, sceneryElements);
        for i := 1 to sceneryElements do
        begin
          sceneryName := frmScenery.lstScenery.List(i - 1);
          Scenery_New.sceneryName[0] := length(sceneryName);
          for j := 1 to Scenery_New.sceneryName[0] do
          begin
            Scenery_New.sceneryName[j] := Asc(Copy(sceneryName, j, 1));
          end;
          Scenery_New.Date := getFileDate(sceneryName);
          Write(file1, Scenery_New);
        end;
        Write(file1, colliderCount);
        for i := 1 to colliderCount do
        begin
          Colliders[i].active := 1;
          Write(file1, Colliders[i]);
          Colliders[i].active := 0;
        end;
        Write(file1, spawnPoints);
        for i := 1 to spawnPoints do
        begin
          spawn.active := 1;
          spawn.X := Spawns[i].X;
          spawn.Y := Spawns[i].Y;
          spawn.Team := Spawns[i].Team;
          Write(file1, spawn);
          Spawns[i].active := 0;
        end;
        Write(file1, waypointCount);
        for i := 1 to waypointCount do
        begin
          newWaypoint.active := 1;
          newWaypoint.X := Waypoints[i].X;
          newWaypoint.Y := Waypoints[i].Y;
          newWaypoint.connectionsNum := Waypoints[i].numConnections;
          if Waypoints[i].wayType[0] then
            begin
              newWaypoint.left := 1;
            end
          else
          begin
            newWaypoint.left := 0;
          end;
          if Waypoints[i].wayType[1] then
            begin
              newWaypoint.right := 1;
            end
          else
          begin
            newWaypoint.right := 0;
          end;
          if Waypoints[i].wayType[2] then
            begin
              newWaypoint.up := 1;
            end
          else
          begin
            newWaypoint.up := 0;
          end;
          if Waypoints[i].wayType[3] then
            begin
              newWaypoint.down := 1;
            end
          else
          begin
            newWaypoint.down := 0;
          end;
          if Waypoints[i].wayType[4] then
            begin
              newWaypoint.m2 := 1;
            end
          else
          begin
            newWaypoint.m2 := 0;
          end;
          newWaypoint.id := i;
          newWaypoint.pathNum := Waypoints[i].pathNum;
          newWaypoint.special := Waypoints[i].special;
          connectedNum := 0;
          for j := 1 to conCount do
          begin
            if (Connections[j].point1 = i) and (connectedNum < 20) then
              begin
                connectedNum := connectedNum + 1;
                newWaypoint.Connections[connectedNum] := Connections[j].point2;
              end;
            end;
            Waypoints[i].numConnections := connectedNum;
            newWaypoint.connectionsNum := connectedNum;
            Write(file1, newWaypoint);
          end;
          Write(file1, lightCount);
          for i := 1 to lightCount do
          begin
            Write(file1, Lights[i]);
          end;
          Write(file1, sketchLines);
          for i := 1 to sketchLines do
          begin
            Write(file1, sketch[i]);
          end;
          CloseFile(file1);
          fileOpen := false;
          currentFileName := '';
          for i := 0 to length(FileName) - 1 do
          begin
            if (Copy(FileName, length(FileName) - i, 1) <> '\') then
              begin
                currentFileName := Copy(FileName, length(FileName) - i, 1) + currentFileName;
              end
            else
            begin
              Break;
            end;
          end;
          lblFileName.Caption := currentFileName;
          self.MousePointer := 99;
          Exit;
          ErrorHandler:
            Application.MessageBox(pchar('Error saving map' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
          if fileOpen then
            begin
              CloseFile(file1);
            end;
          end;

procedure TfrmSoldatMapEditor.SaveAndCompile(var FileName: widestring);
const
  SECTOR_NUM: Longint = 25;
var
  i: Smallint;
  j: Smallint;
  k: Smallint;
  X: Smallint;
  Y: Smallint;
  xOffset: Smallint;
  yOffset: Smallint;
  xDiff: Single;
  yDiff: Single;
  length: Single;
  VertNum: Byte;
  sector: array[1..256] of Smallint;
  xSecNum: Smallint;
  ySecNum: Smallint;
  mapWidth: Smallint;
  mapHeight: Smallint;
  Polygon: TMapFile_Polygon;
  sectorsDivision: Longint;
  polysInSector: Smallint;
  Scenery_New: TMapFile_Scenery;
  newWaypoint: TNewWaypoint;
  sceneryName: widestring;
  Prop: TProp;
  tempClr: TColour;
  connectedNum: Smallint;
  newSpawnPoint: TSaveSpawnPoint;
  newCollider: TCollider;
  zero: Smallint;
  fileOpen: Boolean;
  label
  ErrorHandler;
  begin
    //ON ERROR
    zero := 0;
    self.MousePointer := 11;
    Randomize;
    polysInSector := 0;
    newSpawnPoint.active := 1;
    newCollider.active := 1;
    //refresh background
    mnuRefreshBG_Click;
    //find offsets to center map
    xOffset := Floor(Midpoint(maxX, minX));
    yOffset := Floor(Midpoint(maxY, minY));
    mapWidth := maxX - xOffset;
    mapHeight := maxY - yOffset;
    Options.BackgroundColor := ARGB(255, RGB(bgColours[1].blue, bgColours[1].green, bgColours[1].red));
    Options.BackgroundColor2 := ARGB(255, RGB(bgColours[2].blue, bgColours[2].green, bgColours[2].red));
    //set texture name
    Options.textureName[0] := length(textureFile);
    if (Options.textureName[0] > 24) then
      begin
        Options.textureName[0] := 24;
      end;
      for i := 1 to Options.textureName[0] do
      begin
        Options.textureName[i] := Asc(Copy(textureFile, i, 1));
      end; //set map name
      Options.mapName[0] := length(mapTitle);
      if (Options.mapName[0] > 38) then
        begin
          Options.mapName[0] := 38;
        end;
        for i := 1 to Options.mapName[0] do
        begin
          Options.mapName[i] := Asc(Copy(mapTitle, i, 1));
        end;
        //set map random ID
        Options.MapRandomID := (Rnd * 999999) + 10000;
        xSecNum := SECTOR_NUM;
        ySecNum := SECTOR_NUM;
        if (mapWidth > mapHeight) then
          begin
            sectorsDivision := Floor((mapWidth + 100) / 25);
            ySecNum := (mapHeight + 100) / sectorsDivision;
          end
        else
        begin
          sectorsDivision := Floor((mapHeight + 100) / 25);
          xSecNum := (mapWidth + 100) / sectorsDivision;
        end;
        Assign(file1, FileName);
        Reset(file1);
        fileOpen := true;
        Write(file1, Version);
        Write(file1, Options);
        //save polys
        Write(file1, polyCount);
        for i := 1 to polyCount do
        begin
          Polygon.Poly := Polys[i];
          Polygon.polyType := vertexList[i].polyType;
          Polygon.Poly.vertex[1].X := PolyCoords[i].vertex[1].X - xOffset;
          Polygon.Poly.vertex[1].Y := PolyCoords[i].vertex[1].Y - yOffset;
          Polygon.Poly.vertex[2].X := PolyCoords[i].vertex[2].X - xOffset;
          Polygon.Poly.vertex[2].Y := PolyCoords[i].vertex[2].Y - yOffset;
          Polygon.Poly.vertex[3].X := PolyCoords[i].vertex[3].X - xOffset;
          Polygon.Poly.vertex[3].Y := PolyCoords[i].vertex[3].Y - yOffset;
          for j := 1 to 3 do
          begin
            VertNum := j + 1;
            if (VertNum > 3) then
              begin
                VertNum := 1;
              end;
              xDiff := Polygon.Poly.vertex[VertNum].X - Polygon.Poly.vertex[j].X;
              yDiff := Polygon.Poly.vertex[j].Y - Polygon.Poly.vertex[VertNum].Y;
              if (xDiff = 0) and (yDiff = 0) then
                begin
                  length := 1;
                end
              else
              begin
                length := Sqr(sqr(xDiff) + sqr(yDiff));
              end;
              if (Polygon.polyType = 18) then
                begin
                  if (Polygon.Poly.Perp.vertex(j).z < 1) then
                    begin
                      Polygon.Poly.Perp.vertex(j).z := 1;
                    end;
                  end
                else
                begin
                  Polygon.Poly.Perp.vertex(j).z := 1;
                end;
                Polygon.Poly.Perp.vertex(j).X := (yDiff / length) * Polygon.Poly.Perp.vertex(j).z;
                Polygon.Poly.Perp.vertex(j).Y := (xDiff / length) * Polygon.Poly.Perp.vertex(j).z;
                Polygon.Poly.Perp.vertex(j).z := 1;
                Polygon.Poly.vertex[j].z := 1;
              end;
              Write(file1, Polygon);
            end;
            Write(file1, sectorsDivision);
            Write(file1, SECTOR_NUM);
            //generate sectors
            for X := -SECTOR_NUM to SECTOR_NUM do
            begin
              for Y := -SECTOR_NUM to SECTOR_NUM do
              begin
                polysInSector := 0;
                if (X >= -xSecNum) and (X <= xSecNum) and (Y >= -ySecNum) and (Y <= ySecNum) //if sectors within range then
                  begin
                    for i := 1 to polyCount do
                    begin
                      if (vertexList[i].polyType <> 3) then
                        begin
                          if isInSector(i, sectorsDivision * (X - 0.5) + xOffset - 1, sectorsDivision * (Y - 0.5) + yOffset - 1, sectorsDivision + 2) then
                            begin
                              polysInSector := polysInSector + 1;
                              if (polysInSector > 256) then
                                begin
                                  polysInSector := 256;
                                end
                              else
                              begin
                                sector[polysInSector] := i;
                              end;
                            end;
                          end;
                        end;
                        if (polysInSector > 256) then
                          begin
                            polysInSector := 256;
                          end;
                        end;
                        Write(file1, polysInSector);
                        if (polysInSector > 0) then
                          begin
                            for k := 1 to polysInSector do
                            begin
                              Write(file1, sector[k]);
                            end;
                          end;
                        end;
                        picProgress.Canvas.Rectangle({TODO});
                        picProgress.Canvas.Rectangle({TODO});
                        picProgress.Refresh;
                      end;
                      picProgress.Cls;
                      Write(file1, sceneryCount);
                      for i := 1 to sceneryCount do
                      begin
                        Prop.active := true;
                        Prop.alpha := Scenery[i].alpha;
                        tempClr := getRGB(Scenery[i].Color);
                        Prop.Color := ARGB(255, RGB(tempClr.blue, tempClr.green, tempClr.red));
                        Prop.Width := SceneryTextures[Scenery[i].Style].Width;
                        Prop.Height := SceneryTextures[Scenery[i].Style].Height;
                        Prop.level := Scenery[i].level;
                        Prop.rotation := Scenery[i].rotation;
                        Prop.ScaleX := Scenery[i].Scaling.X;
                        Prop.ScaleY := Scenery[i].Scaling.Y;
                        Prop.X := Scenery[i].Translation.X - xOffset;
                        Prop.Y := Scenery[i].Translation.Y - yOffset;
                        Prop.Style := Scenery[i].Style;
                        Write(file1, Prop);
                      end;
                      Write(file1, sceneryElements);
                      for i := 1 to sceneryElements do
                      begin
                        sceneryName := frmScenery.lstScenery.List(i - 1);
                        Scenery_New.sceneryName[0] := length(sceneryName);
                        for j := 1 to Scenery_New.sceneryName[0] do
                        begin
                          Scenery_New.sceneryName[j] := Asc(Copy(sceneryName, j, 1));
                        end;
                        Scenery_New.Date := getFileDate(sceneryName);
                        Write(file1, Scenery_New);
                      end;
                      Write(file1, colliderCount);
                      for i := 1 to colliderCount do
                      begin
                        newCollider.radius := Colliders[i].radius;
                        newCollider.X := Colliders[i].X - xOffset;
                        newCollider.Y := Colliders[i].Y - yOffset;
                        Write(file1, newCollider);
                      end;
                      Write(file1, spawnPoints);
                      for i := 1 to spawnPoints do
                      begin
                        newSpawnPoint.Team := Spawns[i].Team;
                        newSpawnPoint.X := Spawns[i].X - xOffset;
                        newSpawnPoint.Y := Spawns[i].Y - yOffset;
                        Write(file1, newSpawnPoint);
                      end;
                      Write(file1, waypointCount);
                      for i := 1 to waypointCount do
                      begin
                        newWaypoint.active := 1;
                        newWaypoint.X := Waypoints[i].X - xOffset;
                        newWaypoint.Y := Waypoints[i].Y - yOffset;
                        newWaypoint.connectionsNum := Waypoints[i].numConnections;
                        if Waypoints[i].wayType[0] then
                          begin
                            newWaypoint.left := 1;
                          end
                        else
                        begin
                          newWaypoint.left := 0;
                        end;
                        if Waypoints[i].wayType[1] then
                          begin
                            newWaypoint.right := 1;
                          end
                        else
                        begin
                          newWaypoint.right := 0;
                        end;
                        if Waypoints[i].wayType[2] then
                          begin
                            newWaypoint.up := 1;
                          end
                        else
                        begin
                          newWaypoint.up := 0;
                        end;
                        if Waypoints[i].wayType[3] then
                          begin
                            newWaypoint.down := 1;
                          end
                        else
                        begin
                          newWaypoint.down := 0;
                        end;
                        if Waypoints[i].wayType[4] then
                          begin
                            newWaypoint.m2 := 1;
                          end
                        else
                        begin
                          newWaypoint.m2 := 0;
                        end;
                        newWaypoint.id := i;
                        newWaypoint.pathNum := Waypoints[i].pathNum;
                        newWaypoint.special := Waypoints[i].special;
                        connectedNum := 0;
                        for j := 1 to conCount do
                        begin
                          if (Connections[j].point1 = i) and (connectedNum < 20) then
                            begin
                              connectedNum := connectedNum + 1;
                              newWaypoint.Connections[connectedNum] := Connections[j].point2;
                            end;
                          end;
                          Waypoints[i].numConnections := connectedNum;
                          newWaypoint.connectionsNum := connectedNum;
                          Write(file1, newWaypoint);
                        end;
                        Write(file1, zero);
                        Write(file1, zero);
                        Write(file1, zero);
                        Write(file1, zero);
                        CloseFile(file1);
                        fileOpen := false;
                        self.MousePointer := 99;
                        SetCursor(currentFunction + 1);
                        Render;
                        Exit;
                        ErrorHandler:
                          Application.MessageBox(pchar('Error saving/compiling map: ' + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
                        if fileOpen then
                          begin
                            CloseFile(file1);
                          end;
                        end;

procedure TfrmSoldatMapEditor.SaveUndo;
var
  i: Smallint;
  j: Smallint;
  Polygon: TPolygon;
  FileName: widestring;
  label
  ErrorHandler;
  begin
    //ON ERROR
    selectionChanged := false;
    numRedo := 0;
    numUndo := numUndo + 1;
    if (numUndo > max_undo) then
      begin
        numUndo := max_undo;
      end;
      currentUndo := currentUndo + 1;
      if (currentUndo > max_undo) then
        begin
          currentUndo := 0;
        end;
        FileName := appPath + '\undo\undo' + currentUndo + '.pwn';
        Assign(file1, FileName);
        Reset(file1);
        //save polys
        Write(file1, polyCount);
        for i := 1 to polyCount do
        begin
          Polygon := Polys[i];
          for j := 1 to 3 do
          begin
            Polygon.vertex[j].X := PolyCoords[i].vertex[j].X;
            Polygon.vertex[j].Y := PolyCoords[i].vertex[j].Y;
          end;
          Write(file1, Polygon);
          Write(file1, vertexList[i]);
        end;
        Write(file1, sceneryCount);
        for i := 1 to sceneryCount do
        begin
          Write(file1, Scenery[i]);
        end;
        Write(file1, colliderCount);
        for i := 1 to colliderCount do
        begin
          Write(file1, Colliders[i]);
        end;
        Write(file1, spawnPoints);
        for i := 1 to spawnPoints do
        begin
          Write(file1, Spawns[i]);
        end;
        Write(file1, lightCount);
        for i := 1 to lightCount do
        begin
          Write(file1, Lights[i]);
        end;
        Write(file1, waypointCount);
        for i := 1 to waypointCount do
        begin
          Write(file1, Waypoints[i]);
        end;
        Write(file1, conCount);
        for i := 1 to conCount do
        begin
          Write(file1, Connections[i]);
        end;
        Write(file1, numSelectedPolys);
        for i := 1 to numSelectedPolys do
        begin
          Write(file1, selectedPolys[i]);
        end;
        Write(file1, numSelectedScenery);
        Write(file1, numSelSpawns);
        Write(file1, numSelColliders);
        Write(file1, numSelWaypoints);
        for i := 0 to 3 do
        begin
          Write(file1, selRect[i]);
        end;
        CloseFile(file1);
        Exit;
        ErrorHandler:
          Application.MessageBox(pchar('Error saving undo' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
      end;

procedure TfrmSoldatMapEditor.loadUndo(var redo: Boolean);
var
  i: Smallint;
  j: Smallint;
  FileName: widestring;
  errorVal: widestring;
  label
  ErrorHandler;
  begin
    //ON ERROR
    if selectionChanged then
      begin
        SaveUndo;
        selectionChanged := false;
      end;
      if (toolAction = true) and (numVerts > 0) then
        begin
          toolAction := false;
          numVerts := 0;
          Render;
          Exit;
        end;
        currentWaypoint := 0;
        if redo then
          begin
            if (numRedo < 1) then
              begin
                Exit;
              end;
              currentUndo := currentUndo + 1;
              numUndo := numUndo + 1;
              numRedo := numRedo - 1;
            end
          else
          begin
            if (numUndo <= 1) then
              begin
                Exit;
              end;
              currentUndo := currentUndo - 1;
              numUndo := numUndo - 1;
              numRedo := numRedo + 1;
            end;
            if (currentUndo < 0) then
              begin
                currentUndo := max_undo;
              end
            else
              if (currentUndo > max_undo) then
                begin
                  currentUndo := 0;
                end;
                numSelectedPolys := 0;
                setlength(selectedPolys, 0);
                FileName := appPath + '\undo\undo' + currentUndo + '.pwn';
                errorVal := 'Error opening file';
                Assign(file1, FileName);
                Reset(file1);
                errorVal := 'Error loading polygons';
                Read(file1, polyCount);
                setlength(Polys, polyCount + 1);
                setlength(PolyCoords, polyCount + 1);
                setlength(vertexList, polyCount + 1);
                for i := 1 to polyCount do
                begin
                  Read(file1, Polys(i));
                  Read(file1, vertexList(i));
                  for j := 1 to 3 do
                  begin
                    PolyCoords[i].vertex[j].X := Polys[i].vertex[j].X;
                    PolyCoords[i].vertex[j].Y := Polys[i].vertex[j].Y;
                    Polys[i].vertex[j].X := (PolyCoords[i].vertex[j].X - scrollCoords[2].X) * zoomFactor;
                    Polys[i].vertex[j].Y := (PolyCoords[i].vertex[j].Y - scrollCoords[2].Y) * zoomFactor;
                  end;
                end;
                errorVal := 'Error loading scenery';
                Read(file1, sceneryCount);
                setlength(Scenery, sceneryCount);
                if (sceneryCount > 0) then
                  begin
                    for i := 1 to sceneryCount do
                    begin
                      Read(file1, Scenery(i));
                      Scenery[i].screenTr.X := (Scenery[i].Translation.X - scrollCoords[2].X) * zoomFactor;
                      Scenery[i].screenTr.Y := (Scenery[i].Translation.Y - scrollCoords[2].Y) * zoomFactor;
                    end;
                  end;
                  errorVal := 'Error loading colliders';
                  Read(file1, colliderCount);
                  setlength(Colliders, colliderCount);
                  for i := 1 to colliderCount do
                  begin
                    Read(file1, Colliders(i));
                  end;
                  errorVal := 'Error loading spawnpoints';
                  Read(file1, spawnPoints);
                  setlength(Spawns, spawnPoints);
                  for i := 1 to spawnPoints do
                  begin
                    Read(file1, Spawns(i));
                  end;
                  errorVal := 'Error loading lights';
                  Read(file1, lightCount);
                  setlength(Lights, lightCount);
                  for i := 1 to lightCount do
                  begin
                    Read(file1, Lights(i));
                  end;
                  errorVal := 'Error loading waypoints';
                  Read(file1, waypointCount);
                  setlength(Waypoints, waypointCount);
                  for i := 1 to waypointCount do
                  begin
                    Read(file1, Waypoints(i));
                  end;
                  errorVal := 'Error loading connections';
                  Read(file1, conCount);
                  setlength(Connections, conCount);
                  for i := 1 to conCount do
                  begin
                    Read(file1, Connections(i));
                  end;
                  errorVal := 'Error loading selected polys';
                  Read(file1, numSelectedPolys);
                  setlength(selectedPolys, numSelectedPolys);
                  for i := 1 to numSelectedPolys do
                  begin
                    Read(file1, selectedPolys(i));
                  end;
                  errorVal := 'Error loading selected scenery';
                  Read(file1, numSelectedScenery);
                  Read(file1, numSelSpawns);
                  Read(file1, numSelColliders);
                  Read(file1, numSelWaypoints);
                  for i := 0 to 3 do
                  begin
                    Read(file1, selRect(i));
                  end;
                  CloseFile(file1);
                  errorVal := 'Error loading undo state';
                  setMapData;
                  getRCenter;
                  Render;
                  Exit;
                  ErrorHandler:
                    Application.MessageBox(pchar(Error + vbNewLine + errorVal), pchar(''), MB_OK) {HelpFile:None, Context:None};
                end;

function TfrmSoldatMapEditor.isInSector(var Index: Smallint; var X: Smallint; var Y: Smallint; div: Longint): Boolean;
var
  A1: D3DVECTOR2;
  B1: D3DVECTOR2;
  A2: D3DVECTOR2;
  B2: D3DVECTOR2;
  indexA1: Smallint;
  indexB1: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    result := false;
    //is poly outside of sector for sure
    if (PolyCoords[Index].vertex[1].X < X) and (PolyCoords[Index].vertex[2].X < X) and (PolyCoords[Index].vertex[3].X < X) then
      begin
        Exit;
      end
    else
      if (PolyCoords[Index].vertex[1].X > X + div) and (PolyCoords[Index].vertex[2].X > X + div) and (PolyCoords[Index].vertex[3].X > X + div) then
        begin
          Exit;
        end
      else
        if (PolyCoords[Index].vertex[1].Y < Y) and (PolyCoords[Index].vertex[2].Y < Y) and (PolyCoords[Index].vertex[3].Y < Y) then
          begin
            Exit;
          end
        else
          if (PolyCoords[Index].vertex[1].Y > Y + div) and (PolyCoords[Index].vertex[2].Y > Y + div) and (PolyCoords[Index].vertex[3].Y > Y + div) then
            begin
              Exit;
            end;
            //is vertex in sector
            if isBetween(X, PolyCoords[Index].vertex[1].X, X + div) and isBetween(Y, PolyCoords[Index].vertex[1].Y, Y + div) then
              begin
                result := true;
                Exit;
              end
            else
              if isBetween(X, PolyCoords[Index].vertex[2].X, X + div) and isBetween(Y, PolyCoords[Index].vertex[2].Y, Y + div) then
                begin
                  result := true;
                  Exit;
                end
              else
                if isBetween(X, PolyCoords[Index].vertex[3].X, X + div) and isBetween(Y, PolyCoords[Index].vertex[3].Y, Y + div) then
                  begin
                    result := true;
                    Exit;
                  end;
                  //check if sector corner is in poly
                  if not result then
                    begin
                      if pointInPoly(X, Y, Index) then
                        begin
                          result := true;
                          Exit;
                        end
                      else
                        if pointInPoly(X + div, Y, Index) then
                          begin
                            result := true;
                            Exit;
                          end
                        else
                          if pointInPoly(X, Y + div, Index) then
                            begin
                              result := true;
                              Exit;
                            end
                          else
                            if pointInPoly(X + div, Y + div, Index) then
                              begin
                                result := true;
                                Exit;
                              end;
                            end;
                            for indexA1 := 1 to 3 do
                            begin
                              indexB1 := indexA1 + 1;
                              if (indexB1 > 3) then
                                begin
                                  indexB1 := 1;
                                end;
                                A1.X := PolyCoords[Index].vertex[indexA1].X;
                                A1.Y := PolyCoords[Index].vertex[indexA1].Y;
                                B1.X := PolyCoords[Index].vertex[indexB1].X;
                                B1.Y := PolyCoords[Index].vertex[indexB1].Y;
                                A2.X := X;
                                A2.Y := Y;
                                B2.X := X + div;
                                B2.Y := Y;
                                if SegXSeg(A1, B1, A2, B2) //top then
                                  begin
                                    result := true;
                                    Exit;
                                  end;
                                  A2.X := X;
                                  A2.Y := Y + div;
                                  B2.X := X + div;
                                  B2.Y := Y + div;
                                  if SegXSeg(A1, B1, A2, B2) //bottom then
                                    begin
                                      result := true;
                                      Exit;
                                    end;
                                    A2.X := X;
                                    A2.Y := Y;
                                    B2.X := X;
                                    B2.Y := Y + div;
                                    if SegXSeg(A1, B1, A2, B2) //left then
                                      begin
                                        result := true;
                                        Exit;
                                      end;
                                      A2.X := X + div;
                                      A2.Y := Y;
                                      B2.X := X + div;
                                      B2.Y := Y + div;
                                      if SegXSeg(A1, B1, A2, B2) //right then
                                        begin
                                          result := true;
                                          Exit;
                                        end;
                                      end;
                                      Exit;
                                      ErrorHandler:
                                        Application.MessageBox(pchar('Sector error, ' + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
                                    end;

function TfrmSoldatMapEditor.isInSector2(var Index: Smallint; var X: Smallint; var Y: Smallint; var div: Longint): Smallint;
var
  i: Smallint;
  j: Smallint;
  x1: Smallint;
  x2: Smallint;
  y1: Smallint;
  y2: Smallint;
  VertNum: Byte;
  label
  ErrorHandler;
  begin
    //ON ERROR
    result := false;
    for j := 1 to 3 do
    begin
      VertNum := j + 1;
      if (VertNum > 3) then
        begin
          VertNum := 1;
        end;
        x1 := PolyCoords[Index].vertex[j].X;
        x2 := PolyCoords[Index].vertex[VertNum].X;
        y1 := PolyCoords[Index].vertex[j].Y;
        y2 := PolyCoords[Index].vertex[VertNum].Y;
        if segmentsIntersect(x1, y1, x2, y2, X, Y, X + div, Y) then
          begin
            result := true;
          end
        else
          if segmentsIntersect(x1, y1, x2, y2, X, Y, X, Y + div) then
            begin
              result := true;
            end
          else
            if segmentsIntersect(x1, y1, x2, y2, X + div, Y, X + div, Y + div) then
              begin
                result := true;
              end
            else
              if segmentsIntersect(x1, y1, x2, y2, X, Y + div, X + div, Y + div) then
                begin
                  result := true;
                end;
              end;
              Exit;
              ErrorHandler:
                Application.MessageBox(pchar(Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
            end;

function TfrmSoldatMapEditor.SegXHorizSeg(var A1: D3DVECTOR2; var B1: D3DVECTOR2; var A2: D3DVECTOR2; var length: Longint): Boolean;
var
  U: D3DVECTOR2;
  VX: Smallint;
  D: Single;
  epsilon: Single;
  W: D3DVECTOR2;
  s: Single;
  T: Single;
begin
  result := false;
  U.X := B1.X - A1.X;
  U.Y := B1.Y - A1.Y;
  D := -U.Y * length;
  if (D = 0) //the poly line seg is also horizontal then
    begin
      Exit;
    end;
    W.X := A1.X - A2.X;
    W.Y := A1.Y - A2.Y;
    s := (length * W.Y) / D;
    if ((s <= 0) or (s >= 1)) then
      begin
        Exit;
      end;
      T := (U.X * W.Y - U.Y * W.X) / D;
      if ((T <= 0) or (T >= 1)) then
        begin
          Exit;
        end;
        result := true;
      end;

function TfrmSoldatMapEditor.SegXVertSeg(var A1: D3DVECTOR2; var B1: D3DVECTOR2; var A2: D3DVECTOR2; var length: Longint): Boolean;
var
  U: D3DVECTOR2;
  D: Single;
  W: D3DVECTOR2;
  s: Single;
  T: Single;
begin
  result := false;
  U.X := B1.X - A1.X; //length of poly seg x
  U.Y := B1.Y - A1.Y; //y
  D := U.X * length;
  if (D = 0) //the poly line seg is also vertical then
    begin
      Exit;
    end;
    W.X := A1.X - A2.X;
    W.Y := A1.Y - A2.Y;
    s := (-length * W.X) / D;
    if ((s <= 0) or (s >= 1)) then
      begin
        Exit;
      end;
      T := (U.X * W.Y - U.Y * W.X) / D;
      if ((T <= 0) or (T >= 1)) then
        begin
          Exit;
        end;
        result := true;
      end;

function TfrmSoldatMapEditor.segmentsIntersect(x1: Smallint; y1: Smallint; x2: Smallint; y2: Smallint; A1: Smallint; B1: Smallint; A2: Smallint; B2: Smallint): Boolean;
var
  DX: Longint;
  dy: Longint;
  da: Longint;
  db: Longint;
  T: Single;
  s: Single;
  label
  ErrorHandler;
  begin
    //ON ERROR
    DX := x2 - x1;
    dy := y2 - y1;
    da := A2 - A1;
    db := B2 - B1;
    if ((da * dy - db * DX) = 0) then
      begin
        //the segments are parallel
        result := false;
        Exit;
      end;
      s := (DX * (B1 - y1) + dy * (x1 - A1)) / (da * dy - db * DX);
      T := (da * (y1 - B1) + db * (A1 - x1)) / (db * DX - da * dy);
      result := ((s >= 0) and (s <= 1) and (T >= 0) and (T <= 1));
      Exit;
      ErrorHandler:
        Application.MessageBox(pchar(Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
    end;

function TfrmSoldatMapEditor.SegXSeg(var A1: D3DVECTOR2; var B1: D3DVECTOR2; var A2: D3DVECTOR2; var B2: D3DVECTOR2): Boolean;
var
  U: D3DVECTOR2;
  V: D3DVECTOR2;
  D: Single;
  W: D3DVECTOR2;
  s: Single;
  T: Single;
begin
  result := false;
  U.X := B1.X - A1.X;
  U.Y := B1.Y - A1.Y;
  V.X := B2.X - A2.X;
  V.Y := B2.Y - A2.Y;
  D := U.X * V.Y - U.Y * V.X;
  if (D = 0) //the poly line seg is also horizontal then
    begin
      Exit;
    end;
    W.X := A1.X - A2.X;
    W.Y := A1.Y - A2.Y;
    s := (V.X * W.Y - V.Y * W.X) / D;
    if ((s <= 0) or (s >= 0)) then
      begin
        Exit;
      end;
      T := (U.X * W.Y - U.Y * W.X) / D;
      if ((T <= 0) or (T >= 0)) then
        begin
          Exit;
        end;
        result := true;
      end;

function TfrmSoldatMapEditor.isBetween(var p1: olevariant; var p2: olevariant; var p3: olevariant): Boolean;
begin
  result := false;
  if ((p1 >= p2) and (p2 >= p3)) or ((p3 >= p2) and (p2 >= p1)) then
    begin
      result := true;
    end;
  end;

procedure TfrmSoldatMapEditor.initGrid;
var
  i: Smallint;
  clrString: widestring;
  clr1: Longint;
  clr2: Longint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    clr1 := ARGB(gridOp1, gridClr);
    clr2 := ARGB(gridOp2, gridClr2);
    setlength(xGridLines, gridDivisions);
    setlength(yGridLines, gridDivisions);
    xGridLines[1].vertex[1] := CreateCustomVertex(0, 0, 1, 1, clr1, 0, 0);
    xGridLines[1].vertex[2] := CreateCustomVertex(self.ScaleWidth, 0, 1, 1, clr1, 0, 0);
    yGridLines[1].vertex[1] := CreateCustomVertex(0, 0, 1, 1, clr1, 0, 0);
    yGridLines[1].vertex[2] := CreateCustomVertex(0, self.ScaleHeight, 1, 1, clr1, 0, 0);
    for i := 2 to gridDivisions do
    begin
      xGridLines[i].vertex[1] := CreateCustomVertex(0, 0, 1, 1, clr2, 0, 0);
      xGridLines[i].vertex[2] := CreateCustomVertex(self.ScaleWidth, 0, 1, 1, clr2, 0, 0);
      yGridLines[i].vertex[1] := CreateCustomVertex(0, 0, 1, 1, clr2, 0, 0);
      yGridLines[i].vertex[2] := CreateCustomVertex(0, self.ScaleHeight, 1, 1, clr2, 0, 0);
    end;
    inc := (gridSpacing / gridDivisions);
    Exit;
    ErrorHandler:
      Application.MessageBox(pchar('Error initializing grid'), pchar(''), MB_OK) {HelpFile:None, Context:None};
  end;

procedure TfrmSoldatMapEditor.setGrid;
var
  xGridOffset: Single;
  yGridOffset: Single;
  i: Smallint;
begin
  xGridOffset := (scrollCoords[2].X - (Floor(scrollCoords[2].X / gridSpacing) * gridSpacing)) * zoomFactor;
  yGridOffset := (scrollCoords[2].Y - (Floor(scrollCoords[2].Y / gridSpacing) * gridSpacing)) * zoomFactor;
  xGridLines[1].vertex[1].Y := 0 - yGridOffset;
  xGridLines[1].vertex[2].Y := 0 - yGridOffset;
  yGridLines[1].vertex[1].X := 0 - xGridOffset;
  yGridLines[1].vertex[2].X := 0 - xGridOffset;
  for i := 2 to gridDivisions do
  begin
    xGridLines[i].vertex[1].Y := xGridLines[1].vertex[1].Y + (gridSpacing / gridDivisions) * zoomFactor * (i - 1);
    xGridLines[i].vertex[2].Y := xGridLines[i].vertex[1].Y;
    yGridLines[i].vertex[1].X := yGridLines[1].vertex[1].X + (gridSpacing / gridDivisions) * zoomFactor * (i - 1);
    yGridLines[i].vertex[2].X := yGridLines[i].vertex[1].X;
  end;
end;

function TfrmSoldatMapEditor.CreateCustomVertex(X: Single; Y: Single; var z: Single; var rhw: Single; var Color: Longint; var tu: Single; var tv: Single): TCustomVertex;
begin
  result.X := X;
  result.Y := Y;
  result.z := z;
  result.rhw := rhw;
  result.Color := Color;
  result.tu := tu;
  result.tv := tv;
end;

function TfrmSoldatMapEditor.ExModeActive: Boolean;
var
  TestCoopRes: Longint;
begin
  TestCoopRes := D3DDevice.TestCooperativeLevel;
  if (TestCoopRes = D3D_OK) then
    begin
      result := true;
    end
  else
  begin
    result := false;
  end;
end;

procedure TfrmSoldatMapEditor.Render;
var
  i: Smallint;
  j: Smallint;
  lineCoords: array[1..4] of TCustomVertex;
  sceneryCoords: array[0..4] of TCustomVertex;
  circleCoords: array[0..32] of TCustomVertex;
  numPolys: Smallint;
  scenR: Single;
  backtypePolys: array of TPolygon;
  xVal: Single;
  yVal: Single;
  theta: Single;
  R: Single;
  srcRect: RECT;
  rc: D3DVECTOR2;
  sc: D3DVECTOR2;
  tr: D3DVECTOR2;
  sVal: Smallint;
  objClr: Longint;
  //----
  matView: D3DMATRIX;
  viewVector: D3DVECTOR;
  upVector: D3DVECTOR;
  atVector: D3DVECTOR;
  matProj: D3DMATRIX;
  label
  ErrorHandler;
  begin
    if not initialized or noRedraw then
      begin
        Exit;
      end;
      upVector.Y := -1;
      atVector.z := 1;
      atVector.X := scrollCoords[2].X + self.ScaleWidth / 2 / zoomFactor;
      atVector.Y := (scrollCoords[2].Y + self.ScaleHeight / 2 / zoomFactor);
      viewVector.X := scrollCoords[2].X + self.ScaleWidth / 2 / zoomFactor;
      viewVector.Y := (scrollCoords[2].Y + self.ScaleHeight / 2 / zoomFactor);
      viewVector.z := 0;
      D3DXMatrixLookAtLH(matView, viewVector, atVector, upVector);
      D3DDevice.SetTransform(D3DTS_VIEW, matView);
      D3DXMatrixPerspectiveLH(matProj, self.ScaleWidth / zoomFactor, -self.ScaleHeight / zoomFactor, -1, 0);
      D3DDevice.SetTransform(D3DTS_PROJECTION, matProj);
      //----
      rc.X := 0;
      rc.Y := 0;
      srcRect.left := 0;
      srcRect.Top := 0;
      for i := 1 to 4 do
      begin
        lineCoords[i].rhw := 1;
        lineCoords[i].z := 1;
      end;
      initialized := false;
      if ExModeActive //check if in focus then
        begin
          initialized := true;
        end
      else
      begin
        resetDevice; //''''
        initialized := true;
      end;
      if (numVerts > 0) and (currentTool = TOOL_CREATE) then
        begin
          numPolys := polyCount + 1;
        end
      else
      begin
        numPolys := polyCount;
      end;
      D3DDevice.Clear(0, 0, D3DCLEAR_TARGET, backClr, 0, 0);
      D3DDevice.BeginScene;
      //----
      D3DDevice.setTexture(0, nil);
      //draw background
      if showBG then
        begin
          D3DDevice.DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, bgPolys[1], sizeof(bgPolys[1]));
        end;
        //Draw Polys
        if showPolys and (numPolys > 0) then
          begin
            if showTexture //set texture then
              begin
                D3DDevice.setTexture(0, mapTexture);
              end;
              D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, 1);
              D3DDevice.SetRenderState(D3DRS_SRCBLEND, D3DBLEND_SRCALPHA);
              D3DDevice.SetRenderState(D3DRS_DESTBLEND, D3DBLEND_INVSRCALPHA);
              D3DDevice.SetRenderState(D3DRS_COLORWRITEENABLE, D3DCOLORWRITEENABLE_BLUE or D3DCOLORWRITEENABLE_GREEN or D3DCOLORWRITEENABLE_RED);
              D3DDevice.SetRenderState(D3DRS_COLORWRITEENABLE, D3DCOLORWRITEENABLE_ALPHA or D3DCOLORWRITEENABLE_BLUE or D3DCOLORWRITEENABLE_GREEN or D3DCOLORWRITEENABLE_RED);
              D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, 1);
              if clrPolys then
                begin
                  D3DDevice.SetRenderState(D3DRS_SRCBLEND, polyBlendSrc);
                  D3DDevice.SetRenderState(D3DRS_DESTBLEND, polyBlendDest);
                end;
                for i := 1 to numPolys do
                begin
                  if (vertexList[i].polyType = 24) or (vertexList[i].polyType = 25) then
                    begin
                      D3DDevice.DrawPrimitiveUP(D3DPT_TRIANGLELIST, 1, Polys[i].vertex[1], sizeof(Polys[1].vertex[1]));
                    end;
                  end;
                  D3DDevice.SetRenderState(D3DRS_SRCBLEND, polyBlendSrc);
                  D3DDevice.SetRenderState(D3DRS_DESTBLEND, polyBlendDest);
                end
              else
                if (showPolys = false) and (numPolys > 0) then
                  begin
                    D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, 1);
                    D3DDevice.SetRenderState(D3DRS_SRCBLEND, D3DBLEND_ZERO);
                    D3DDevice.SetRenderState(D3DRS_DESTBLEND, D3DBLEND_ONE);
                    for i := 1 to numPolys do
                    begin
                      if (vertexList[i].polyType = 24) or (vertexList[i].polyType = 25) then
                        begin
                          D3DDevice.DrawPrimitiveUP(D3DPT_TRIANGLELIST, 1, Polys[i].vertex[1], sizeof(Polys[1].vertex[1]));
                        end;
                      end;
                      D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, 0);
                    end;
                    scenerySprite.Begin;
                    if (sceneryCount > 0) and showScenery and sslBack then
                      begin
                        for i := 1 to sceneryCount do
                        begin
                          if (Scenery[i].level = 0) then
                            begin
                              sVal := Scenery[i].Style;
                              if (Scenery[i].selected = 1) then
                                begin
                                  if (scaleDiff.X <> 1) or (scaleDiff.Y <> 1) then
                                    begin
                                      xVal := SceneryTextures[Scenery[i].Style].Width * Scenery[i].Scaling.X;
                                      yVal := SceneryTextures[Scenery[i].Style].Height * Scenery[i].Scaling.Y;
                                      theta := GetAngle(xVal, yVal) + Scenery[i].rotation;
                                      R := Sqr(sqr(xVal) + sqr(yVal));
                                      xVal := Cos(theta) * R * scaleDiff.X;
                                      yVal := -Sin(theta) * R * scaleDiff.Y;
                                      theta := GetAngle(xVal, yVal) - Scenery[i].rotation;
                                      R := Sqr(sqr(xVal) + sqr(yVal));
                                      sc.X := SceneryTextures[sVal].reScale.X * ((Cos(theta) * R) / (SceneryTextures[Scenery[i].Style].Width)) * zoomFactor;
                                      sc.Y := SceneryTextures[sVal].reScale.Y * (-(Sin(theta) * R) / (SceneryTextures[Scenery[i].Style].Height)) * zoomFactor;
                                      scenR := Scenery[i].rotation - rDiff;
                                    end
                                  else
                                  begin
                                    sc.X := SceneryTextures[sVal].reScale.X * Scenery[i].Scaling.X * zoomFactor;
                                    sc.Y := SceneryTextures[sVal].reScale.Y * Scenery[i].Scaling.Y * zoomFactor;
                                    scenR := Scenery[i].rotation - rDiff;
                                  end;
                                end
                              else
                              begin
                                sc.X := SceneryTextures[sVal].reScale.X * Scenery[i].Scaling.X * zoomFactor;
                                sc.Y := SceneryTextures[sVal].reScale.Y * Scenery[i].Scaling.Y * zoomFactor;
                                scenR := Scenery[i].rotation;
                              end;
                              srcRect.right := SceneryTextures[sVal].Width / SceneryTextures[sVal].reScale.X;
                              srcRect.bottom := SceneryTextures[sVal].Height / SceneryTextures[sVal].reScale.Y;
                              scenerySprite.Draw(SceneryTextures[sVal].Texture, 0, sc, rc, scenR, Scenery[i].screenTr, Scenery[i].Color);
                            end;
                          end;
                        end;
                        if (sceneryCount > 0) and showScenery and sslMid then
                          begin
                            for i := 1 to sceneryCount do
                            begin
                              if (Scenery[i].level = 1) then
                                begin
                                  sVal := Scenery[i].Style;
                                  if (Scenery[i].selected = 1) then
                                    begin
                                      if (scaleDiff.X <> 1) or (scaleDiff.Y <> 1) then
                                        begin
                                          xVal := SceneryTextures[Scenery[i].Style].Width * Scenery[i].Scaling.X;
                                          yVal := SceneryTextures[Scenery[i].Style].Height * Scenery[i].Scaling.Y;
                                          theta := GetAngle(xVal, yVal) + Scenery[i].rotation;
                                          R := Sqr(sqr(xVal) + sqr(yVal));
                                          xVal := Cos(theta) * R * scaleDiff.X;
                                          yVal := -Sin(theta) * R * scaleDiff.Y;
                                          theta := GetAngle(xVal, yVal) - Scenery[i].rotation;
                                          R := Sqr(sqr(xVal) + sqr(yVal));
                                          sc.X := SceneryTextures[sVal].reScale.X * ((Cos(theta) * R) / (SceneryTextures[Scenery[i].Style].Width)) * zoomFactor;
                                          sc.Y := SceneryTextures[sVal].reScale.Y * (-(Sin(theta) * R) / (SceneryTextures[Scenery[i].Style].Height)) * zoomFactor;
                                          scenR := Scenery[i].rotation - rDiff;
                                        end
                                      else
                                      begin
                                        sc.X := SceneryTextures[sVal].reScale.X * Scenery[i].Scaling.X * zoomFactor;
                                        sc.Y := SceneryTextures[sVal].reScale.Y * Scenery[i].Scaling.Y * zoomFactor;
                                        scenR := Scenery[i].rotation - rDiff;
                                      end;
                                    end
                                  else
                                  begin
                                    sc.X := SceneryTextures[sVal].reScale.X * Scenery[i].Scaling.X * zoomFactor;
                                    sc.Y := SceneryTextures[sVal].reScale.Y * Scenery[i].Scaling.Y * zoomFactor;
                                    scenR := Scenery[i].rotation;
                                  end;
                                  srcRect.right := SceneryTextures[sVal].Width / SceneryTextures[sVal].reScale.X;
                                  srcRect.bottom := SceneryTextures[sVal].Height / SceneryTextures[sVal].reScale.Y;
                                  scenerySprite.Draw(SceneryTextures[sVal].Texture, 0, sc, rc, scenR, Scenery[i].screenTr, Scenery[i].Color);
                                end;
                              end;
                            end;
                            if (currentFunction = TOOL_SCENERY) and not (ctrlDown or altDown) then
                              begin
                                if (Scenery[0].level < 2) then
                                  begin
                                    sVal := Scenery[0].Style;
                                    sc.X := SceneryTextures[sVal].reScale.X * Scenery[0].Scaling.X * zoomFactor;
                                    sc.Y := SceneryTextures[sVal].reScale.Y * Scenery[0].Scaling.Y * zoomFactor;
                                    srcRect.right := SceneryTextures[sVal].Width / SceneryTextures[sVal].reScale.X;
                                    srcRect.bottom := SceneryTextures[sVal].Height / SceneryTextures[sVal].reScale.Y;
                                    scenerySprite.Draw(SceneryTextures[sVal].Texture, srcRect, sc, rc, Scenery[0].rotation, Scenery[0].screenTr, Scenery[0].Color);
                                  end;
                                end;
                                scenerySprite.End;
                                //Draw Polys
                                if showPolys and (numPolys > 0) then
                                  begin
                                    if showTexture //set texture then
                                      begin
                                        D3DDevice.setTexture(0, mapTexture);
                                      end;
                                      D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, 1);
                                      D3DDevice.SetRenderState(D3DRS_SRCBLEND, D3DBLEND_SRCALPHA);
                                      D3DDevice.SetRenderState(D3DRS_DESTBLEND, D3DBLEND_INVSRCALPHA);
                                      D3DDevice.SetRenderState(D3DRS_COLORWRITEENABLE, D3DCOLORWRITEENABLE_BLUE or D3DCOLORWRITEENABLE_GREEN or D3DCOLORWRITEENABLE_RED);
                                      D3DDevice.SetRenderState(D3DRS_COLORWRITEENABLE, D3DCOLORWRITEENABLE_ALPHA or D3DCOLORWRITEENABLE_BLUE or D3DCOLORWRITEENABLE_GREEN or D3DCOLORWRITEENABLE_RED);
                                      D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, 1);
                                      if clrPolys then
                                        begin
                                          D3DDevice.SetRenderState(D3DRS_SRCBLEND, polyBlendSrc);
                                          D3DDevice.SetRenderState(D3DRS_DESTBLEND, polyBlendDest);
                                        end;
                                        for i := 1 to numPolys do
                                        begin
                                          if not ((vertexList[i].polyType = 24) or (vertexList[i].polyType = 25)) then
                                            begin
                                              D3DDevice.DrawPrimitiveUP(D3DPT_TRIANGLELIST, 1, Polys[i].vertex[1], sizeof(Polys[1].vertex[1]));
                                            end;
                                          end;
                                          D3DDevice.SetRenderState(D3DRS_SRCBLEND, polyBlendSrc);
                                          D3DDevice.SetRenderState(D3DRS_DESTBLEND, polyBlendDest);
                                        end
                                      else
                                        if (showPolys = false) and (numPolys > 0) then
                                          begin
                                            D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, 1);
                                            D3DDevice.SetRenderState(D3DRS_SRCBLEND, D3DBLEND_ZERO);
                                            D3DDevice.SetRenderState(D3DRS_DESTBLEND, D3DBLEND_ONE);
                                            for i := 1 to numPolys do
                                            begin
                                              if not ((vertexList[i].polyType = 24) or (vertexList[i].polyType = 25)) then
                                                begin
                                                  D3DDevice.DrawPrimitiveUP(D3DPT_TRIANGLELIST, 1, Polys[i].vertex[1], sizeof(Polys[1].vertex[1]));
                                                end;
                                              end;
                                              D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, 0);
                                            end;
                                            //draw selected polys
                                            if (numSelectedPolys > 0) and showPolys and not ((currentTool = TOOL_TEXTURE) or (currentTool = TOOL_VCOLOUR) or (currentTool = TOOL_PCOLOUR)) then
                                              begin
                                                D3DDevice.setTexture(0, patternTexture);
                                                D3DDevice.SetRenderState(D3DRS_SRCBLEND, D3DBLEND_ONE);
                                                D3DDevice.SetRenderState(D3DRS_DESTBLEND, D3DBLEND_ONE);
                                                D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, 1);
                                                for i := 1 to numSelectedPolys do
                                                begin
                                                  objClr := PolyTypeClrs[vertexList[selectedPolys[i]].polyType];
                                                  lineCoords[1] := Polys[selectedPolys[i]].vertex[1];
                                                  lineCoords[2] := Polys[selectedPolys[i]].vertex[2];
                                                  lineCoords[3] := Polys[selectedPolys[i]].vertex[3];
                                                  lineCoords[1].tu := Polys[selectedPolys[i]].vertex[1].X / 128;
                                                  lineCoords[1].tv := Polys[selectedPolys[i]].vertex[1].Y / 128;
                                                  lineCoords[2].tu := Polys[selectedPolys[i]].vertex[2].X / 128;
                                                  lineCoords[2].tv := Polys[selectedPolys[i]].vertex[2].Y / 128;
                                                  lineCoords[3].tu := Polys[selectedPolys[i]].vertex[3].X / 128;
                                                  lineCoords[3].tv := Polys[selectedPolys[i]].vertex[3].Y / 128;
                                                  lineCoords[1].Color := 0;
                                                  lineCoords[2].Color := 0;
                                                  lineCoords[3].Color := 0;
                                                  lineCoords[1].z := 1;
                                                  lineCoords[2].z := 1;
                                                  lineCoords[3].z := 1;
                                                  lineCoords[1].rhw := 1;
                                                  lineCoords[2].rhw := 1;
                                                  lineCoords[3].rhw := 1;
                                                  if (vertexList[selectedPolys[i]].vertex[1] = 1) then
                                                    begin
                                                      lineCoords[1].Color := objClr;
                                                    end;
                                                    if (vertexList[selectedPolys[i]].vertex[2] = 1) then
                                                      begin
                                                        lineCoords[2].Color := objClr;
                                                      end;
                                                      if (vertexList[selectedPolys[i]].vertex[3] = 1) then
                                                        begin
                                                          lineCoords[3].Color := objClr;
                                                        end;
                                                        D3DDevice.DrawPrimitiveUP(D3DPT_TRIANGLELIST, 1, lineCoords[1], sizeof(lineCoords[1]));
                                                      end;
                                                      D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, 0);
                                                    end;
                                                    //draw depthmap
                                                    if showPolys and (currentTool = TOOL_DEPTHMAP) then
                                                      begin
                                                        lineCoords[1].tu := 0;
                                                        lineCoords[1].tv := 0;
                                                        lineCoords[2].tu := 0;
                                                        lineCoords[2].tv := 0;
                                                        lineCoords[3].tu := 0;
                                                        lineCoords[3].tv := 0;
                                                        lineCoords[1].z := 1;
                                                        lineCoords[2].z := 1;
                                                        lineCoords[3].z := 1;
                                                        lineCoords[1].rhw := 1;
                                                        lineCoords[2].rhw := 1;
                                                        lineCoords[3].rhw := 1;
                                                        D3DDevice.setTexture(0, nil);
                                                        for i := 1 to polyCount do
                                                        begin
                                                          lineCoords[1] := Polys[i].vertex[1];
                                                          lineCoords[2] := Polys[i].vertex[2];
                                                          lineCoords[3] := Polys[i].vertex[3];
                                                          if (Polys[i].vertex[1].z >= 0) and (Polys[i].vertex[2].z >= 0) and (Polys[i].vertex[3].z >= 0) then
                                                            begin
                                                              lineCoords[1].Color := ARGB(255, RGB(Polys[i].vertex[1].z, Polys[i].vertex[1].z, Polys[i].vertex[1].z));
                                                              lineCoords[2].Color := ARGB(255, RGB(Polys[i].vertex[2].z, Polys[i].vertex[2].z, Polys[i].vertex[2].z));
                                                              lineCoords[3].Color := ARGB(255, RGB(Polys[i].vertex[3].z, Polys[i].vertex[3].z, Polys[i].vertex[3].z));
                                                            end;
                                                            D3DDevice.DrawPrimitiveUP(D3DPT_TRIANGLELIST, 1, lineCoords[1], sizeof(lineCoords[1]));
                                                          end;
                                                        end;
                                                        //draw scenery
                                                        scenerySprite.Begin;
                                                        if (sceneryCount > 0) and showScenery and sslFront then
                                                          begin
                                                            for i := 1 to sceneryCount do
                                                            begin
                                                              if (Scenery[i].level = 2) then
                                                                begin
                                                                  sVal := Scenery[i].Style;
                                                                  if (Scenery[i].selected = 1) then
                                                                    begin
                                                                      if (scaleDiff.X <> 1) or (scaleDiff.Y <> 1) then
                                                                        begin
                                                                          xVal := SceneryTextures[Scenery[i].Style].Width * Scenery[i].Scaling.X;
                                                                          yVal := SceneryTextures[Scenery[i].Style].Height * Scenery[i].Scaling.Y;
                                                                          theta := GetAngle(xVal, yVal) + Scenery[i].rotation;
                                                                          R := Sqr(sqr(xVal) + sqr(yVal));
                                                                          xVal := Cos(theta) * R * scaleDiff.X;
                                                                          yVal := -Sin(theta) * R * scaleDiff.Y;
                                                                          theta := GetAngle(xVal, yVal) - Scenery[i].rotation;
                                                                          R := Sqr(sqr(xVal) + sqr(yVal));
                                                                          sc.X := SceneryTextures[sVal].reScale.X * ((Cos(theta) * R) / (SceneryTextures[Scenery[i].Style].Width)) * zoomFactor;
                                                                          sc.Y := SceneryTextures[sVal].reScale.Y * (-(Sin(theta) * R) / (SceneryTextures[Scenery[i].Style].Height)) * zoomFactor;
                                                                          scenR := Scenery[i].rotation - rDiff;
                                                                        end
                                                                      else
                                                                      begin
                                                                        sc.X := SceneryTextures[sVal].reScale.X * Scenery[i].Scaling.X * zoomFactor;
                                                                        sc.Y := SceneryTextures[sVal].reScale.Y * Scenery[i].Scaling.Y * zoomFactor;
                                                                        scenR := Scenery[i].rotation - rDiff;
                                                                      end;
                                                                    end
                                                                  else
                                                                  begin
                                                                    sc.X := SceneryTextures[sVal].reScale.X * Scenery[i].Scaling.X * zoomFactor;
                                                                    sc.Y := SceneryTextures[sVal].reScale.Y * Scenery[i].Scaling.Y * zoomFactor;
                                                                    scenR := Scenery[i].rotation;
                                                                  end;
                                                                  srcRect.right := SceneryTextures[sVal].Width / SceneryTextures[sVal].reScale.X;
                                                                  srcRect.bottom := SceneryTextures[sVal].Height / SceneryTextures[sVal].reScale.Y;
                                                                  scenerySprite.Draw(SceneryTextures[sVal].Texture, 0, sc, rc, scenR, Scenery[i].screenTr, Scenery[i].Color);
                                                                end;
                                                              end;
                                                            end;
                                                            //draw current scenery
                                                            if (currentFunction = TOOL_SCENERY) and not (ctrlDown or altDown) then
                                                              begin
                                                                if (Scenery[0].level = 2) then
                                                                  begin
                                                                    sVal := Scenery[0].Style;
                                                                    sc.X := SceneryTextures[sVal].reScale.X * Scenery[0].Scaling.X * zoomFactor;
                                                                    sc.Y := SceneryTextures[sVal].reScale.Y * Scenery[0].Scaling.Y * zoomFactor;
                                                                    srcRect.right := SceneryTextures[sVal].Width / SceneryTextures[sVal].reScale.X + 0;
                                                                    srcRect.bottom := SceneryTextures[sVal].Height / SceneryTextures[sVal].reScale.Y + 0;
                                                                    scenerySprite.Draw(SceneryTextures[sVal].Texture, srcRect, sc, rc, Scenery[0].rotation, Scenery[0].screenTr, Scenery[0].Color);
                                                                  end;
                                                                end;
                                                                //draw objects
                                                                objClr := ARGB(255, RGB(255, 255, 255));
                                                                sc.X := 32 / (objTexSize.X / 8);
                                                                sc.Y := 32 / (objTexSize.Y / 4);
                                                                rc.X := (objTexSize.X / 8) / 2;
                                                                rc.Y := (objTexSize.Y / 4) / 2;
                                                                if showObjects then
                                                                  begin
                                                                    if (spawnPoints > 0) then
                                                                      begin
                                                                        for i := 1 to spawnPoints do
                                                                        begin
                                                                          tr.X := Floor((Spawns[i].X - scrollCoords[2].X) * zoomFactor - 15 + 0.5);
                                                                          tr.Y := Floor((Spawns[i].Y - scrollCoords[2].Y) * zoomFactor - 15 + 0.5);
                                                                          srcRect.Top := Floor(Spawns[i].Team / 8) * (objTexSize.Y / 4);
                                                                          srcRect.left := (Spawns[i].Team - (Floor(Spawns[i].Team / 8) * 8)) * (objTexSize.X / 8);
                                                                          srcRect.right := srcRect.left + (objTexSize.X / 8);
                                                                          srcRect.bottom := srcRect.Top + (objTexSize.Y / 4);
                                                                          if (Spawns[i].active = 1) then
                                                                            begin
                                                                              scenerySprite.Draw(objectsTexture, srcRect, sc, rc, 0, tr, ARGB(255, selectionClr));
                                                                            end
                                                                          else
                                                                          begin
                                                                            scenerySprite.Draw(objectsTexture, srcRect, sc, rc, 0, tr, objClr);
                                                                          end;
                                                                        end;
                                                                      end;
                                                                      if (colliderCount > 0) then
                                                                        begin
                                                                          objClr := ARGB(128, RGB(255, 255, 255));
                                                                          for i := 1 to colliderCount do
                                                                          begin
                                                                            sc.X := Colliders[i].radius / (objTexSize.X / 8) * zoomFactor;
                                                                            sc.Y := Colliders[i].radius / (objTexSize.Y / 4) * zoomFactor;
                                                                            tr.X := Floor((Colliders[i].X - scrollCoords[2].X) * zoomFactor - (objTexSize.X / 8) / 2 * sc.X + 0.5);
                                                                            tr.Y := Floor((Colliders[i].Y - scrollCoords[2].Y) * zoomFactor - (objTexSize.Y / 4) / 2 * sc.Y + 0.5);
                                                                            if (Colliders[i].active = 1) then
                                                                              begin
                                                                                srcRect.left := 0;
                                                                                srcRect.Top := (objTexSize.Y / 4) * 3;
                                                                                srcRect.right := srcRect.left + (objTexSize.X / 8);
                                                                                srcRect.bottom := srcRect.Top + (objTexSize.Y / 4);
                                                                                scenerySprite.Draw(objectsTexture, srcRect, sc, rc, 0, tr, objClr);
                                                                              end
                                                                            else
                                                                            begin
                                                                              srcRect.left := (objTexSize.X / 8);
                                                                              srcRect.Top := (objTexSize.Y / 4) * 2;
                                                                              srcRect.right := srcRect.left + (objTexSize.X / 8);
                                                                              srcRect.bottom := srcRect.Top + (objTexSize.Y / 4);
                                                                              scenerySprite.Draw(objectsTexture, srcRect, sc, rc, 0, tr, objClr);
                                                                            end;
                                                                          end;
                                                                        end;
                                                                      end;
                                                                      if showLights then
                                                                        begin
                                                                          objClr := ARGB(255, RGB(255, 255, 255));
                                                                          sc.X := 32 / (objTexSize.X / 8);
                                                                          sc.Y := 32 / (objTexSize.Y / 4);
                                                                          rc.X := (objTexSize.X / 8) / 2;
                                                                          rc.Y := (objTexSize.Y / 4) / 2;
                                                                          if (lightCount > 0) then
                                                                            begin
                                                                              srcRect.left := (objTexSize.X / 8) * 7;
                                                                              srcRect.Top := (objTexSize.Y / 4) * 2;
                                                                              srcRect.right := srcRect.left + (objTexSize.X / 8);
                                                                              srcRect.bottom := srcRect.Top + (objTexSize.Y / 4);
                                                                              for i := 1 to lightCount do
                                                                              begin
                                                                                objClr := ARGB(255, RGB(Lights[i].colour.blue, Lights[i].colour.green, Lights[i].colour.red));
                                                                                sc.X := 32 / (objTexSize.X / 8);
                                                                                sc.Y := 32 / (objTexSize.Y / 4);
                                                                                tr.X := Floor((Lights[i].X - scrollCoords[2].X) * zoomFactor - 16 * sc.X + 0.5);
                                                                                tr.Y := Floor((Lights[i].Y - scrollCoords[2].Y) * zoomFactor - 16 * sc.Y + 0.5);
                                                                                if (Lights[i].selected = 1) then
                                                                                  begin
                                                                                    scenerySprite.Draw(objectsTexture, srcRect, sc, rc, 0, tr, ARGB(255, selectionClr));
                                                                                  end
                                                                                else
                                                                                begin
                                                                                  scenerySprite.Draw(objectsTexture, srcRect, sc, rc, 0, tr, objClr);
                                                                                end;
                                                                              end;
                                                                            end;
                                                                          end;
  //draw current object
    if (currentTool = TOOL_OBJECTS) and not (ctrlDown or altDown) then
      begin
        objClr := ARGB(128, RGB(255, 255, 255));
        if mnuGostek.Checked //gostek then
          begin
            sc.X := 32 / (objTexSize.X / 8) * zoomFactor;
            sc.Y := 32 / (objTexSize.Y / 4) * zoomFactor;
            srcRect.left := (objTexSize.X / 8) * 2 + 1;
            srcRect.Top := (objTexSize.Y / 4) * 2;
            srcRect.right := srcRect.left + (objTexSize.X / 8) - 2;
            srcRect.bottom := srcRect.Top + (objTexSize.Y / 4);
            tr.X := mouseCoords.X - 16 * zoomFactor;
            tr.Y := mouseCoords.Y - 16 * zoomFactor;
            scenerySprite.Draw(objectsTexture, srcRect, sc, rc, 0, tr, objClr);
          end
        else
          if (mnuCollider.Checked = true) //collider then
            begin
              srcRect.left := (objTexSize.X / 8);
              srcRect.Top := (objTexSize.Y / 4) * 2;
              srcRect.right := srcRect.left + (objTexSize.X / 8);
              srcRect.bottom := srcRect.Top + (objTexSize.Y / 4);
              sc.X := Colliders[0].radius / (objTexSize.X / 8) * zoomFactor;
              sc.Y := Colliders[0].radius / (objTexSize.Y / 4) * zoomFactor;
              tr.X := Colliders[0].X - (objTexSize.X / 8) / 2 * sc.X;
              tr.Y := Colliders[0].Y - (objTexSize.Y / 4) / 2 * sc.Y;
              scenerySprite.Draw(objectsTexture, srcRect, sc, rc, 0, tr, objClr);
            end
          else
          begin
            sc.X := 32 / (objTexSize.X / 8);
            sc.Y := 32 / (objTexSize.Y / 4);
            tr.X := Spawns[0].X - 15;
            tr.Y := Spawns[0].Y - 15;
            srcRect.Top := Floor(Spawns[0].Team / 8) * (objTexSize.Y / 4);
            srcRect.left := (Spawns[0].Team - (Floor(Spawns[0].Team / 8) * 8)) * (objTexSize.X / 8);
            srcRect.right := srcRect.left + (objTexSize.X / 8);
            srcRect.bottom := srcRect.Top + (objTexSize.Y / 4);
            scenerySprite.Draw(objectsTexture, srcRect, sc, rc, 0, tr, objClr);
          end;
        end;
        //draw gostek
        if (gostek.X <> 0) or (gostek.Y <> 0) then
          begin
            sc.X := 32 / (objTexSize.X / 8) * zoomFactor;
            sc.Y := 32 / (objTexSize.Y / 4) * zoomFactor;
            srcRect.left := ((objTexSize.X / 8) * 2) + 1;
            srcRect.Top := (objTexSize.Y / 4) * 2;
            srcRect.right := srcRect.left + (objTexSize.X / 8) - 2;
            srcRect.bottom := srcRect.Top + (objTexSize.Y / 4);
            tr.X := (gostek.X - 16 - scrollCoords[2].X) * zoomFactor;
            tr.Y := (gostek.Y - 16 - scrollCoords[2].Y) * zoomFactor;
            scenerySprite.Draw(objectsTexture, srcRect, sc, rc, 0, tr, ARGB(255, RGB(128, 128, 128)));
          end;
          scenerySprite.End;
          D3DDevice.SetRenderState(D3DRS_SRCBLEND, D3DBLEND_SRCALPHA);
          D3DDevice.SetRenderState(D3DRS_DESTBLEND, D3DBLEND_INVSRCALPHA);
          D3DDevice.setTexture(0, nil);
          //draw grid
          if showGrid then
            begin
              D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, true);
              setGrid;
              for i := 0 to (Floor((self.ScaleWidth / gridSpacing) / zoomFactor) + 1) do
              begin
                if (inc * zoomFactor >= 8) then
                  begin
                    D3DDevice.DrawPrimitiveUP(D3DPT_LINELIST, gridDivisions, xGridLines[1].vertex[1], sizeof(xGridLines[1].vertex[1]));
                    D3DDevice.DrawPrimitiveUP(D3DPT_LINELIST, gridDivisions, yGridLines[1].vertex[1], sizeof(yGridLines[1].vertex[1]));
                  end
                else
                  if (gridSpacing * zoomFactor >= 8) then
                    begin
                      D3DDevice.DrawPrimitiveUP(D3DPT_LINELIST, 1, xGridLines[1].vertex[1], sizeof(xGridLines[1].vertex[1]));
                      D3DDevice.DrawPrimitiveUP(D3DPT_LINELIST, 1, yGridLines[1].vertex[1], sizeof(yGridLines[1].vertex[1]));
                    end;
                    for j := 1 to gridDivisions do
                    begin
                      xGridLines[j].vertex[1].Y := xGridLines[j].vertex[1].Y + gridSpacing * zoomFactor;
                      xGridLines[j].vertex[2].Y := xGridLines[j].vertex[1].Y;
                      yGridLines[j].vertex[1].X := yGridLines[j].vertex[1].X + gridSpacing * zoomFactor;
                      yGridLines[j].vertex[2].X := yGridLines[j].vertex[1].X;
                    end;
                  end;
                end;
                D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, false);
                if clrWireframe and (showWireframe or showPoints) then
                  begin
                    D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, 1);
                    D3DDevice.SetRenderState(D3DRS_SRCBLEND, wireBlendSrc);
                    D3DDevice.SetRenderState(D3DRS_DESTBLEND, wireBlendDest);
                  end;
                  //draw wireframe
                  if showWireframe and (polyCount > 0) then
                    begin
                      D3DDevice.SetRenderState(D3DRS_FILLMODE, D3DFILL_WIREFRAME);
                      for i := 1 to polyCount do
                      begin
                        D3DDevice.DrawPrimitiveUP(D3DPT_TRIANGLELIST, 1, Polys[i].vertex[1], sizeof(Polys[1].vertex[1]));
                      end;
                      D3DDevice.SetRenderState(D3DRS_FILLMODE, D3DFILL_SOLID);
                    end;
                    //draw scenery boxes
                    sc.X := 1;
                    sc.Y := 1;
                    srcRect.right := 8;
                    srcRect.bottom := 8;
                    if (sceneryCount > 0) and showScenery then
                      begin
                        for i := 1 to sceneryCount do
                        begin
                          sVal := Scenery[i].Style;
                          sceneryCoords[0] := CreateCustomVertex(0, 0, 1, 1, ARGB(255, Scenery[i].Color), 0, 0);
                          if (Scenery[i].selected = 1) or (Scenery[i].selected = 3) then
                            begin
                              sceneryCoords[0].Color := ARGB(255, pointClr);
                            end;
                            sceneryCoords[1] := sceneryCoords[0];
                            sceneryCoords[2] := sceneryCoords[0];
                            sceneryCoords[3] := sceneryCoords[0];
                            sceneryCoords[0].X := Scenery[i].screenTr.X;
                            sceneryCoords[0].Y := Scenery[i].screenTr.Y;
                            if (Scenery[i].selected = 1) and ctrlDown and ((scaleDiff.X <> 1) or (scaleDiff.Y <> 1)) then
                              begin
                                xVal := SceneryTextures[Scenery[i].Style].Width * Scenery[i].Scaling.X;
                                yVal := SceneryTextures[Scenery[i].Style].Height * Scenery[i].Scaling.Y;
                                theta := GetAngle(xVal, yVal) + Scenery[i].rotation;
                                R := Sqr(sqr(xVal) + sqr(yVal));
                                xVal := Cos(theta) * R * scaleDiff.X;
                                yVal := -Sin(theta) * R * scaleDiff.Y;
                                theta := GetAngle(xVal, yVal) - Scenery[i].rotation;
                                R := Sqr(sqr(xVal) + sqr(yVal));
                                sc.X := (Cos(theta) * R);
                                sc.Y := -(Sin(theta) * R);
                                sceneryCoords[1].X := sceneryCoords[0].X + Cos(Scenery[i].rotation) * sc.X * zoomFactor;
                                sceneryCoords[1].Y := sceneryCoords[0].Y - Sin(Scenery[i].rotation) * sc.X * zoomFactor;
                                sceneryCoords[3].X := sceneryCoords[0].X + Sin(Scenery[i].rotation) * sc.Y * zoomFactor;
                                sceneryCoords[3].Y := sceneryCoords[0].Y + Cos(Scenery[i].rotation) * sc.Y * zoomFactor;
                              end
                            else
                              if (Scenery[i].selected = 1) and ((rDiff <> 0) or ((scaleDiff.X <> 0) or (scaleDiff.Y <> 0))) then
                                begin
                                  sceneryCoords[1].X := sceneryCoords[0].X + Cos(Scenery[i].rotation - rDiff) * (SceneryTextures[sVal].Width) * Scenery[i].Scaling.X * zoomFactor;
                                  sceneryCoords[1].Y := sceneryCoords[0].Y - Sin(Scenery[i].rotation - rDiff) * (SceneryTextures[sVal].Width) * Scenery[i].Scaling.X * zoomFactor;
                                  sceneryCoords[3].X := sceneryCoords[0].X + Sin(Scenery[i].rotation - rDiff) * (SceneryTextures[sVal].Height) * Scenery[i].Scaling.Y * zoomFactor;
                                  sceneryCoords[3].Y := sceneryCoords[0].Y + Cos(Scenery[i].rotation - rDiff) * (SceneryTextures[sVal].Height) * Scenery[i].Scaling.Y * zoomFactor;
                                end
                              else
                              begin
                                sceneryCoords[1].X := sceneryCoords[0].X + Cos(Scenery[i].rotation) * (SceneryTextures[sVal].Width) * Scenery[i].Scaling.X * zoomFactor;
                                sceneryCoords[1].Y := sceneryCoords[0].Y - Sin(Scenery[i].rotation) * (SceneryTextures[sVal].Width) * Scenery[i].Scaling.X * zoomFactor;
                                sceneryCoords[3].X := sceneryCoords[0].X + Sin(Scenery[i].rotation) * (SceneryTextures[sVal].Height) * Scenery[i].Scaling.Y * zoomFactor;
                                sceneryCoords[3].Y := sceneryCoords[0].Y + Cos(Scenery[i].rotation) * (SceneryTextures[sVal].Height) * Scenery[i].Scaling.Y * zoomFactor;
                              end;
                              sceneryCoords[2].X := sceneryCoords[3].X + sceneryCoords[1].X - sceneryCoords[0].X;
                              sceneryCoords[2].Y := sceneryCoords[3].Y + sceneryCoords[1].Y - sceneryCoords[0].Y;
                              sceneryCoords[4] := sceneryCoords[0];
                              if showWireframe or (Scenery[i].selected = 1) or (Scenery[i].selected = 3) then
                                begin
                                  D3DDevice.DrawPrimitiveUP(D3DPT_LINESTRIP, 4, sceneryCoords[0], sizeof(sceneryCoords[0]));
                                end;
                                if showPoints or (Scenery[i].selected = 1) or (Scenery[i].selected = 3) then
                                  begin
                                    if sceneryVerts then
                                      begin
                                        D3DDevice.DrawPrimitiveUP(D3DPT_POINTLIST, 4, sceneryCoords[0], sizeof(sceneryCoords[0]));
                                      end
                                    else
                                    begin
                                      D3DDevice.DrawPrimitiveUP(D3DPT_POINTLIST, 1, sceneryCoords[0], sizeof(sceneryCoords[0]));
                                    end;
                                  end;
                                end;
                                if (currentTool = TOOL_SCENERY) and (Scenery[0].Style > 0) and not (ctrlDown or altDown) then
                                  begin
                                    sVal := Scenery[0].Style;
                                    sceneryCoords[0] := CreateCustomVertex(0, 0, 1, 1, Scenery[0].Color, 0, 0);
                                    sceneryCoords[1] := CreateCustomVertex(0, 0, 1, 1, Scenery[0].Color, 0, 0);
                                    sceneryCoords[2] := CreateCustomVertex(0, 0, 1, 1, Scenery[0].Color, 0, 0);
                                    sceneryCoords[3] := CreateCustomVertex(0, 0, 1, 1, Scenery[0].Color, 0, 0);
                                    sceneryCoords[0].X := Scenery[0].screenTr.X;
                                    sceneryCoords[0].Y := Scenery[0].screenTr.Y;
                                    sceneryCoords[1].X := sceneryCoords[0].X + Cos(Scenery[0].rotation) * (SceneryTextures[sVal].Width + 0) * Scenery[0].Scaling.X * zoomFactor;
                                    sceneryCoords[1].Y := sceneryCoords[0].Y - Sin(Scenery[0].rotation) * (SceneryTextures[sVal].Width + 0) * Scenery[0].Scaling.X * zoomFactor;
                                    sceneryCoords[3].X := sceneryCoords[0].X + Sin(Scenery[0].rotation) * (SceneryTextures[sVal].Height + 0) * Scenery[0].Scaling.Y * zoomFactor;
                                    sceneryCoords[3].Y := sceneryCoords[0].Y + Cos(Scenery[0].rotation) * (SceneryTextures[sVal].Height + 0) * Scenery[0].Scaling.Y * zoomFactor;
                                    sceneryCoords[2].X := sceneryCoords[3].X + sceneryCoords[1].X - sceneryCoords[0].X;
                                    sceneryCoords[2].Y := sceneryCoords[3].Y + sceneryCoords[1].Y - sceneryCoords[0].Y;
                                    sceneryCoords[4] := sceneryCoords[0];
                                    D3DDevice.DrawPrimitiveUP(D3DPT_LINESTRIP, 4, sceneryCoords[0], sizeof(sceneryCoords[0]));
                                  end;
                                end;
                                if (numVerts > 0) and (currentTool = TOOL_CREATE) then
                                  begin
                                    D3DDevice.SetRenderState(D3DRS_FILLMODE, D3DFILL_WIREFRAME);
                                    D3DDevice.DrawPrimitiveUP(D3DPT_TRIANGLELIST, 1, Polys[polyCount + 1].vertex[1], sizeof(Polys[polyCount + 1].vertex[1]));
                                    D3DDevice.SetRenderState(D3DRS_FILLMODE, D3DFILL_SOLID);
                                  end;
                                  D3DDevice.setTexture(0, particleTexture);
                                  //draw points
                                  if showPoints and (numPolys > 0) then
                                    begin
                                      D3DDevice.SetRenderState(D3DRS_FILLMODE, D3DFILL_POINT);
                                      for i := 1 to numPolys do
                                      begin
                                        lineCoords[1] := Polys[i].vertex[1];
                                        lineCoords[2] := Polys[i].vertex[2];
                                        lineCoords[3] := Polys[i].vertex[3];
                                        lineCoords[1].z := 1;
                                        lineCoords[2].z := 1;
                                        lineCoords[3].z := 1;
                                        lineCoords[1].rhw := 1;
                                        lineCoords[2].rhw := 1;
                                        lineCoords[3].rhw := 1;
                                        D3DDevice.DrawPrimitiveUP(D3DPT_POINTLIST, 3, lineCoords[1], sizeof(lineCoords[1]));
                                      end;
                                      D3DDevice.SetRenderState(D3DRS_FILLMODE, D3DFILL_SOLID);
                                    end;
                                    if showPoints and showObjects and (colliderCount > 0) then
                                      begin
                                        sceneryCoords[0] := CreateCustomVertex(0, 0, 1, 1, Scenery[0].Color, 0, 0);
                                        for i := 1 to colliderCount do
                                        begin
                                          sceneryCoords[0].X := (Colliders[i].X - scrollCoords[2].X) * zoomFactor;
                                          sceneryCoords[0].Y := (Colliders[i].Y - scrollCoords[2].Y) * zoomFactor;
                                          if (Colliders[i].active = 1) then
                                            begin
                                              sceneryCoords[0].Color := selectionClr;
                                            end
                                          else
                                          begin
                                            sceneryCoords[0].Color := ARGB(255, RGB(255, 255, 255));
                                          end;
                                          D3DDevice.DrawPrimitiveUP(D3DPT_POINTLIST, 1, sceneryCoords[0], sizeof(sceneryCoords[0]));
                                        end;
                                      end;
                                      //draw selected poly wireframes
                                      D3DDevice.setTexture(0, nil);
                                      if (numSelectedPolys > 0) then
                                        begin
                                          D3DDevice.SetRenderState(D3DRS_FILLMODE, D3DFILL_WIREFRAME);
                                          for i := 1 to numSelectedPolys do
                                          begin
                                            lineCoords[1] := Polys[selectedPolys[i]].vertex[1];
                                            lineCoords[2] := Polys[selectedPolys[i]].vertex[2];
                                            lineCoords[3] := Polys[selectedPolys[i]].vertex[3];
                                            lineCoords[1].z := 1;
                                            lineCoords[1].rhw := 1;
                                            lineCoords[2].z := 1;
                                            lineCoords[2].rhw := 1;
                                            lineCoords[3].z := 1;
                                            lineCoords[3].rhw := 1;
                                            if (vertexList[selectedPolys[i]].vertex[1] = 1) or (vertexList[selectedPolys[i]].vertex[1] = 3) then
                                              begin
                                                lineCoords[1].Color := pointClr;
                                              end;
                                              if (vertexList[selectedPolys[i]].vertex[2] = 1) or (vertexList[selectedPolys[i]].vertex[2] = 3) then
                                                begin
                                                  lineCoords[2].Color := pointClr;
                                                end;
                                                if (vertexList[selectedPolys[i]].vertex[3] = 1) or (vertexList[selectedPolys[i]].vertex[3] = 3) then
                                                  begin
                                                    lineCoords[3].Color := pointClr;
                                                  end;
                                                  D3DDevice.DrawPrimitiveUP(D3DPT_TRIANGLELIST, 1, lineCoords[1], sizeof(lineCoords[1]));
                                                  if showPoints then
                                                    begin
                                                      if (vertexList[selectedPolys[i]].vertex[1] = 1) then
                                                        begin
                                                          lineCoords[1].Color := pointClr;
                                                        end;
                                                        if (vertexList[selectedPolys[i]].vertex[2] = 1) then
                                                          begin
                                                            lineCoords[2].Color := pointClr;
                                                          end;
                                                          if (vertexList[selectedPolys[i]].vertex[3] = 1) then
                                                            begin
                                                              lineCoords[3].Color := pointClr;
                                                            end;
                                                            D3DDevice.setTexture(0, particleTexture);
                                                            D3DDevice.DrawPrimitiveUP(D3DPT_POINTLIST, 3, lineCoords[1], sizeof(lineCoords[1]));
                                                            D3DDevice.setTexture(0, nil);
                                                          end;
                                                        end;
                                                        D3DDevice.SetRenderState(D3DRS_FILLMODE, D3DFILL_SOLID);
                                                      end;
                                                      D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, 0);
                                                      //draw selection rect
                                                      if (currentTool = TOOL_MOVE) and ((numSelectedPolys > 0) or (numSelectedScenery > 0)) and (noneSelected = false) then
                                                        begin
                                                          objClr := $80FFFFFF;
                                                          D3DDevice.SetRenderState(D3DRS_SRCBLEND, D3DBLEND_SRCALPHA);
                                                          D3DDevice.SetRenderState(D3DRS_DESTBLEND, D3DBLEND_INVSRCALPHA);
                                                          D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, true);
                                                          D3DDevice.setTexture(0, lineTexture);
                                                          sceneryCoords[0] := CreateCustomVertex(0, 0, 1, 1, objClr, 0, 0);
                                                          sceneryCoords[1] := CreateCustomVertex(0, 0, 1, 1, objClr, 0, 0);
                                                          sceneryCoords[2] := CreateCustomVertex(0, 0, 1, 1, objClr, 0, 0);
                                                          sceneryCoords[3] := CreateCustomVertex(0, 0, 1, 1, objClr, 0, 0);
                                                          if (rDiff <> 0) then
                                                            begin
                                                              for i := 0 to 3 do
                                                              begin
                                                                xVal := (selRect[i].X - rCenter.X);
                                                                yVal := (selRect[i].Y - rCenter.Y);
                                                                R := Sqr(sqr(xVal) + sqr(yVal));
                                                                theta := GetAngle(xVal, yVal) - rDiff;
                                                                sceneryCoords[i].X := (rCenter.X + R * Cos(theta) - scrollCoords[2].X) * zoomFactor;
                                                                sceneryCoords[i].Y := (rCenter.Y + R * -Sin(theta) - scrollCoords[2].Y) * zoomFactor;
                                                              end;
                                                            end
                                                          else
                                                            if (scaleDiff.X <> 1) or (scaleDiff.Y <> 1) then
                                                              begin
                                                                for i := 0 to 3 do
                                                                begin
                                                                  sceneryCoords[i].X := (rCenter.X + ((selRect[i].X - rCenter.X) * scaleDiff.X) - scrollCoords[2].X) * zoomFactor;
                                                                  sceneryCoords[i].Y := (rCenter.Y + ((selRect[i].Y - rCenter.Y) * scaleDiff.Y) - scrollCoords[2].Y) * zoomFactor;
                                                                end;
                                                              end
                                                            else
                                                            begin
                                                              for i := 0 to 3 do
                                                              begin
                                                                sceneryCoords[i].X := (selRect[i].X - scrollCoords[2].X) * zoomFactor;
                                                                sceneryCoords[i].Y := (selRect[i].Y - scrollCoords[2].Y) * zoomFactor;
                                                              end;
                                                            end;
                                                            sceneryCoords[0].tu := 0;
                                                            sceneryCoords[0].tv := 0;
                                                            sceneryCoords[1].tu := Sqr(sqr(sceneryCoords[1].X - sceneryCoords[0].X) + sqr(sceneryCoords[1].Y - sceneryCoords[0].Y)) / 64;
                                                            sceneryCoords[1].tv := 0;
                                                            sceneryCoords[2].tu := sceneryCoords[1].tu;
                                                            sceneryCoords[2].tv := Sqr(sqr(sceneryCoords[2].X - sceneryCoords[1].X) + sqr(sceneryCoords[2].Y - sceneryCoords[1].Y)) / 64;
                                                            sceneryCoords[3].tu := 0;
                                                            sceneryCoords[3].tv := sceneryCoords[2].tv;
                                                            sceneryCoords[4] := sceneryCoords[0];
                                                            D3DDevice.DrawPrimitiveUP(D3DPT_LINESTRIP, 4, sceneryCoords[0], sizeof(sceneryCoords[0]));
                                                            D3DDevice.setTexture(0, nil);
                                                            D3DDevice.DrawPrimitiveUP(D3DPT_POINTLIST, 4, sceneryCoords[0], sizeof(sceneryCoords[0]));
                                                            for i := 0 to 3 do
                                                            begin
                                                              sceneryCoords[i].X := Midpoint(sceneryCoords[i].X, sceneryCoords[i + 1].X);
                                                              sceneryCoords[i].Y := Midpoint(sceneryCoords[i].Y, sceneryCoords[i + 1].Y);
                                                            end;
                                                            D3DDevice.DrawPrimitiveUP(D3DPT_POINTLIST, 4, sceneryCoords[0], sizeof(sceneryCoords[0]));
                                                            if not mnuFixedRCenter.Checked then
                                                              begin
                                                                sceneryCoords[0].X := (rCenter.X - scrollCoords[2].X) * zoomFactor;
                                                                sceneryCoords[0].Y := (rCenter.Y - scrollCoords[2].Y) * zoomFactor;
                                                                D3DDevice.setTexture(0, rCenterTexture);
                                                                D3DDevice.DrawPrimitiveUP(D3DPT_POINTLIST, 1, sceneryCoords[0], sizeof(sceneryCoords[0]));
                                                              end;
                                                              D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, false);
                                                            end;
                                                            if showWaypoints then
                                                              begin
                                                                objClr := $FFFFFFFF;
                                                                for i := 1 to waypointCount do
                                                                begin
                                                                  if ((Waypoints[i].pathNum = 1) and (frmWaypoints.showPaths <> 2)) or ((Waypoints[i].pathNum = 2) and (frmWaypoints.showPaths <> 1)) then
                                                                    begin
                                                                      if (Waypoints[i].selected = true) then
                                                                        begin
                                                                          if (Waypoints[i].pathNum = 1) then
                                                                            begin
                                                                              srcRect.left := (objTexSize.X / 8) * 5;
                                                                            end
                                                                          else
                                                                          begin
                                                                            srcRect.left := (objTexSize.X / 8) * 6;
                                                                          end;
                                                                        end
                                                                      else
                                                                      begin
                                                                        if (Waypoints[i].pathNum = 1) then
                                                                          begin
                                                                            srcRect.left := (objTexSize.X / 8) * 3;
                                                                          end
                                                                        else
                                                                        begin
                                                                          srcRect.left := (objTexSize.X / 8) * 4;
                                                                        end;
                                                                      end;
                                                                      sc.X := 32 / (objTexSize.X / 8);
                                                                      sc.Y := 32 / (objTexSize.Y / 4);
                                                                      srcRect.Top := (objTexSize.Y / 4) * 2;
                                                                      srcRect.right := srcRect.left + (objTexSize.X / 8);
                                                                      srcRect.bottom := srcRect.Top + (objTexSize.Y / 4);
                                                                      tr.X := Floor((Waypoints[i].X - scrollCoords[2].X) * zoomFactor - 15 + 0.5);
                                                                      tr.Y := Floor((Waypoints[i].Y - scrollCoords[2].Y) * zoomFactor - 15 + 0.5);
                                                                      scenerySprite.Draw(objectsTexture, srcRect, sc, rc, 0, tr, objClr);
                                                                    end;
                                                                  end;
                                                                  D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, true);
                                                                  D3DDevice.setTexture(0, pathTexture);
                                                                  for i := 1 to conCount do
                                                                  begin
                                                                    if ((Waypoints[Connections[i].point1].pathNum = 1) and (frmWaypoints.showPaths <> 2)) or ((Waypoints[Connections[i].point1].pathNum = 2) and (frmWaypoints.showPaths <> 1)) or ((Waypoints[Connections[i].point2].pathNum = 1) and (frmWaypoints.showPaths <> 2)) or ((Waypoints[Connections[i].point2].pathNum = 2) and (frmWaypoints.showPaths <> 1)) then
                                                                      begin
                                                                        lineCoords[1].X := (Waypoints[Connections[i].point1].X - scrollCoords[2].X) * zoomFactor;
                                                                        lineCoords[1].Y := (Waypoints[Connections[i].point1].Y - scrollCoords[2].Y) * zoomFactor;
                                                                        lineCoords[2].X := (Waypoints[Connections[i].point2].X - scrollCoords[2].X) * zoomFactor;
                                                                        lineCoords[2].Y := (Waypoints[Connections[i].point2].Y - scrollCoords[2].Y) * zoomFactor;
                                                                        if Waypoints[Connections[i].point2].wayType[2] then
                                                                          begin
                                                                            lineCoords[1].Color := $FFFFFF22;
                                                                            lineCoords[2].Color := $FFFFFF22;
                                                                          end
                                                                        else
                                                                          if Waypoints[Connections[i].point2].wayType[3] then
                                                                            begin
                                                                              lineCoords[1].Color := $FF22FFFF;
                                                                              lineCoords[2].Color := $FF22FFFF;
                                                                            end
                                                                          else
                                                                            if Waypoints[Connections[i].point2].wayType[0] then
                                                                              begin
                                                                                lineCoords[1].Color := $FF22FF22;
                                                                                lineCoords[2].Color := $FF22FF22;
                                                                              end
                                                                            else
                                                                              if Waypoints[Connections[i].point2].wayType[1] then
                                                                                begin
                                                                                  lineCoords[1].Color := $FFFF2222;
                                                                                  lineCoords[2].Color := $FFFF2222;
                                                                                end
                                                                              else
                                                                                if Waypoints[Connections[i].point2].wayType[4] then
                                                                                  begin
                                                                                    lineCoords[1].Color := $FFFFFFFF;
                                                                                    lineCoords[2].Color := $FFFFFFFF;
                                                                                  end
                                                                                else
                                                                                begin
                                                                                  lineCoords[1].Color := $FF000000;
                                                                                  lineCoords[2].Color := $FF000000;
                                                                                end;
                                                                                lineCoords[1].tu := 0;
                                                                                lineCoords[1].tv := 0;
                                                                                lineCoords[2].tu := 1;
                                                                                lineCoords[2].tv := 0;
                                                                                D3DDevice.DrawPrimitiveUP(D3DPT_LINESTRIP, 1, lineCoords[1], sizeof(lineCoords[1]));
                                                                              end;
                                                                            end;
                                                                            if (currentWaypoint > 0) then
                                                                              begin
                                                                                lineCoords[1].X := (Waypoints[currentWaypoint].X - scrollCoords[2].X) * zoomFactor;
                                                                                lineCoords[1].Y := (Waypoints[currentWaypoint].Y - scrollCoords[2].Y) * zoomFactor;
                                                                                lineCoords[2].X := mouseCoords.X;
                                                                                lineCoords[2].Y := mouseCoords.Y;
                                                                                if mnuWayType(2).Checked then
                                                                                  begin
                                                                                    lineCoords[1].Color := $FFFFFF22;
                                                                                    lineCoords[2].Color := $FFFFFF22;
                                                                                  end
                                                                                else
                                                                                  if mnuWayType(3).Checked then
                                                                                    begin
                                                                                      lineCoords[1].Color := $FF22FFFF;
                                                                                      lineCoords[2].Color := $FF22FFFF;
                                                                                    end
                                                                                  else
                                                                                    if mnuWayType(0).Checked then
                                                                                      begin
                                                                                        lineCoords[1].Color := $FF22FF22;
                                                                                        lineCoords[2].Color := $FF22FF22;
                                                                                      end
                                                                                    else
                                                                                      if mnuWayType(1).Checked then
                                                                                        begin
                                                                                          lineCoords[1].Color := $FFFF2222;
                                                                                          lineCoords[2].Color := $FFFF2222;
                                                                                        end
                                                                                      else
                                                                                        if mnuWayType(4).Checked then
                                                                                          begin
                                                                                            lineCoords[1].Color := $FFFFFFFF;
                                                                                            lineCoords[2].Color := $FFFFFFFF;
                                                                                          end
                                                                                        else
                                                                                        begin
                                                                                          lineCoords[1].Color := $FF000000;
                                                                                          lineCoords[2].Color := $FF000000;
                                                                                        end;
                                                                                        lineCoords[1].tu := 0;
                                                                                        lineCoords[1].tv := 0;
                                                                                        lineCoords[2].tu := 1;
                                                                                        lineCoords[2].tv := 0;
                                                                                        D3DDevice.DrawPrimitiveUP(D3DPT_LINESTRIP, 1, lineCoords[1], sizeof(lineCoords[1]));
                                                                                      end;
                                                                                      D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, false);
                                                                                    end;
                                                                                    if showSketch then
                                                                                      begin
                                                                                        D3DDevice.SetVertexShader(FVF2);
                                                                                        D3DDevice.setTexture(0, sketchTexture);
                                                                                        if (sketchLines > 0) then
                                                                                          begin
                                                                                            D3DDevice.DrawPrimitiveUP(D3DPT_LINELIST, sketchLines, sketch[1].vertex[1], sizeof(sketch[1].vertex[1]));
                                                                                          end;
                                                                                          D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, false);
                                                                                          if (currentFunction = TOOL_SKETCH) and shiftDown then
                                                                                            begin
                                                                                              D3DDevice.DrawPrimitiveUP(D3DPT_LINELIST, 1, sketch[0].vertex[1], sizeof(sketch[0].vertex[1]));
                                                                                            end;
                                                                                            D3DDevice.SetVertexShader(FVF);
                                                                                          end;
                                                                                          D3DDevice.SetRenderState(D3DRS_SRCBLEND, D3DBLEND_INVDESTCOLOR);
                                                                                          D3DDevice.SetRenderState(D3DRS_DESTBLEND, D3DBLEND_INVSRCALPHA);
                                                                                          D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, true);
                                                                                          //draw circle
                                                                                          if circleOn then
                                                                                            begin
                                                                                              for i := 0 to 32 do
                                                                                              begin
                                                                                                circleCoords[i].Color := ARGB(255, RGB(255, 255, 255));
                                                                                                circleCoords[i].X := mouseCoords.X + zoomFactor * clrRadius * Math.Cos(pi * i / 16);
                                                                                                circleCoords[i].Y := mouseCoords.Y + zoomFactor * clrRadius * Math.Sin(pi * i / 16);
                                                                                              end;
                                                                                              D3DDevice.DrawPrimitiveUP(D3DPT_LINESTRIP, 32, circleCoords[0], sizeof(circleCoords[0]));
                                                                                            end;
                                                                                            //vertex selection --------
                                                                                            if (currentFunction = TOOL_VSELECT) or (currentFunction = TOOL_VSELADD) or (currentFunction = TOOL_VSELSUB) then
                                                                                              begin
                                                                                                if toolAction then
                                                                                                  begin
                                                                                                    circleCoords[0].Color := ARGB(255, RGB(255, 255, 255));
                                                                                                    circleCoords[1].Color := ARGB(255, RGB(255, 255, 255));
                                                                                                    circleCoords[2].Color := ARGB(255, RGB(255, 255, 255));
                                                                                                    circleCoords[3].Color := ARGB(255, RGB(255, 255, 255));
                                                                                                    circleCoords[4].Color := ARGB(255, RGB(255, 255, 255));
                                                                                                    circleCoords[0].X := selectedCoords[1].X;
                                                                                                    circleCoords[1].X := mouseCoords.X;
                                                                                                    circleCoords[2].X := mouseCoords.X;
                                                                                                    circleCoords[3].X := selectedCoords[1].X;
                                                                                                    circleCoords[4].X := selectedCoords[1].X;
                                                                                                    circleCoords[0].Y := selectedCoords[1].Y;
                                                                                                    circleCoords[1].Y := selectedCoords[1].Y;
                                                                                                    circleCoords[2].Y := mouseCoords.Y;
                                                                                                    circleCoords[3].Y := mouseCoords.Y;
                                                                                                    circleCoords[4].Y := selectedCoords[1].Y;
                                                                                                    D3DDevice.DrawPrimitiveUP(D3DPT_LINESTRIP, 4, circleCoords[0], sizeof(circleCoords[0]));
                                                                                                  end;
                                                                                                end;
                                                                                                D3DDevice.SetRenderState(D3DRS_ALPHABLENDENABLE, false);
                                                                                                //----
                                                                                                D3DDevice.EndScene;
                                                                                                D3DDevice.Present(0, 0, 0, 0);
                                                                                                eraseCircle := false;
                                                                                                Exit;
                                                                                                ErrorHandler:
                                                                                                  Application.MessageBox(pchar('Error Rendering with Direct3D' + vbNewLine + D3DX.GetErrorString(Err.Number)), pchar(''), MB_OK) {HelpFile:None, Context:None};
                                                                                              end;

function TfrmSoldatMapEditor.getRGB(var DecValue: Longint): TColour;
var
  hexValue: widestring;
begin
  hexValue := Hex(Val(DecValue));
  if (length(hexValue) < 6) then
    begin
      hexValue := StringOfChar('0', 6 - length(hexValue)) + hexValue;
    end;
    result.blue := StrToInt('&H' + RightStr(hexValue, 2));
    hexValue := LeftStr(hexValue, length(hexValue) - 2);
    result.green := StrToInt('&H' + RightStr(hexValue, 2));
    hexValue := LeftStr(hexValue, length(hexValue) - 2);
    result.red := StrToInt('&H' + RightStr(hexValue, 2));
  end;

function TfrmSoldatMapEditor.getAlpha(var tehColour: Longint): Byte;
var
  hexValue: widestring;
begin
  hexValue := Hex(Val(tehColour));
  if (length(hexValue) <= 6) then
    begin
      result := 0;
    end
  else
  begin
    if (length(hexValue) < 8) then
      begin
        hexValue := StringOfChar('0', 8 - length(hexValue)) + hexValue;
      end;
      result := StrToInt('&H' + LeftStr(hexValue, 2));
    end;
  end;

function TfrmSoldatMapEditor.ARGB(alphaVal: Byte; var clrVal: Longint): Longint;
var
  clrString: widestring;
begin
  clrString := Hex(clrVal);
  if (length(clrString) < 6) then
    begin
      clrString := StringOfChar('0', 6 - length(clrString)) + clrString;
    end
  else
    if (length(clrString) > 6) then
      begin
        clrString := RightStr(clrString, 6);
      end;
      if (length(Hex(alphaVal)) = 1) then
        begin
          clrString := '0' + Hex(alphaVal) + clrString;
        end
      else
        if (length(Hex(alphaVal)) = 2) then
          begin
            clrString := Hex(alphaVal) + clrString;
          end;
          result := StrToInt('&H' + clrString);
        end;

function TfrmSoldatMapEditor.makeColour(var red: Byte; var green: Byte; var blue: Byte): TColour;
begin
  result.red := red;
  result.green := green;
  result.blue := blue;
end;

function TfrmSoldatMapEditor.FtoDW(var f: Single): Longint;
var
  buf: D3DXBuffer;
  l: Longint;
begin
  buf := D3DX.CreateBuffer(4);
  D3DX.BufferSetData(buf, 0, 4, 1, f);
  D3DX.BufferGetData(buf, 0, 4, 1, l);
  result := l;
end;

procedure TfrmSoldatMapEditor.DirectXEvent8_DXCallback(eventid: Longint);
const
  {$WRITEABLECONST ON}
  tempFunction: Byte = 0;
  {$WRITEABLECONST OFF}
var
  i: Longint;
  hotKeyPressed: Smallint;
  wayptKeyPressed: Smallint;
  layerKeyPressed: Smallint;
  pBuffer: array[0..BufferSize] of DIDEVICEOBJECTDATA;
  n: Single;
  label
  ErrorHandler;
  begin
    //ON ERROR
    if (DIDevice = nil) then
      begin
        Exit;
      end;
      if (eventid = hEvent) then
        begin
          DIDevice.GetDeviceStateKeyboard(DIState);
          DIDevice.GetDeviceData(pBuffer, DIGDD_DEFAULT);
          if (tvwScenery.Visible = true) then
            begin
              Exit;
            end;
            if (Screen.ActiveForm.hWnd <> self.hWnd) or (self.ActiveControl = txtZoom) then
              begin
                Exit;
              end;
              if (DIState.Key(DIK_SPACE) = 128) and not spaceDown then
                begin
                  circleOn := false;
                  spaceDown := true;
                  scrollCoords[1].X := mouseCoords.X;
                  scrollCoords[1].Y := mouseCoords.Y;
                  SetCursor(TOOL_HAND + 1);
                  Exit;
                end
              else
                if ((DIState.Key(DIK_LSHIFT) = 128) or (DIState.Key(DIK_RSHIFT) = 128)) and not shiftDown then
                  begin
                    circleOn := false;
                    shiftDown := true;
                    tmp{DECLARE} := currentTool;
                    if (tmp = TOOL_VSELECT) //add verts then
                      begin
                        currentFunction := TOOL_VSELADD;
                      end
                    else
                      if (tmp = TOOL_PSELECT) //add polys then
                        begin
                          currentFunction := TOOL_PSELADD;
                        end
                      else
                        if (tmp = TOOL_WAYPOINT) then
                          begin
                            currentFunction := TOOL_CONNECT;
                          end
                        else
                          if (tmp = TOOL_CLRPICKER) then
                            begin
                              currentFunction := TOOL_PIXPICKER;
                            end
                          else
                            if (tmp = TOOL_SKETCH) then
                              begin
                                sketch[0].vertex[1].X := mouseCoords.X / zoomFactor + scrollCoords[2].X;
                                sketch[0].vertex[1].Y := mouseCoords.Y / zoomFactor + scrollCoords[2].Y;
                              end;
                              SetCursor(currentFunction + 1);
                              lblCurrentTool.Caption := frmSoldatMapEditor.ImageList.ListImages(currentFunction + 1).Tag;
                              Exit;
                            end
                          else
                            if ((DIState.Key(DIK_LCONTROL) = 128) or (DIState.Key(DIK_RCONTROL) = 128)) and not ctrlDown then
                              begin
                                circleOn := false;
                                ctrlDown := true;
                                tmp{DECLARE} := currentTool;
                                if (tmp = TOOL_MOVE) then
                                  begin
                                    currentFunction := TOOL_SCALE;
                                    if altDown then
                                      begin
                                        ApplyTransform(true);
                                      end;
                                      toolAction := false;
                                    end
                                  else
                                    if (tmp = TOOL_SKETCH) then
                                      begin
                                        currentFunction := TOOL_SMUDGE;
                                        circleOn := true;
                                      end
                                    else
                                      if (tmp > TOOL_MOVE) then
                                        begin
                                          currentFunction := TOOL_MOVE;
                                          if (currentTool <> TOOL_CREATE) then
                                            begin
                                              toolAction := false;
                                            end;
                                          end;
                                          Render;
                                          SetCursor(currentFunction + 1);
                                          lblCurrentTool.Caption := frmSoldatMapEditor.ImageList.ListImages(currentFunction + 1).Tag;
                                          Exit;
                                        end
                                      else
                                        if ((DIState.Key(DIK_LALT) = 128) or (DIState.Key(DIK_RALT) = 128)) and not altDown then
                                          begin
                                            circleOn := false;
                                            altDown := true;
                                            tmp{DECLARE} := currentTool;
                                            if (tmp = TOOL_MOVE) then
                                              begin
                                                currentFunction := TOOL_ROTATE;
                                                if toolAction then
                                                  begin
                                                    if ctrlDown then
                                                      begin
                                                        ApplyTransform(false);
                                                      end;
                                                      toolAction := false;
                                                    end;
                                                  end
                                                else
                                                  if (tmp = TOOL_VSELECT) //subtract verts then
                                                    begin
                                                      currentFunction := TOOL_VSELSUB;
                                                    end
                                                  else
                                                    if (tmp = TOOL_PSELECT) //subtract polys then
                                                      begin
                                                        currentFunction := TOOL_PSELSUB;
                                                      end
                                                    else
                                                      if (tmp = TOOL_VCOLOUR) //colour picker then
                                                        begin
                                                          currentFunction := TOOL_CLRPICKER;
                                                        end
                                                      else
                                                        if (tmp = TOOL_PCOLOUR) //colour picker then
                                                          begin
                                                            currentFunction := TOOL_CLRPICKER;
                                                          end
                                                        else
                                                          if (tmp = TOOL_DEPTHMAP) then
                                                            begin
                                                              currentFunction := TOOL_CLRPICKER;
                                                            end
                                                          else
                                                            if (tmp = TOOL_CLRPICKER) then
                                                              begin
                                                                currentFunction := TOOL_LITPICKER;
                                                              end
                                                            else
                                                              if (tmp = TOOL_SKETCH) then
                                                                begin
                                                                  currentFunction := TOOL_ERASER;
                                                                  circleOn := true;
                                                                end
                                                              else
                                                              begin
                                                                currentFunction := TOOL_VSELECT;
                                                              end;
                                                              if (currentFunction = TOOL_TEXTURE) then
                                                                begin
                                                                  toolAction := false;
                                                                end;
                                                                if (currentFunction = TOOL_VCOLOUR) or (currentFunction = TOOL_DEPTHMAP) then
                                                                  begin
                                                                    circleOn := true;
                                                                  end;
                                                                  Render;
                                                                  SetCursor(currentFunction + 1);
                                                                  lblCurrentTool.Caption := frmSoldatMapEditor.ImageList.ListImages(currentFunction + 1).Tag;
                                                                  Exit;
                                                                end;
                                                                hotKeyPressed := -1;
                                                                for i := 0 to 13 do
                                                                begin
                                                                  if (DIState.Key(frmTools.getHotKey(i))) then
                                                                    begin
                                                                      hotKeyPressed := i;
                                                                    end;
                                                                  end;
                                                                  wayptKeyPressed := -1;
                                                                  for i := 0 to 4 do
                                                                  begin
                                                                    if (DIState.Key(frmWaypoints.getWayptKey(i))) then
                                                                      begin
                                                                        wayptKeyPressed := i;
                                                                      end;
                                                                    end;
                                                                    layerKeyPressed := -1;
                                                                    for i := 0 to 7 do
                                                                    begin
                                                                      if (DIState.Key(frmDisplay.getLayerKey(i))) then
                                                                        begin
                                                                          layerKeyPressed := i;
                                                                        end;
                                                                      end;
                                                                      //key up --------
                                                                      if (pBuffer[0].lData = 0) then
                                                                        begin
                                                                          if (((pBuffer[0].lOfs = DIK_RSHIFT) or (pBuffer[0].lOfs = DIK_LSHIFT)) and shiftDown) then
                                                                            begin
                                                                              shiftDown := false;
                                                                              currentFunction := currentTool;
                                                                              if (currentFunction = TOOL_SKETCH) then
                                                                                begin
                                                                                  toolAction := false;
                                                                                  Render;
                                                                                end
                                                                              else
                                                                                if (currentFunction = TOOL_MOVE) then
                                                                                  begin
                                                                                    if altDown then
                                                                                      begin
                                                                                        currentFunction := TOOL_ROTATE;
                                                                                      end
                                                                                    else
                                                                                      if ctrlDown then
                                                                                        begin
                                                                                          currentFunction := TOOL_SCALE;
                                                                                        end;
                                                                                      end;
                                                                                    end
                                                                                  else
                                                                                    if (((pBuffer[0].lOfs = DIK_RCONTROL) or (pBuffer[0].lOfs = DIK_LCONTROL)) and ctrlDown) then
                                                                                      begin
                                                                                        ctrlDown := false;
                                                                                        if (currentTool = TOOL_VSELECT) then
                                                                                          begin
                                                                                            toolAction := false;
                                                                                          end
                                                                                        else
                                                                                          if (currentTool = TOOL_MOVE) then
                                                                                            begin
                                                                                              ApplyTransform(false);
                                                                                            end
                                                                                          else
                                                                                            if (currentTool = TOOL_SCENERY) then
                                                                                              begin
                                                                                                Scenery[0].screenTr.X := mouseCoords.X;
                                                                                                Scenery[0].screenTr.Y := mouseCoords.Y;
                                                                                                Scenery[0].Translation.X := mouseCoords.X;
                                                                                                Scenery[0].Translation.Y := mouseCoords.Y;
                                                                                              end
                                                                                            else
                                                                                              if (currentTool = TOOL_OBJECTS) then
                                                                                                begin
                                                                                                  Spawns[0].X := mouseCoords.X;
                                                                                                  Spawns[0].Y := mouseCoords.Y;
                                                                                                end
                                                                                              else
                                                                                                if (currentTool = TOOL_DEPTHMAP) then
                                                                                                  begin
                                                                                                    circleOn := true;
                                                                                                  end
                                                                                                else
                                                                                                  if (currentTool = TOOL_VCOLOUR) then
                                                                                                    begin
                                                                                                      circleOn := true;
                                                                                                    end
                                                                                                  else
                                                                                                    if (currentTool = TOOL_SKETCH) then
                                                                                                      begin
                                                                                                        circleOn := false;
                                                                                                      end;
                                                                                                      Render;
                                                                                                      currentFunction := currentTool;
                                                                                                    end
                                                                                                  else
                                                                                                    if (((pBuffer[0].lOfs = DIK_RALT) or (pBuffer[0].lOfs = DIK_LALT)) and altDown) then
                                                                                                      begin
                                                                                                        altDown := false;
                                                                                                        if (currentTool = TOOL_MOVE) then
                                                                                                          begin
                                                                                                            ApplyTransform(true);
                                                                                                          end
                                                                                                        else
                                                                                                          if (currentTool = TOOL_SCENERY) then
                                                                                                            begin
                                                                                                              Scenery[0].screenTr.X := mouseCoords.X;
                                                                                                              Scenery[0].screenTr.Y := mouseCoords.Y;
                                                                                                              Scenery[0].Translation.X := mouseCoords.X;
                                                                                                              Scenery[0].Translation.Y := mouseCoords.Y;
                                                                                                            end
                                                                                                          else
                                                                                                            if (currentTool = TOOL_OBJECTS) then
                                                                                                              begin
                                                                                                                Spawns[0].X := mouseCoords.X;
                                                                                                                Spawns[0].Y := mouseCoords.Y;
                                                                                                              end
                                                                                                            else
                                                                                                              if (currentTool = TOOL_DEPTHMAP) then
                                                                                                                begin
                                                                                                                  circleOn := true;
                                                                                                                end
                                                                                                              else
                                                                                                                if (currentTool = TOOL_VCOLOUR) then
                                                                                                                  begin
                                                                                                                    circleOn := true;
                                                                                                                  end
                                                                                                                else
                                                                                                                  if (currentTool = TOOL_SKETCH) then
                                                                                                                    begin
                                                                                                                      circleOn := false;
                                                                                                                    end;
                                                                                                                    Render;
                                                                                                                    currentFunction := currentTool;
                                                                                                                  end
                                                                                                                else
                                                                                                                  if ((pBuffer[0].lOfs = DIK_SPACE) and spaceDown) //scrolling then
                                                                                                                    begin
                                                                                                                      spaceDown := false;
                                                                                                                    end;
                                                                                                                    SetCursor(currentFunction + 1);
                                                                                                                    lblCurrentTool.Caption := frmSoldatMapEditor.ImageList.ListImages(currentFunction + 1).Tag;
                                                                                                                  end;
                                                                                                                  if ctrlDown //shortcut then
                                                                                                                    begin
                                                                                                                      if (DIState.Key(DIK_EQUALS) = 128) //ctrl++ then
                                                                                                                        begin
                                                                                                                          Zoom(getZoomDir(2)); //2
                                                                                                                        end
                                                                                                                      else
                                                                                                                        if (DIState.Key(DIK_MINUS) = 128) //ctrl+- then
                                                                                                                          begin
                                                                                                                            Zoom(getZoomDir(0.5)); //0.5
                                                                                                                          end
                                                                                                                        else
                                                                                                                          if (DIState.Key(DIK_0) = 128) //ctrl+0 then
                                                                                                                            begin
                                                                                                                              zoomFactor := 1;
                                                                                                                              scrollCoords[2].X := -ScaleWidth / 2;
                                                                                                                              scrollCoords[2].Y := -ScaleHeight / 2;
                                                                                                                              Zoom(1);
                                                                                                                            end
                                                                                                                          else
                                                                                                                            if (DIState.Key(MapVirtualKey(78, 0)) = 128) //ctrl+n then
                                                                                                                              begin
                                                                                                                                mnuNew_Click;
                                                                                                                              end
                                                                                                                            else
                                                                                                                              if (DIState.Key(MapVirtualKey(79, 0)) = 128) //ctrl+o then
                                                                                                                                begin
                                                                                                                                  mnuOpen_Click;
                                                                                                                                end
                                                                                                                              else
                                                                                                                                if (DIState.Key(MapVirtualKey(83, 0)) = 128) and shiftDown //ctrl+shift+s then
                                                                                                                                  begin
                                                                                                                                    mnuSaveAs_Click;
                                                                                                                                  end
                                                                                                                                else
                                                                                                                                  if (DIState.Key(MapVirtualKey(83, 0)) = 128) //ctrl+s then
                                                                                                                                    begin
                                                                                                                                      mnuSave_Click;
                                                                                                                                    end
                                                                                                                                  else
                                                                                                                                    if (DIState.Key(MapVirtualKey(69, 0)) = 128) //ctrl+e then
                                                                                                                                      begin
                                                                                                                                        mnuCreate_Click;
                                                                                                                                      end
                                                                                                                                    else
                                                                                                                                      if (DIState.Key(MapVirtualKey(86, 0)) = 128) //ctrl+v then
                                                                                                                                        begin
                                                                                                                                          mnuPaste_Click;
                                                                                                                                        end
                                                                                                                                      else
                                                                                                                                        if (DIState.Key(MapVirtualKey(67, 0)) = 128) //ctrl+c then
                                                                                                                                          begin
                                                                                                                                            mnuCopy_Click;
                                                                                                                                          end
                                                                                                                                        else
                                                                                                                                          if (DIState.Key(MapVirtualKey(90, 0)) = 128) //ctrl+z then
                                                                                                                                            begin
                                                                                                                                              loadUndo(false);
                                                                                                                                            end
                                                                                                                                          else
                                                                                                                                            if (DIState.Key(MapVirtualKey(89, 0)) = 128) //ctrl+y then
                                                                                                                                              begin
                                                                                                                                                loadUndo(true);
                                                                                                                                              end
                                                                                                                                            else
                                                                                                                                              if (DIState.Key(MapVirtualKey(65, 0)) = 128) //ctrl+a then
                                                                                                                                                begin
                                                                                                                                                  mnuSelectAll_Click;
                                                                                                                                                end
                                                                                                                                              else
                                                                                                                                                if (DIState.Key(MapVirtualKey(68, 0)) = 128) //ctrl+d then
                                                                                                                                                  begin
                                                                                                                                                    mnuDuplicate_Click;
                                                                                                                                                  end
                                                                                                                                                else
                                                                                                                                                  if (DIState.Key(MapVirtualKey(73, 0)) = 128) //ctrl+i then
                                                                                                                                                    begin
                                                                                                                                                      mnuInvertSel_Click;
                                                                                                                                                    end
                                                                                                                                                  else
                                                                                                                                                    if (DIState.Key(MapVirtualKey(66, 0)) = 128) //ctrl+b then
                                                                                                                                                      begin
                                                                                                                                                        mnuSelColour_Click;
                                                                                                                                                      end
                                                                                                                                                    else
                                                                                                                                                      if (DIState.Key(MapVirtualKey(74, 0)) = 128) //ctrl+j then
                                                                                                                                                        begin
                                                                                                                                                          mnuJoinVertices_Click;
                                                                                                                                                        end
                                                                                                                                                      else
                                                                                                                                                        if (DIState.Key(MapVirtualKey(85, 0)) = 128) //ctrl+u then
                                                                                                                                                          begin
                                                                                                                                                            mnuUntexture_Click;
                                                                                                                                                          end
                                                                                                                                                        else
                                                                                                                                                          if (DIState.Key(MapVirtualKey(70, 0)) = 128) //ctrl+f then
                                                                                                                                                            begin
                                                                                                                                                              mnuFixTexture_Click;
                                                                                                                                                            end
                                                                                                                                                          else
                                                                                                                                                            if (DIState.Key(MapVirtualKey(76, 0)) = 128) //ctrl+l then
                                                                                                                                                              begin
                                                                                                                                                                mnuSplit_Click;
                                                                                                                                                              end
                                                                                                                                                            else
                                                                                                                                                              if (DIState.Key(MapVirtualKey(77, 0)) = 128) //ctrl+m then
                                                                                                                                                                begin
                                                                                                                                                                  mnuMap_Click;
                                                                                                                                                                end
                                                                                                                                                              else
                                                                                                                                                                if (DIState.Key(MapVirtualKey(80, 0)) = 128) //ctrl+p then
                                                                                                                                                                  begin
                                                                                                                                                                    mnuPreferences_Click;
                                                                                                                                                                  end
                                                                                                                                                                else
                                                                                                                                                                  if (DIState.Key(MapVirtualKey(71, 0)) = 128) //ctrl+g then
                                                                                                                                                                    begin
                                                                                                                                                                      AverageVertices;
                                                                                                                                                                    end
                                                                                                                                                                  else
                                                                                                                                                                    if (DIState.Key(DIK_APOSTROPHE) = 128) //ctrl+' then
                                                                                                                                                                      begin
                                                                                                                                                                        mnuGrid_Click;
                                                                                                                                                                      end
                                                                                                                                                                    else
                                                                                                                                                                      if (DIState.Key(MapVirtualKey(84, 0)) = 128) //ctrl+t then
                                                                                                                                                                        begin
                                                                                                                                                                          AutoTexture;
                                                                                                                                                                        end;
                                                                                                                                                                      end
                                                                                                                                                                    else
                                                                                                                                                                    begin
                                                                                                                                                                      if (hotKeyPressed > -1) and not (shiftDown or ctrlDown or altDown) //hotkey then
                                                                                                                                                                        begin
                                                                                                                                                                          setCurrentTool(hotKeyPressed);
                                                                                                                                                                          frmTools.picTools_MouseDown(hotKeyPressed, 1, 0, 1, 1);
                                                                                                                                                                        end
                                                                                                                                                                      else
                                                                                                                                                                        if (wayptKeyPressed > -1) and not (shiftDown or ctrlDown or altDown) //waypoint key then
                                                                                                                                                                          begin
                                                                                                                                                                            frmWaypoints.picType_MouseUp(wayptKeyPressed, 1, 0, 0, 0);
                                                                                                                                                                          end
                                                                                                                                                                        else
                                                                                                                                                                          if (layerKeyPressed > -1) and not (shiftDown or ctrlDown or altDown) //layer key then
                                                                                                                                                                            begin
                                                                                                                                                                              frmDisplay.picLayer_MouseUp(layerKeyPressed, 1, 0, 0, 0);
                                                                                                                                                                            end
                                                                                                                                                                          else
                                                                                                                                                                            if (DIState.Key(DIK_NUMPADPLUS) = 128) //+ then
                                                                                                                                                                              begin
                                                                                                                                                                                Zoom(getZoomDir(2));
                                                                                                                                                                              end
                                                                                                                                                                            else
                                                                                                                                                                              if (DIState.Key(DIK_NUMPADMINUS) = 128) //- then
                                                                                                                                                                                begin
                                                                                                                                                                                  Zoom(getZoomDir(0.5));
                                                                                                                                                                                end
                                                                                                                                                                              else
                                                                                                                                                                                if (DIState.Key(DIK_NUMPADSTAR) = 128) //* then
                                                                                                                                                                                  begin
                                                                                                                                                                                    Zoom(1 / zoomFactor);
                                                                                                                                                                                  end
                                                                                                                                                                                else
                                                                                                                                                                                  if (DIState.Key(DIK_DELETE) = 128) //delete then
                                                                                                                                                                                    begin
                                                                                                                                                                                      deletePolys;
                                                                                                                                                                                    end
                                                                                                                                                                                  else
                                                                                                                                                                                    if (DIState.Key(DIK_TAB) = 128) //tab then
                                                                                                                                                                                      begin
                                                                                                                                                                                        TabPressed;
                                                                                                                                                                                      end
                                                                                                                                                                                    else
                                                                                                                                                                                      if (DIState.Key(DIK_ESCAPE) = 128) //esc then
                                                                                                                                                                                        begin
                                                                                                                                                                                          if (numVerts > 0) or (numCorners > 0) or (currentWaypoint > 0) then
                                                                                                                                                                                            begin
                                                                                                                                                                                              numVerts := 0;
                                                                                                                                                                                              numCorners := 0;
                                                                                                                                                                                              currentWaypoint := 0;
                                                                                                                                                                                              toolAction := false;
                                                                                                                                                                                              Render;
                                                                                                                                                                                            end
                                                                                                                                                                                          else
                                                                                                                                                                                          begin
                                                                                                                                                                                            mnuDeselect_Click;
                                                                                                                                                                                          end;
                                                                                                                                                                                        end
                                                                                                                                                                                      else
                                                                                                                                                                                        if (DIState.Key(DIK_BACKSPACE) = 128) //backspace then
                                                                                                                                                                                          begin
                                                                                                                                                                                            mnuSever_Click;
                                                                                                                                                                                          end
                                                                                                                                                                                        else
                                                                                                                                                                                          if ((DIState.Key(DIK_INSERT) = 128) and shiftDown) //shift+insert then
                                                                                                                                                                                            begin
                                                                                                                                                                                              mnuDuplicate_Click;
                                                                                                                                                                                            end
                                                                                                                                                                                          else
                                                                                                                                                                                            if (DIState.Key(DIK_HOME) = 128) //Home then
                                                                                                                                                                                              begin
                                                                                                                                                                                                mnuBringToFront_Click;
                                                                                                                                                                                              end
                                                                                                                                                                                            else
                                                                                                                                                                                              if (DIState.Key(DIK_END) = 128) //End then
                                                                                                                                                                                                begin
                                                                                                                                                                                                  mnuSendToBack_Click;
                                                                                                                                                                                                end
                                                                                                                                                                                              else
                                                                                                                                                                                                if (DIState.Key(DIK_PGUP) = 128) //Page Up then
                                                                                                                                                                                                  begin
                                                                                                                                                                                                    mnuBringForward_Click;
                                                                                                                                                                                                  end
                                                                                                                                                                                                else
                                                                                                                                                                                                  if (DIState.Key(DIK_PGDN) = 128) //Page Down then
                                                                                                                                                                                                    begin
                                                                                                                                                                                                      mnuSendBackward_Click;
                                                                                                                                                                                                    end
                                                                                                                                                                                                  else
                                                                                                                                                                                                    if (DIState.Key(DIK_F1) = 128) //F1 then
                                                                                                                                                                                                      begin
                                                                                                                                                                                                        RunHelp;
                                                                                                                                                                                                      end
                                                                                                                                                                                                    else
                                                                                                                                                                                                      if (DIState.Key(DIK_F5) = 128) //F5 then
                                                                                                                                                                                                        begin
                                                                                                                                                                                                          mnuRefreshBG_Click;
                                                                                                                                                                                                        end
                                                                                                                                                                                                      else
                                                                                                                                                                                                        if (DIState.Key(DIK_F8) = 128) //F8 then
                                                                                                                                                                                                          begin
                                                                                                                                                                                                            mnuRunSoldat_Click;
                                                                                                                                                                                                          end
                                                                                                                                                                                                        else
                                                                                                                                                                                                          if (DIState.Key(DIK_F9) = 128) //F9 then
                                                                                                                                                                                                            begin
                                                                                                                                                                                                              mnuCompileAs_Click;
                                                                                                                                                                                                            end
                                                                                                                                                                                                          else
                                                                                                                                                                                                            if ((DIState.Key(DIK_F4) = 128) and altDown) //alt+F4 then
                                                                                                                                                                                                              begin
                                                                                                                                                                                                                mnuExit_Click;
                                                                                                                                                                                                              end
                                                                                                                                                                                                            else
                                                                                                                                                                                                              if (DIState.Key(DIK_LBRACKET) = 128) //[ then
                                                                                                                                                                                                                begin
                                                                                                                                                                                                                  if (currentTool = 0) then
                                                                                                                                                                                                                    begin
                                                                                                                                                                                                                      setCurrentTool(TOOL_DEPTHMAP);
                                                                                                                                                                                                                    end
                                                                                                                                                                                                                  else
                                                                                                                                                                                                                  begin
                                                                                                                                                                                                                    setCurrentTool(currentTool - 1);
                                                                                                                                                                                                                  end;
                                                                                                                                                                                                                  frmTools.picTools_MouseDown(smallint(currentTool), 1, 0, 1, 1);
                                                                                                                                                                                                                end
                                                                                                                                                                                                              else
                                                                                                                                                                                                                if (DIState.Key(DIK_RBRACKET) = 128) //] then
                                                                                                                                                                                                                  begin
                                                                                                                                                                                                                    if (currentTool = TOOL_DEPTHMAP) then
                                                                                                                                                                                                                      begin
                                                                                                                                                                                                                        setCurrentTool(TOOL_MOVE);
                                                                                                                                                                                                                      end
                                                                                                                                                                                                                    else
                                                                                                                                                                                                                    begin
                                                                                                                                                                                                                      setCurrentTool(currentTool + 1);
                                                                                                                                                                                                                    end;
                                                                                                                                                                                                                    frmTools.picTools_MouseDown(smallint(currentTool), 1, 0, 1, 1);
                                                                                                                                                                                                                  end
                                                                                                                                                                                                                else
                                                                                                                                                                                                                  if ((DIState.Key(DIK_LEFT) = 128) or (DIState.Key(DIK_UP) = 128) or (DIState.Key(DIK_RIGHT) = 128) or (DIState.Key(DIK_DOWN) = 128)) //arrow keys then
                                                                                                                                                                                                                    begin
                                                                                                                                                                                                                      moveCoords[1].X := 0;
                                                                                                                                                                                                                      moveCoords[1].Y := 0;
                                                                                                                                                                                                                      if shiftDown then
                                                                                                                                                                                                                        begin
                                                                                                                                                                                                                          n := gridSpacing / gridDivisions * zoomFactor;
                                                                                                                                                                                                                        end
                                                                                                                                                                                                                      else
                                                                                                                                                                                                                      begin
                                                                                                                                                                                                                        n := zoomFactor;
                                                                                                                                                                                                                      end;
                                                                                                                                                                                                                      if (currentTool = TOOL_TEXTURE) and (numSelectedPolys > 0) then
                                                                                                                                                                                                                        begin
                                                                                                                                                                                                                          if selectionChanged then
                                                                                                                                                                                                                            begin
                                                                                                                                                                                                                              SaveUndo;
                                                                                                                                                                                                                              selectionChanged := false;
                                                                                                                                                                                                                            end;
                                                                                                                                                                                                                            if (DIState.Key(DIK_LEFT) = 128) //left then
                                                                                                                                                                                                                              begin
                                                                                                                                                                                                                                StretchingTexture(-n, 0);
                                                                                                                                                                                                                              end
                                                                                                                                                                                                                            else
                                                                                                                                                                                                                              if (DIState.Key(DIK_UP) = 128) //up then
                                                                                                                                                                                                                                begin
                                                                                                                                                                                                                                  StretchingTexture(0, -n);
                                                                                                                                                                                                                                end
                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                if (DIState.Key(DIK_RIGHT) = 128) //right then
                                                                                                                                                                                                                                  begin
                                                                                                                                                                                                                                    StretchingTexture(n, 0);
                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                  if (DIState.Key(DIK_DOWN) = 128) //down then
                                                                                                                                                                                                                                    begin
                                                                                                                                                                                                                                      StretchingTexture(0, n);
                                                                                                                                                                                                                                    end;
                                                                                                                                                                                                                                    SaveUndo;
                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                begin
                                                                                                                                                                                                                                  if selectionChanged then
                                                                                                                                                                                                                                    begin
                                                                                                                                                                                                                                      SaveUndo;
                                                                                                                                                                                                                                      selectionChanged := false;
                                                                                                                                                                                                                                    end;
                                                                                                                                                                                                                                    if (DIState.Key(DIK_LEFT) = 128) //left then
                                                                                                                                                                                                                                      begin
                                                                                                                                                                                                                                        Moving(-n, 0);
                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                      if (DIState.Key(DIK_UP) = 128) //up then
                                                                                                                                                                                                                                        begin
                                                                                                                                                                                                                                          Moving(0, -n);
                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                        if (DIState.Key(DIK_RIGHT) = 128) //right then
                                                                                                                                                                                                                                          begin
                                                                                                                                                                                                                                            Moving(n, 0);
                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                          if (DIState.Key(DIK_DOWN) = 128) //down then
                                                                                                                                                                                                                                            begin
                                                                                                                                                                                                                                              Moving(0, n);
                                                                                                                                                                                                                                            end;
                                                                                                                                                                                                                                            SaveUndo;
                                                                                                                                                                                                                                          end;
                                                                                                                                                                                                                                        end;
                                                                                                                                                                                                                                      end;
                                                                                                                                                                                                                                      lblCurrentTool.Caption := frmSoldatMapEditor.ImageList.ListImages(currentFunction + 1).Tag;
                                                                                                                                                                                                                                    end;
                                                                                                                                                                                                                                    Exit;
                                                                                                                                                                                                                                    ErrorHandler:
                                                                                                                                                                                                                                      if (Err.Number = DIERR_INPUTLOST) then
                                                                                                                                                                                                                                      begin
                                                                                                                                                                                                                                        acquired := false;
                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                      if (Err.Number = DIERR_NOTACQUIRED) then
                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                      begin
                                                                                                                                                                                                                                        Application.MessageBox(pchar('DirectInput error' + vbNewLine + D3DX.GetErrorString(Err.Number)), pchar(''), MB_OK) {HelpFile:None, Context:None};
                                                                                                                                                                                                                                      end;
                                                                                                                                                                                                                                    end;

procedure TfrmSoldatMapEditor.TabPressed;
var
  scenNum: Smallint;
  tempSel: Byte;
  i: Smallint;
begin
  if (numSelectedPolys = 1) and (numSelectedScenery = 0) then
    begin
      if (vertexList[selectedPolys[1]].vertex[1] + vertexList[selectedPolys[1]].vertex[2] + vertexList[selectedPolys[1]].vertex[3] = 3) then
        begin
          vertexList[selectedPolys[1]].vertex[1] := 0;
          vertexList[selectedPolys[1]].vertex[2] := 0;
          vertexList[selectedPolys[1]].vertex[3] := 0;
          if not shiftDown then
            begin
              if (selectedPolys[1] = polyCount) then
                begin
                  selectedPolys[1] := 1;
                end
              else
              begin
                selectedPolys[1] := selectedPolys[1] + 1;
              end;
            end
          else
          begin
            Beep;
            if (selectedPolys[1] = 1) then
              begin
                selectedPolys[1] := polyCount;
              end
            else
            begin
              selectedPolys[1] := selectedPolys[1] - 1;
            end;
          end;
          vertexList[selectedPolys[1]].vertex[1] := 1;
          vertexList[selectedPolys[1]].vertex[2] := 1;
          vertexList[selectedPolys[1]].vertex[3] := 1;
        end
      else
      begin
        tempSel := vertexList[selectedPolys[1]].vertex[1];
        vertexList[selectedPolys[1]].vertex[1] := vertexList[selectedPolys[1]].vertex[2];
        vertexList[selectedPolys[1]].vertex[2] := vertexList[selectedPolys[1]].vertex[3];
        vertexList[selectedPolys[1]].vertex[3] := tempSel;
      end;
      Render;
    end
  else
    if (numSelectedScenery = 1) and (numSelectedPolys = 0) then
      begin
        for i := 1 to sceneryCount do
        begin
          if (Scenery[i].selected = 1) then
            begin
              scenNum := i;
            end;
          end;
          Scenery[scenNum].selected := 0;
          if not shiftDown then
            begin
              if (scenNum = sceneryCount) then
                begin
                  Scenery[1].selected := 1;
                end
              else
              begin
                Scenery[scenNum + 1].selected := 1;
              end;
            end
          else
          begin
            if (scenNum = 1) then
              begin
                Scenery[sceneryCount].selected := 1;
              end
            else
            begin
              Scenery[scenNum - 1].selected := 1;
            end;
          end;
          Render;
        end;
        getInfo;
      end;

procedure TfrmSoldatMapEditor.findDragPoint(var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  k: Smallint;
  midCoords: D3DVECTOR2;
begin
  //check if user moused down on corner drag point of sel rect
  for i := 0 to 3 do
  begin
    j := i + 2;
    if (j > 3) then
      begin
        j := i - 2;
      end;
      if nearCoord((selRect[i].X - scrollCoords[2].X) * zoomFactor, moveCoords[1].X, 8) and nearCoord((selRect[i].Y - scrollCoords[2].Y) * zoomFactor, moveCoords[1].Y, 8) then
        begin
          if mnuFixedRCenter.Checked then
            begin
              rCenter.X := selRect[j].X;
              rCenter.Y := selRect[j].Y;
            end;
            moveCoords[1].X := (selRect[i].X - scrollCoords[2].X) * zoomFactor;
            moveCoords[1].Y := (selRect[i].Y - scrollCoords[2].Y) * zoomFactor;
            X := moveCoords[1].X;
            Y := moveCoords[1].Y;
            toolAction := true;
          end;
        end;
        if (toolAction = false) then
          begin
            for i := 0 to 3 do
            begin
              j := i + 2;
              if (j > 3) then
                begin
                  j := i - 2;
                end;
                k := i + 1;
                if (k > 3) then
                  begin
                    k := 0;
                  end;
                  midCoords.X := Midpoint(selRect[i].X, selRect[k].X);
                  midCoords.Y := Midpoint(selRect[i].Y, selRect[k].Y);
                  k := i - 1;
                  if (k < 0) then
                    begin
                      k := 3;
                    end;
                    if nearCoord((midCoords.X - scrollCoords[2].X) * zoomFactor, moveCoords[1].X, 8) and nearCoord((midCoords.Y - scrollCoords[2].Y) * zoomFactor, moveCoords[1].Y, 8) then
                      begin
                        if mnuFixedRCenter.Checked then
                          begin
                            rCenter.X := Midpoint(selRect[j].X, selRect[k].X);
                            rCenter.Y := Midpoint(selRect[j].Y, selRect[k].Y);
                          end;
                          moveCoords[1].X := (midCoords.X - scrollCoords[2].X) * zoomFactor;
                          moveCoords[1].Y := (midCoords.Y - scrollCoords[2].Y) * zoomFactor;
                          X := moveCoords[1].X;
                          Y := moveCoords[1].Y;
                          toolAction := true;
                        end;
                      end;
                      Render;
                    end;
                  end;

procedure TfrmSoldatMapEditor.findDragPoint2(var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  k: Smallint;
  midCoords: D3DVECTOR2;
begin
  toolAction := checkDragPoint(selRect[0].X, selRect[0].Y, selRect[2].X, selRect[2].Y);
  if not toolAction then
    begin
      toolAction := checkDragPoint(selRect[1].X, selRect[1].Y, selRect[3].X, selRect[3].Y);
    end;
    if not toolAction then
      begin
        toolAction := checkDragPoint(selRect[2].X, selRect[2].Y, selRect[0].X, selRect[0].Y);
      end;
      if not toolAction then
        begin
          toolAction := checkDragPoint(selRect[3].X, selRect[3].Y, selRect[1].X, selRect[1].Y);
        end;
        midCoords.X := Midpoint(selRect[0].X, selRect[1].X);
        midCoords.Y := Midpoint(selRect[0].Y, selRect[1].Y);
        if not toolAction then
          begin
            toolAction := checkDragPoint(midCoords.X, midCoords.Y, Midpoint(selRect[2].X, selRect[3].X), Midpoint(selRect[2].Y, selRect[3].Y));
          end;
          midCoords.X := Midpoint(selRect[1].X, selRect[2].X);
          midCoords.Y := Midpoint(selRect[1].Y, selRect[2].Y);
          if not toolAction then
            begin
              toolAction := checkDragPoint(midCoords.X, midCoords.Y, Midpoint(selRect[3].X, selRect[0].X), Midpoint(selRect[3].Y, selRect[0].Y));
            end;
            midCoords.X := Midpoint(selRect[2].X, selRect[3].X);
            midCoords.Y := Midpoint(selRect[2].Y, selRect[3].Y);
            if not toolAction then
              begin
                toolAction := checkDragPoint(midCoords.X, midCoords.Y, Midpoint(selRect[0].X, selRect[1].X), Midpoint(selRect[0].Y, selRect[1].Y));
              end;
              midCoords.X := Midpoint(selRect[3].X, selRect[0].X);
              midCoords.Y := Midpoint(selRect[3].Y, selRect[0].Y);
              if not toolAction then
                begin
                  toolAction := checkDragPoint(midCoords.X, midCoords.Y, Midpoint(selRect[1].X, selRect[2].X), Midpoint(selRect[1].Y, selRect[2].Y));
                end;
              end;

function TfrmSoldatMapEditor.checkDragPoint(var x1: Single; var y1: Single; var x2: Single; var y2: Single): Boolean;
begin
  if nearCoord((x1 - scrollCoords[2].X) * zoomFactor, moveCoords[1].X, 8) and nearCoord((y1 - scrollCoords[2].Y) * zoomFactor, moveCoords[1].Y, 8) then
    begin
      if mnuFixedRCenter.Checked then
        begin
          rCenter.X := x2;
          rCenter.Y := y2;
        end;
        moveCoords[1].X := (x1 - scrollCoords[2].X) * zoomFactor;
        moveCoords[1].Y := (y1 - scrollCoords[2].Y) * zoomFactor;
        result := true;
      end;
    end;

procedure TfrmSoldatMapEditor.Form_DblClick;
begin
  if (currentTool = TOOL_CREATE) //poly creation then
    begin
      toolAction := true;
    end
  else
    if (currentTool = TOOL_VSELECT) //vertex selection then
      begin
        toolAction := true;
        selectedCoords[1].X := MouseHelper.CursorX - (self.Left / Screen.TwipsPerPixelX) - 1;
        selectedCoords[1].Y := MouseHelper.CursorY - (self.Top / Screen.TwipsPerPixelY) - 1;
        selectedCoords[2].X := selectedCoords[1].X;
        selectedCoords[2].Y := selectedCoords[1].Y;
        Render;
      end;
    end;

procedure TfrmSoldatMapEditor.Form_MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  k: Smallint;
  tempClr: TColour;
  label
  ErrorHandler;
  begin
    //ON ERROR
    if (acquired = false) then
      begin
        DIDevice.Acquire;
        acquired := true;
      end;
      if (Button = 2) //popup menus then
        begin
          if (currentFunction = TOOL_CREATE) or (currentFunction = TOOL_QUAD) then
            begin
              self.PopupMenu(mnuPolyTypes);
            end
          else
            if (currentTool = TOOL_MOVE) then
              begin
                mouseCoords.X := X;
                mouseCoords.Y := Y;
                self.PopupMenu(mnuMove);
              end
            else
              if (currentTool = TOOL_PSELECT) or (currentTool = TOOL_VSELECT) then
                begin
                  self.PopupMenu(mnuVertexSelect);
                end
              else
                if (currentFunction = TOOL_SCENERY) then
                  begin
                    if (tvwScenery.Visible = false) then
                      begin
                        if (self.WindowState = vbMaximized) then
                          begin
                            tvwScenery.left := mouseCoords.X;
                            if (mouseCoords.Y + tvwScenery.Height > self.ScaleHeight - 17) then
                              begin
                                tvwScenery.Top := self.ScaleHeight - tvwScenery.Height - 17;
                              end
                            else
                            begin
                              tvwScenery.Top := mouseCoords.Y;
                            end;
                          end
                        else
                        begin
                          tvwScenery.left := 0;
                          tvwScenery.Top := 41;
                        end;
                      end;
                      tvwScenery.Visible := not tvwScenery.Visible;
                    end
                  else
                    if (currentFunction = TOOL_OBJECTS) then
                      begin
                        self.PopupMenu(mnuObjects, Unassigned, X, Y);
                        Render;
                      end
                    else
                      if (currentFunction = TOOL_WAYPOINT) then
                        begin
                          self.PopupMenu(mnuWaypoint, Unassigned, X, Y);
                        end;
                      end
                    else
                      if (Button = 4) then
                        begin
                          scrollCoords[1].X := X;
                          scrollCoords[1].Y := Y;
                          SetCursor(TOOL_HAND + 1);
                        end
                      else
                      begin
                        if tvwScenery.Visible then
                          begin
                            tvwScenery.Visible := false;
                          end;
                        end;
                        if (Button <> 1) then
                          begin
                            Exit;
                          end;
                          if spaceDown then
                            begin
                              scrollCoords[1].X := X;
                              scrollCoords[1].Y := Y;
                            end
                          else
                            if (currentFunction = TOOL_MOVE) //move then
                              begin
                                if selectionChanged then
                                  begin
                                    SaveUndo;
                                    selectionChanged := false;
                                  end;
                                  toolAction := true;
                                  MouseDownMove(X, Y);
                                end
                              else
                                if (currentFunction = TOOL_ROTATE) or (currentFunction = TOOL_SCALE) //scaling/rotation then
                                  begin
                                    if selectionChanged then
                                      begin
                                        SaveUndo;
                                        selectionChanged := false;
                                      end;
                                      moveCoords[1].X := X;
                                      moveCoords[1].Y := Y;
                                      moveCoords[2].X := X;
                                      moveCoords[2].Y := Y;
                                      findDragPoint2(X, Y);
                                    end
                                  else
                                    if ((currentFunction = TOOL_CREATE) or (currentFunction = TOOL_QUAD)) //poly creation then
                                      begin
                                        if selectionChanged then
                                          begin
                                            SaveUndo;
                                            selectionChanged := false;
                                          end;
                                          if (Shift = 0) then
                                            begin
                                              if not (showPolys or showWireframe or showPoints) then
                                                begin
                                                  showPolys := true;
                                                  frmDisplay.setLayer(1, true);
                                                end;
                                                toolAction := true;
                                              end
                                            else
                                              if (Shift = KEY_SHIFT) //constrained then
                                                begin
                                                  if not (showPolys or showWireframe or showPoints) then
                                                    begin
                                                      showPolys := true;
                                                    end;
                                                    toolAction := true;
                                                  end;
                                                end
                                              else
                                                if (currentFunction = TOOL_VSELECT) or (currentFunction = TOOL_VSELADD) or (currentFunction = TOOL_VSELSUB) //vertex selection then
                                                  begin
                                                    toolAction := true;
                                                    selectedCoords[1].X := X;
                                                    selectedCoords[1].Y := Y;
                                                    selectedCoords[2].X := X;
                                                    selectedCoords[2].Y := Y;
                                                  end
                                                else
                                                  if (currentFunction = TOOL_PSELECT) or (currentFunction = TOOL_PSELADD) or (currentFunction = TOOL_PSELSUB) //poly selection then
                                                    begin
                                                      polySelection(X, Y);
                                                    end
                                                  else
                                                    if (currentFunction = TOOL_VCOLOUR) //vertex colour then
                                                      begin
                                                        if selectionChanged then
                                                          begin
                                                            SaveUndo;
                                                            selectionChanged := false;
                                                          end;
                                                          toolAction := true;
                                                          if (colourMode > 0) then
                                                            begin
                                                              VertexColouring(X, Y);
                                                            end
                                                          else
                                                          begin
                                                            PrecisionColouring(X, Y);
                                                          end;
                                                        end
                                                      else
                                                        if (currentFunction = TOOL_PCOLOUR) //poly colour then
                                                          begin
                                                            if selectionChanged then
                                                              begin
                                                                SaveUndo;
                                                                selectionChanged := false;
                                                              end;
                                                              ColourFill(X, Y);
                                                            end
                                                          else
                                                            if (currentFunction = TOOL_TEXTURE) //texture then
                                                              begin
                                                                if selectionChanged then
                                                                  begin
                                                                    SaveUndo;
                                                                    selectionChanged := false;
                                                                  end;
                                                                  if (Shift = 0) then
                                                                    begin
                                                                      toolAction := true;
                                                                      MouseDownMove(X, Y);
                                                                    end
                                                                  else
                                                                    if (Shift = KEY_SHIFT) //constrained then
                                                                      begin
                                                                        toolAction := true;
                                                                        moveCoords[2].X := X;
                                                                        moveCoords[2].Y := Y;
                                                                        moveCoords[1].X := X;
                                                                        moveCoords[1].Y := Y;
                                                                      end;
                                                                    end
                                                                  else
                                                                    if (currentFunction = TOOL_SCENERY) then
                                                                      begin
                                                                        if selectionChanged then
                                                                          begin
                                                                            SaveUndo;
                                                                            selectionChanged := false;
                                                                          end;
                                                                          if not showScenery then
                                                                            begin
                                                                              showScenery := true;
                                                                              frmDisplay.setLayer(5, showScenery);
                                                                            end;
                                                                            toolAction := true;
                                                                          end
                                                                        else
                                                                          if (currentFunction = TOOL_CLRPICKER) //colour picker then
                                                                            begin
                                                                              if (currentTool = TOOL_DEPTHMAP) then
                                                                                begin
                                                                                  depthPicker(X, Y);
                                                                                end
                                                                              else
                                                                                if (currentTool = TOOL_SCENERY) then
                                                                                else
                                                                                begin
                                                                                  ColourPicker(X, Y);
                                                                                end;
                                                                              end
                                                                            else
                                                                              if (currentFunction = TOOL_PIXPICKER) then
                                                                                begin
                                                                                  tempClr := getRGB(GetPixel(self.hDC, X, Y));
                                                                                  if (frmPalette.Enabled = false) then
                                                                                    begin
                                                                                      frmColour.InitClr(tempClr.blue, tempClr.green, tempClr.red);
                                                                                    end
                                                                                  else
                                                                                  begin
                                                                                    polyClr.red := tempClr.blue;
                                                                                    polyClr.green := tempClr.green;
                                                                                    polyClr.blue := tempClr.red;
                                                                                    Scenery[0].Color := ARGB(Scenery[0].alpha, RGB(polyClr.blue, polyClr.green, polyClr.red));
                                                                                    frmPalette.setValues(polyClr.red, polyClr.green, polyClr.blue);
                                                                                  end;
                                                                                end
                                                                              else
                                                                                if (currentFunction = TOOL_LITPICKER) then
                                                                                  begin
                                                                                    lightPicker(X, Y);
                                                                                  end
                                                                                else
                                                                                  if (currentFunction = TOOL_OBJECTS) //objects then
                                                                                    begin
                                                                                      if selectionChanged then
                                                                                        begin
                                                                                          SaveUndo;
                                                                                          selectionChanged := false;
                                                                                        end;
                                                                                        if not showObjects and not mnuGostek.Checked then
                                                                                          begin
                                                                                            showObjects := true;
                                                                                            frmDisplay.setLayer(6, showObjects);
                                                                                          end;
                                                                                          if mnuGostek.Checked then
                                                                                            begin
                                                                                              gostek.X := X / zoomFactor + scrollCoords[2].X;
                                                                                              gostek.Y := Y / zoomFactor + scrollCoords[2].Y;
                                                                                            end
                                                                                          else
                                                                                            if not mnuCollider.Checked then
                                                                                              begin
                                                                                                spawnPoints := spawnPoints + 1;
                                                                                                setlength(Spawns, spawnPoints);
                                                                                                Spawns[spawnPoints].Team := Spawns[0].Team;
                                                                                                Spawns[spawnPoints].X := X / zoomFactor + scrollCoords[2].X;
                                                                                                Spawns[spawnPoints].Y := Y / zoomFactor + scrollCoords[2].Y;
                                                                                                if showGrid and snapToGrid then
                                                                                                  begin
                                                                                                    Spawns[spawnPoints].X := Floor((Spawns[spawnPoints].X + inc / 2) / inc) * inc;
                                                                                                    Spawns[spawnPoints].Y := Floor((Spawns[spawnPoints].Y + inc / 2) / inc) * inc;
                                                                                                  end;
                                                                                                end
                                                                                              else
                                                                                              begin
                                                                                                colliderCount := colliderCount + 1;
                                                                                                setlength(Colliders, colliderCount);
                                                                                                Colliders[colliderCount].radius := Colliders[0].radius;
                                                                                                Colliders[colliderCount].X := X / zoomFactor + scrollCoords[2].X;
                                                                                                Colliders[colliderCount].Y := Y / zoomFactor + scrollCoords[2].Y;
                                                                                                if showGrid and snapToGrid then
                                                                                                  begin
                                                                                                    Colliders[colliderCount].X := Floor((Colliders[colliderCount].X + inc / 2) / inc) * inc;
                                                                                                    Colliders[colliderCount].Y := Floor((Colliders[colliderCount].Y + inc / 2) / inc) * inc;
                                                                                                  end;
                                                                                                end;
                                                                                                Render;
                                                                                                toolAction := true;
                                                                                              end
                                                                                            else
                                                                                              if (currentFunction = TOOL_WAYPOINT) //waypoints then
                                                                                                begin
                                                                                                  if selectionChanged then
                                                                                                    begin
                                                                                                      SaveUndo;
                                                                                                      selectionChanged := false;
                                                                                                    end;
                                                                                                    if not showWaypoints then
                                                                                                      begin
                                                                                                        showWaypoints := true;
                                                                                                        frmDisplay.setLayer(7, showWaypoints);
                                                                                                      end;
                                                                                                      if (frmWaypoints.showPaths = 1) and (frmWaypoints.wayptPath = 1) or (frmWaypoints.showPaths = 2) and (frmWaypoints.wayptPath = 0) then
                                                                                                        begin
                                                                                                          frmWaypoints.picShow_MouseUp(0, 1, 0, 0, 0);
                                                                                                          mouseEvent2(frmWaypoints.picShow(0), 0, 0, BUTTON_SMALL, true, BUTTON_UP);
                                                                                                        end;
                                                                                                        mnuDeselect_Click;
                                                                                                        waypointCount := waypointCount + 1;
                                                                                                        setlength(Waypoints, waypointCount);
                                                                                                        Waypoints[waypointCount].selected := true;
                                                                                                        numSelWaypoints := numSelWaypoints + 1;
                                                                                                        Waypoints[waypointCount].X := X / zoomFactor + scrollCoords[2].X;
                                                                                                        Waypoints[waypointCount].Y := Y / zoomFactor + scrollCoords[2].Y;
                                                                                                        Waypoints[waypointCount].pathNum := frmWaypoints.wayptPath + 1;
                                                                                                        for i := 0 to 4 do
                                                                                                        begin
                                                                                                          Waypoints[waypointCount].wayType[i] := mnuWayType(i).Checked;
                                                                                                        end;
                                                                                                        if (currentWaypoint > 0) //connecting waypoints then
                                                                                                          begin
                                                                                                            conCount := conCount + 1;
                                                                                                            setlength(Connections, conCount);
                                                                                                            Connections[conCount].point1 := currentWaypoint;
                                                                                                            Connections[conCount].point2 := waypointCount;
                                                                                                            Waypoints[waypointCount].numConnections := Waypoints[waypointCount].numConnections + 1;
                                                                                                            currentWaypoint := waypointCount;
                                                                                                          end;
                                                                                                          getInfo;
                                                                                                          Render;
                                                                                                          toolAction := true;
                                                                                                        end
                                                                                                      else
                                                                                                        if (currentFunction = TOOL_CONNECT) then
                                                                                                          begin
                                                                                                            if selectionChanged then
                                                                                                              begin
                                                                                                                SaveUndo;
                                                                                                                selectionChanged := false;
                                                                                                              end;
                                                                                                              toolAction := true;
                                                                                                            end
                                                                                                          else
                                                                                                            if (currentFunction = TOOL_DEPTHMAP) then
                                                                                                              begin
                                                                                                                if selectionChanged then
                                                                                                                  begin
                                                                                                                    SaveUndo;
                                                                                                                    selectionChanged := false;
                                                                                                                  end;
                                                                                                                  EditDepthMap(X, Y);
                                                                                                                  toolAction := true;
                                                                                                                end
                                                                                                              else
                                                                                                                if (currentFunction = TOOL_LIGHTS) then
                                                                                                                  begin
                                                                                                                    CreateLight(X, Y);
                                                                                                                  end
                                                                                                                else
                                                                                                                  if (currentFunction = TOOL_SKETCH) then
                                                                                                                    begin
                                                                                                                      if (Shift = 0) //freeform then
                                                                                                                        begin
                                                                                                                          startSketch(X, Y);
                                                                                                                          toolAction := true;
                                                                                                                        end
                                                                                                                      else
                                                                                                                        if (Shift = 1) then
                                                                                                                          begin
                                                                                                                            showSketch := true;
                                                                                                                            frmDisplay.setLayer(10, showSketch);
                                                                                                                          end;
                                                                                                                        end
                                                                                                                      else
                                                                                                                        if (currentFunction = TOOL_ERASER) then
                                                                                                                          begin
                                                                                                                            if (eraseSketch(X / zoomFactor + scrollCoords[2].X, Y / zoomFactor + scrollCoords[2].Y) = 1) then
                                                                                                                              begin
                                                                                                                                Render;
                                                                                                                              end;
                                                                                                                              toolAction := true;
                                                                                                                            end
                                                                                                                          else
                                                                                                                            if (currentFunction = TOOL_SMUDGE) then
                                                                                                                              begin
                                                                                                                                moveCoords[2].X := X;
                                                                                                                                moveCoords[2].Y := Y;
                                                                                                                                moveCoords[1].X := X;
                                                                                                                                moveCoords[1].Y := Y;
                                                                                                                                toolAction := true;
                                                                                                                              end;
                                                                                                                              Exit;
                                                                                                                              ErrorHandler:
                                                                                                                                Application.MessageBox(pchar(Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
                                                                                                                            end;

procedure TfrmSoldatMapEditor.CreateLight(var X: Single; var Y: Single);
begin
  if selectionChanged then
    begin
      SaveUndo;
      selectionChanged := false;
    end;
    showLights := true;
    frmDisplay.setLayer(9, showLights);
    lightCount := lightCount + 1;
    setlength(Lights, lightCount);
    Lights[lightCount].X := X / zoomFactor + scrollCoords[2].X;
    Lights[lightCount].Y := Y / zoomFactor + scrollCoords[2].Y;
    Lights[lightCount].z := 255;
    Lights[lightCount].colour := polyClr;
    Lights[lightCount].intensity := opacity;
    Lights[lightCount].range := 0;
    if showGrid and snapToGrid then
      begin
        Lights[lightCount].X := Floor((Lights[lightCount].X + inc / 2) / inc) * inc;
        Lights[lightCount].Y := Floor((Lights[lightCount].Y + inc / 2) / inc) * inc;
      end;
      applyLights;
      SaveUndo;
      Render;
    end;

procedure TfrmSoldatMapEditor.applyLights(var toSel: Boolean{ = false});
var
  i: Smallint;
  j: Smallint;
  k: Smallint;
  lightDir: D3DVECTOR;
  polyNormal: D3DVECTOR;
  v1: D3DVECTOR;
  v2: D3DVECTOR;
  mag: Single;
  diffuseFactor: Single;
  totalDiffuse: Single;
  clr: TColour;
  rVal: Smallint;
  gVal: Smallint;
  bVal: Smallint;
begin
  if (lightCount = 0) then
    begin
      Exit;
    end;
    for i := 1 to polyCount do
    begin
      //get poly vectors
      v1.X := PolyCoords[i].vertex[1].X - PolyCoords[i].vertex[2].X;
      v1.Y := PolyCoords[i].vertex[1].Y - PolyCoords[i].vertex[2].Y;
      v1.z := Polys[i].vertex[1].z - Polys[i].vertex[2].z;
      v2.X := PolyCoords[i].vertex[1].X - PolyCoords[i].vertex[3].X;
      v2.Y := PolyCoords[i].vertex[1].Y - PolyCoords[i].vertex[3].Y;
      v2.z := Polys[i].vertex[1].z - Polys[i].vertex[3].z;
      //get poly normal
      polyNormal.X := (v1.Y * v2.z) - (v1.z * v2.Y);
      polyNormal.Y := (v1.z * v2.X) - (v1.X * v2.z);
      polyNormal.z := (v1.X * v2.Y) - (v1.Y * v2.X);
      //normalize poly normal
      mag := Sqr(sqr(polyNormal.X) + sqr(polyNormal.Y) + sqr(polyNormal.z));
      if (mag > 0) then
        begin
          polyNormal.X := polyNormal.X / mag;
          polyNormal.Y := polyNormal.Y / mag;
          polyNormal.z := polyNormal.z / mag;
        end;
        for j := 1 to 3 do
        begin
          if ((vertexList[i].vertex[j] = 1) and toSel) or (toSel = false) then
            begin
              for k := 1 to lightCount do
              begin
                //get light dir vector
                lightDir.X := Lights[k].X - PolyCoords[i].vertex[j].X;
                lightDir.Y := Lights[k].Y - PolyCoords[i].vertex[j].Y;
                lightDir.z := Lights[k].z - Polys[i].vertex[j].z;
                //normalize light dir
                mag := Sqr(sqr(lightDir.X) + sqr(lightDir.Y) + sqr(lightDir.z));
                if (mag > 0) then
                  begin
                    lightDir.X := lightDir.X / mag;
                    lightDir.Y := lightDir.Y / mag;
                    lightDir.z := lightDir.z / mag;
                  end;
                  //get angle between light dir and poly normal (dot product)
                  diffuseFactor := (polyNormal.X * lightDir.X) + (polyNormal.Y * lightDir.Y) + (polyNormal.z * lightDir.z);
                  if (diffuseFactor < 0) then
                    begin
                      diffuseFactor := 0;
                    end;
                    if (Lights[k].range = 0) //normal then
                      begin
                        mag := 1;
                      end
                    else
                    begin
                      if (mag > 0) then
                        begin
                          if (mag <= Lights[k].range) then
                            begin
                              mag := 1 - mag / Lights[k].range;
                            end
                          else
                          begin
                            mag := 0;
                          end;
                        end
                      else
                      begin
                        mag := 0;
                      end;
                    end;
                    //calculate final colour components
                    rVal := rVal + (Lights[k].colour.red * diffuseFactor) * mag;
                    gVal := gVal + (Lights[k].colour.green * diffuseFactor) * mag;
                    bVal := bVal + (Lights[k].colour.blue * diffuseFactor) * mag;
                    totalDiffuse := totalDiffuse + diffuseFactor;
                  end;
                  totalDiffuse := totalDiffuse / lightCount;
                  clr := vertexList[i].colour[j];
                  rVal := rVal + clr.red;
                  gVal := gVal + clr.green;
                  bVal := bVal + clr.blue;
                  if (rVal > 255) then
                    begin
                      rVal := 255;
                    end;
                    if (gVal > 255) then
                      begin
                        gVal := 255;
                      end;
                      if (bVal > 255) then
                        begin
                          bVal := 255;
                        end;
                        Polys[i].vertex[j].Color := ARGB(getAlpha(Polys[i].vertex[j].Color), RGB(Floor(bVal), Floor(gVal), Floor(rVal)));
                        rVal := 0;
                        gVal := 0;
                        bVal := 0;
                        totalDiffuse := 0;
                      end;
                    end;
                  end;
                  Render;
                end;

procedure TfrmSoldatMapEditor.applyLightsToVert(var pIndex: Smallint; var vIndex: Smallint);
var
  k: Smallint;
  lightDir: D3DVECTOR;
  polyNormal: D3DVECTOR;
  v1: D3DVECTOR;
  v2: D3DVECTOR;
  mag: Single;
  diffuseFactor: Single;
  totalDiffuse: Single;
  clr: TColour;
  rVal: Smallint;
  gVal: Smallint;
  bVal: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    if (lightCount <= 0) or not showLights then
      begin
        Exit;
      end;
      //get poly vectors
      v1.X := PolyCoords[pIndex].vertex[1].X - PolyCoords[pIndex].vertex[2].X;
      v1.Y := PolyCoords[pIndex].vertex[1].Y - PolyCoords[pIndex].vertex[2].Y;
      v1.z := Polys[pIndex].vertex[1].z - Polys[pIndex].vertex[2].z;
      v2.X := PolyCoords[pIndex].vertex[1].X - PolyCoords[pIndex].vertex[3].X;
      v2.Y := PolyCoords[pIndex].vertex[1].Y - PolyCoords[pIndex].vertex[3].Y;
      v2.z := Polys[pIndex].vertex[1].z - Polys[pIndex].vertex[3].z;
      //get poly normal
      polyNormal.X := (v1.Y * v2.z) - (v1.z * v2.Y);
      polyNormal.Y := (v1.z * v2.X) - (v1.X * v2.z);
      polyNormal.z := (v1.X * v2.Y) - (v1.Y * v2.X);
      //normalize poly normal
      mag := Sqr(sqr(polyNormal.X) + sqr(polyNormal.Y) + sqr(polyNormal.z));
      if (mag > 0) then
        begin
          polyNormal.X := polyNormal.X / mag;
          polyNormal.Y := polyNormal.Y / mag;
          polyNormal.z := polyNormal.z / mag;
        end;
        for k := 1 to lightCount do
        begin
          //get light dir vector
          lightDir.X := Lights[k].X - PolyCoords[pIndex].vertex[vIndex].X;
          lightDir.Y := Lights[k].Y - PolyCoords[pIndex].vertex[vIndex].Y;
          lightDir.z := Lights[k].z - Polys[pIndex].vertex[vIndex].z;
          //normalize light dir
          mag := Sqr(sqr(lightDir.X) + sqr(lightDir.Y) + sqr(lightDir.z));
          if (mag > 0) then
            begin
              lightDir.X := lightDir.X / mag;
              lightDir.Y := lightDir.Y / mag;
              lightDir.z := lightDir.z / mag;
            end;
            //get angle between light dir and poly normal (dot product)
            diffuseFactor := (polyNormal.X * lightDir.X) + (polyNormal.Y * lightDir.Y) + (polyNormal.z * lightDir.z);
            if (diffuseFactor < 0) then
              begin
                diffuseFactor := 0;
              end;
              //calculate final colour components
              rVal := rVal + (Lights[k].colour.red * diffuseFactor);
              gVal := gVal + (Lights[k].colour.green * diffuseFactor);
              bVal := bVal + (Lights[k].colour.blue * diffuseFactor);
              totalDiffuse := totalDiffuse + diffuseFactor;
            end;
            totalDiffuse := totalDiffuse / lightCount;
            clr := vertexList[pIndex].colour[vIndex];
            rVal := rVal + clr.red;
            gVal := gVal + clr.green;
            bVal := bVal + clr.blue;
            if (rVal > 255) then
              begin
                rVal := 255;
              end;
              if (gVal > 255) then
                begin
                  gVal := 255;
                end;
                if (bVal > 255) then
                  begin
                    bVal := 255;
                  end;
                  Polys[pIndex].vertex[vIndex].Color := ARGB(getAlpha(Polys[pIndex].vertex[vIndex].Color), RGB(Floor(bVal), Floor(gVal), Floor(rVal)));
                  rVal := 0;
                  gVal := 0;
                  bVal := 0;
                  totalDiffuse := 0;
                  Exit;
                  ErrorHandler:
                    Application.MessageBox(pchar(Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
                end;

procedure TfrmSoldatMapEditor.SnapSelection;
var
  i: Smallint;
  j: Smallint;
  k: Smallint;
  l: Smallint;
  PolyNum: Smallint;
begin
  for i := 1 to numSelectedPolys do
  begin
    PolyNum := selectedPolys[i];
    for j := 1 to 3 do
    begin
      if (vertexList[PolyNum].vertex[j] = 1) then
        begin
          Polys[PolyNum].vertex[j].X := GetVertSnapCoord(PolyNum, j, 1);
          Polys[PolyNum].vertex[j].Y := GetVertSnapCoord(PolyNum, j, 0);
          if snapToGrid and showGrid then
            begin
              Polys[PolyNum].vertex[j].X := snapVertexToGrid(Polys[PolyNum].vertex[j].X, (scrollCoords[2].X - Floor(scrollCoords[2].X / inc) * inc) * zoomFactor);
              Polys[PolyNum].vertex[j].Y := snapVertexToGrid(Polys[PolyNum].vertex[j].Y, (scrollCoords[2].Y - Floor(scrollCoords[2].Y / inc) * inc) * zoomFactor);
            end;
            PolyCoords[PolyNum].vertex[j].X := Polys[PolyNum].vertex[j].X / zoomFactor + scrollCoords[2].X;
            PolyCoords[PolyNum].vertex[j].Y := Polys[PolyNum].vertex[j].Y / zoomFactor + scrollCoords[2].Y;
          end;
        end;
      end;
    end;

function TfrmSoldatMapEditor.GetVertSnapCoord(var PolyNum: Smallint; var VertNum: Smallint; var GetXVal: Boolean): Smallint;
var
  i: Smallint;
  j: Smallint;
  xVal: Smallint;
  yVal: Smallint;
  nearPoly: Smallint;
  nearVert: Smallint;
  minDiff: Longint;
  thisDiff: Longint;
  prevDiff: Longint;
begin
  xVal := Polys[PolyNum].vertex[VertNum].X;
  yVal := Polys[PolyNum].vertex[VertNum].Y;
  if GetXVal then
    begin
      result := xVal;
    end
  else
  begin
    result := yVal;
  end;
  if ohSnap then
    begin
      nearPoly := -1;
      minDiff := sqr(snapRadius) + 1;
      for i := 1 to polyCount do
      begin
        for j := 1 to 3 do
        begin
          if (nearPoly = -1) then
            begin
              prevDiff := sqr(Polys[i].vertex[j].X - xVal) + sqr(Polys[i].vertex[j].Y - yVal);
              if (prevDiff < minDiff) then
                begin
                  nearPoly := i;
                  nearVert := j;
                end;
              end;
            end;
          end;
          if (not nearPoly = -1) then
            begin
              if GetXVal then
                begin
                  result := Polys[nearPoly].vertex[nearVert].X;
                end
              else
              begin
                result := Polys[nearPoly].vertex[nearVert].Y;
              end;
            end;
          end;
        end;

procedure TfrmSoldatMapEditor.AverageVerts;
var
  i: Smallint;
  j: Smallint;
  finalR: Smallint;
  finalG: Smallint;
  finalB: Smallint;
  tehClr: TColour;
begin
  for i := 1 to numSelectedPolys do
  begin
    for j := 1 to 3 do
    begin
      if (vertexList[selectedPolys[i]].vertex[j] = 1) then
        begin
          tehClr := getRGB(Polys[selectedPolys[i]].vertex[j].Color);
          finalR := finalR + tehClr.red;
          finalG := finalG + tehClr.green;
          finalB := finalB + tehClr.blue;
        end;
      end;
    end;
    finalR := finalR / numSelectedPolys;
    finalG := finalG / numSelectedPolys;
    finalB := finalB / numSelectedPolys;
    for i := 1 to numSelectedPolys do
    begin
      for j := 1 to 3 do
      begin
        if (vertexList[selectedPolys[i]].vertex[j] = 1) then
          begin
            Polys[selectedPolys[i]].vertex[j].Color := ARGB(getAlpha(Polys[selectedPolys[i]].vertex[j].Color), RGB(finalR, finalG, finalB));
          end;
        end;
      end;
    end;

procedure TfrmSoldatMapEditor.AverageVertices;
var
  i: Smallint;
  j: Smallint;
  P: Smallint;
  V: Smallint;
  finalR: Smallint;
  finalG: Smallint;
  finalB: Smallint;
  tehClr: TColour;
  vertexClr: TColour;
  numVertices: Smallint;
  xVal: Single;
  yVal: Single;
  connectedPolys: TSmallIntDynArray;
  numConnectedPolys: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    if selectionChanged then
      begin
        SaveUndo;
        selectionChanged := false;
      end;
      self.MousePointer := 11;
      if (numSelectedPolys = 0) then
        begin
          for i := 1 to polyCount do
          begin
            for j := 1 to 3 do
            begin
              if (vertexList[i].vertex[j] = 0) then
                begin
                  xVal := PolyCoords[i].vertex[j].X;
                  yVal := PolyCoords[i].vertex[j].Y;
                  finalR := 0;
                  finalG := 0;
                  finalB := 0;
                  for P := 1 to polyCount do
                  begin
                    for V := 1 to 3 do
                    begin
                      if nearCoord(xVal, PolyCoords[P].vertex[V].X, 2) and nearCoord(yVal, PolyCoords[P].vertex[V].Y, 2) then
                        begin
                          vertexList[P].vertex[V] := 1;
                          tehClr.red := vertexList[P].colour[V].red;
                          tehClr.green := vertexList[P].colour[V].green;
                          tehClr.blue := vertexList[P].colour[V].blue;
                          finalR := finalR + tehClr.red;
                          finalG := finalG + tehClr.green;
                          finalB := finalB + tehClr.blue;
                          numConnectedPolys := numConnectedPolys + 1;
                          setlength(connectedPolys, numConnectedPolys);
                          connectedPolys[numConnectedPolys] := P;
                        end;
                      end;
                    end;
                    finalR := finalR / numConnectedPolys;
                    finalG := finalG / numConnectedPolys;
                    finalB := finalB / numConnectedPolys;
                    for P := 1 to numConnectedPolys do
                    begin
                      for V := 1 to 3 do
                      begin
                        if (vertexList[connectedPolys[P]].vertex[V] = 1) then
                          begin
                            vertexList[connectedPolys[P]].vertex[V] := 2;
                            vertexList[connectedPolys[P]].colour[V].red := finalR;
                            vertexList[connectedPolys[P]].colour[V].green := finalG;
                            vertexList[connectedPolys[P]].colour[V].blue := finalB;
                            Polys[connectedPolys[P]].vertex[V].Color := ARGB(getAlpha(Polys[connectedPolys[P]].vertex[V].Color), RGB(finalB, finalG, finalR));
                          end;
                        end;
                      end;
                      numConnectedPolys := 0;
                      setlength(connectedPolys, 0);
                    end;
                  end;
                end;
                for i := 1 to polyCount do
                begin
                  vertexList[i].vertex[1] := 0;
                  vertexList[i].vertex[2] := 0;
                  vertexList[i].vertex[3] := 0;
                end;
                applyLights;
              end
            else
            begin
              for i := 1 to polyCount do
              begin
                for j := 1 to 3 do
                begin
                  if (vertexList[i].vertex[j] = 1) then
                    begin
                      xVal := PolyCoords[i].vertex[j].X;
                      yVal := PolyCoords[i].vertex[j].Y;
                      finalR := 0;
                      finalG := 0;
                      finalB := 0;
                      for P := 1 to polyCount do
                      begin
                        for V := 1 to 3 do
                        begin
                          if nearCoord(xVal, PolyCoords[P].vertex[V].X, 2) and nearCoord(yVal, PolyCoords[P].vertex[V].Y, 2) then
                            begin
                              if (vertexList[P].vertex[V] = 1) then
                                begin
                                  vertexList[P].vertex[V] := 2;
                                  tehClr.red := vertexList[P].colour[V].red;
                                  tehClr.green := vertexList[P].colour[V].green;
                                  tehClr.blue := vertexList[P].colour[V].blue;
                                  finalR := finalR + tehClr.red;
                                  finalG := finalG + tehClr.green;
                                  finalB := finalB + tehClr.blue;
                                  numConnectedPolys := numConnectedPolys + 1;
                                  setlength(connectedPolys, numConnectedPolys);
                                  connectedPolys[numConnectedPolys] := P;
                                end;
                              end;
                            end;
                          end;
                          finalR := finalR / numConnectedPolys;
                          finalG := finalG / numConnectedPolys;
                          finalB := finalB / numConnectedPolys;
                          for P := 1 to numConnectedPolys do
                          begin
                            for V := 1 to 3 do
                            begin
                              if (vertexList[connectedPolys[P]].vertex[V] = 2) then
                                begin
                                  vertexList[connectedPolys[P]].vertex[V] := 3;
                                  vertexList[connectedPolys[P]].colour[V].red := finalR;
                                  vertexList[connectedPolys[P]].colour[V].green := finalG;
                                  vertexList[connectedPolys[P]].colour[V].blue := finalB;
                                  Polys[connectedPolys[P]].vertex[V].Color := ARGB(getAlpha(Polys[connectedPolys[P]].vertex[V].Color), RGB(finalB, finalG, finalR));
                                end;
                              end;
                            end;
                            numConnectedPolys := 0;
                            setlength(connectedPolys, 0);
                          end;
                        end;
                      end;
                      for i := 1 to polyCount do
                      begin
                        for j := 1 to 3 do
                        begin
                          if (vertexList[i].vertex[j] > 1) then
                            begin
                              vertexList[i].vertex[j] := 1;
                            end;
                          end;
                        end;
                        applyLights(true);
                      end;
                      self.MousePointer := 99;
                      ctrlDown := false;
                      currentFunction := currentTool;
                      SetCursor(currentFunction + 1);
                      lblCurrentTool.Caption := frmSoldatMapEditor.ImageList.ListImages(currentFunction + 1).Tag;
                      SaveUndo;
                      Render;
                      Exit;
                      ErrorHandler:
                        Application.MessageBox(pchar('Error averaging colours' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
                    end;

procedure TfrmSoldatMapEditor.MouseDownMove(var X: Single; var Y: Single);
begin
  if (numSelectedPolys + numSelectedScenery + numSelSpawns + numSelColliders + numSelWaypoints + numSelLights = 0) then
    begin
      noneSelected := true;
      SelNearest(X, Y);
    end;
    if snapToGrid and showGrid then
      begin
        X := snapVertexToGrid(X, (scrollCoords[2].X - Floor(scrollCoords[2].X / inc) * inc) * zoomFactor);
        Y := snapVertexToGrid(Y, (scrollCoords[2].Y - Floor(scrollCoords[2].Y / inc) * inc) * zoomFactor);
      end;
      moveCoords[1].X := X;
      moveCoords[1].Y := Y;
      moveCoords[2].X := X;
      moveCoords[2].Y := Y;
    end;

procedure TfrmSoldatMapEditor.SelNearest(var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  addPoly: Smallint;
  addVert: Smallint;
  notSel: Smallint;
  currentDist: Longint;
  shortestDist: Longint;
  xVal: Single;
  yVal: Single;
begin
  xVal := X / zoomFactor + scrollCoords[2].X;
  yVal := Y / zoomFactor + scrollCoords[2].Y;
  addPoly := 0;
  shortestDist := sqr(64) + 1;
  if showPolys then
    begin
      for i := 1 to polyCount do
      begin
        for j := 1 to 3 do
        begin
          if nearCoord(X, Polys[i].vertex[j].X, 8) and nearCoord(Y, Polys[i].vertex[j].Y, 8) //move by vertex then
            begin
              if (addPoly <> i) then
                begin
                  numSelectedPolys := numSelectedPolys + 1;
                  setlength(selectedPolys, numSelectedPolys);
                  selectedPolys[numSelectedPolys] := i;
                end;
                vertexList[i].vertex[j] := 1;
                addPoly := i;
              end;
            end;
            if (pointInPoly(X, Y, i)) and (addPoly = 0) then
              begin
                for j := 1 to 3 do
                begin
                  if nearCoord(X, Polys[i].vertex[j].X, 64) and nearCoord(Y, Polys[i].vertex[j].Y, 64) //move by region then
                    begin
                      currentDist := sqr(Polys[i].vertex[j].X - X) + sqr(Polys[i].vertex[j].Y - Y);
                      if (currentDist < shortestDist) then
                        begin
                          shortestDist := currentDist;
                          addPoly := i;
                          addVert := j;
                        end;
                      end;
                    end;
                  end;
                end;
              end;
              if (numSelectedPolys = 0) and (addPoly > 0) then
                begin
                  numSelectedPolys := numSelectedPolys + 1;
                  setlength(selectedPolys, numSelectedPolys);
                  selectedPolys[numSelectedPolys] := addPoly;
                  vertexList[addPoly].vertex[addVert] := 1;
                end;
                if (numSelectedPolys = 0) and (addPoly = 0) and showScenery //select scenery then
                  begin
                    for i := 1 to sceneryCount do
                    begin
                      if PointInProp(X, Y, i) and (addPoly = 0) then
                        begin
                          Scenery[i].selected := 1;
                          numSelectedScenery := numSelectedScenery + 1;
                          addPoly := 1;
                        end;
                      end;
                    end;
                    if (addPoly = 0) and showObjects then
                      begin
                        notSel := 0;
                        shortestDist := (sqr(8) + 1);
                        for i := 1 to spawnPoints do
                        begin
                          Spawns[i].active := 0;
                          if nearCoord(xVal, Spawns[i].X, 8 / zoomFactor) and nearCoord(yVal, Spawns[i].Y, 8 / zoomFactor) then
                            begin
                              currentDist := sqr(Spawns[i].X - xVal) + sqr(Spawns[i].Y - yVal);
                              if (currentDist < shortestDist) then
                                begin
                                  shortestDist := currentDist;
                                  notSel := i;
                                end;
                              end;
                            end;
                            if (notSel > 0) then
                              begin
                                Spawns[notSel].active := 1;
                                numSelSpawns := numSelSpawns + 1;
                                addPoly := notSel;
                              end;
                            end;
                            if (addPoly = 0) and showObjects then
                              begin
                                notSel := 0;
                                shortestDist := sqr(64) + 1;
                                for i := 1 to colliderCount do
                                begin
                                  Colliders[i].active := 0;
                                  if nearCoord(xVal, Colliders[i].X, Colliders[i].radius / 2) and nearCoord(yVal, Colliders[i].Y, Colliders[i].radius / 2) then
                                    begin
                                      currentDist := sqr(Colliders[i].X - xVal) + sqr(Colliders[i].Y - yVal);
                                      if (currentDist < shortestDist) then
                                        begin
                                          shortestDist := currentDist;
                                          notSel := i;
                                        end;
                                      end;
                                    end;
                                    if (notSel > 0) then
                                      begin
                                        Colliders[notSel].active := 1;
                                        numSelColliders := numSelColliders + 1;
                                        addPoly := notSel;
                                      end;
                                    end;
                                    if (addPoly = 0) and showWaypoints then
                                      begin
                                        notSel := 0;
                                        shortestDist := (sqr(8) + 1);
                                        for i := 1 to waypointCount do
                                        begin
                                          Waypoints[i].selected := false;
                                          if nearCoord(xVal, Waypoints[i].X, 8 / zoomFactor) and nearCoord(yVal, Waypoints[i].Y, 8 / zoomFactor) then
                                            begin
                                              currentDist := sqr(Waypoints[i].X - xVal) + sqr(Waypoints[i].Y - yVal);
                                              if (currentDist < shortestDist) then
                                                begin
                                                  shortestDist := currentDist;
                                                  notSel := i;
                                                end;
                                              end;
                                            end;
                                            if (notSel > 0) then
                                              begin
                                                Waypoints[notSel].selected := true;
                                                numSelWaypoints := numSelWaypoints + 1;
                                              end;
                                            end;
                                            Render;
                                          end;

procedure TfrmSoldatMapEditor.CreatingPoly(var Shift: Smallint; var X: Single; var Y: Single);
var
  xVal: Smallint;
  yVal: Smallint;
  rtheta: D3DVECTOR2;
begin
  xVal := X;
  yVal := Y;
  if (Shift = KEY_SHIFT) then
    begin
      rtheta := ConstrainAngle(X - Polys[polyCount + 1].vertex[numVerts].X, Y - Polys[polyCount + 1].vertex[numVerts].Y);
      xVal := Polys[polyCount + 1].vertex[numVerts].X + rtheta.X * Cos(rtheta.Y);
      yVal := Polys[polyCount + 1].vertex[numVerts].Y + rtheta.X * Sin(rtheta.Y);
    end;
    if snapToGrid and showGrid then
      begin
        xVal := snapVertexToGrid(xVal, (scrollCoords[2].X - Floor(scrollCoords[2].X / inc) * inc) * zoomFactor);
        yVal := snapVertexToGrid(yVal, (scrollCoords[2].Y - Floor(scrollCoords[2].Y / inc) * inc) * zoomFactor);
      end;
      Polys[polyCount + 1].vertex[numVerts + 1].X := xVal;
      Polys[polyCount + 1].vertex[numVerts + 1].Y := yVal;
      PolyCoords[polyCount + 1].vertex[numVerts + 1].X := xVal / zoomFactor + scrollCoords[2].X;
      PolyCoords[polyCount + 1].vertex[numVerts + 1].Y := yVal / zoomFactor + scrollCoords[2].Y;
      if mnuCustomX.Checked and mnuQuad.Checked then
        begin
          if creatingQuad then
            begin
              Polys[polyCount + 1].vertex[numVerts + 1].tu := (frmTexture.x1tex * 2 + 0.5) / xTexture;
            end
          else
          begin
            if (numVerts = 1) or (numVerts = 2) then
              begin
                Polys[polyCount + 1].vertex[numVerts + 1].tu := (frmTexture.x2tex * 2 - 0.5) / xTexture;
              end
            else
            begin
              Polys[polyCount + 1].vertex[numVerts + 1].tu := (frmTexture.x1tex * 2 + 0.5) / xTexture;
            end;
          end;
        end
      else
      begin
        Polys[polyCount + 1].vertex[numVerts + 1].tu := (xVal / zoomFactor + scrollCoords[2].X) / xTexture;
      end;
      if mnuCustomY.Checked and mnuQuad.Checked then
        begin
          if creatingQuad then
            begin
              Polys[polyCount + 1].vertex[numVerts + 1].tv := (frmTexture.y2tex * 2 - 0.5) / yTexture;
            end
          else
          begin
            if (numVerts > 1) then
              begin
                Polys[polyCount + 1].vertex[numVerts + 1].tv := (frmTexture.y2tex * 2 - 0.5) / yTexture;
              end
            else
            begin
              Polys[polyCount + 1].vertex[numVerts + 1].tv := (frmTexture.y1tex * 2 + 0.5) / yTexture;
            end;
          end;
        end
      else
      begin
        Polys[polyCount + 1].vertex[numVerts + 1].tv := (yVal / zoomFactor + scrollCoords[2].Y) / yTexture;
      end;
      Polys[polyCount + 1].vertex[numVerts + 1].Color := ARGB(255 * opacity, RGB(polyClr.blue, polyClr.green, polyClr.red));
      Render;
    end;

procedure TfrmSoldatMapEditor.Form_MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
var
  tempClr: TColour;
  label
  ErrorHandler;
  begin
    //ON ERROR
    //if not in focus and not properties in focus and not text in focus
    if (Screen.ActiveForm.hWnd <> self.hWnd) and (Screen.ActiveForm.hWnd <> frmInfo.hWnd) then
      begin
        if not ((Screen.ActiveForm.hWnd = frmPalette.hWnd) and frmPalette.textControl) then
          begin
            RegainFocus;
          end;
        end;
        mouseCoords.X := X;
        mouseCoords.Y := Y;
        lblMousePosition.Caption := 'Position: ' + Round(X / zoomFactor + scrollCoords[2].X) + ', ' + Round(Y / zoomFactor + scrollCoords[2].Y);
        //draw circle
        if circleOn then
          begin
            Render;
          end;
          if (Button = 4) or (Button = 5) //scrolling then
            begin
              Scrolling(X, Y);
            end;
            if ((currentFunction = TOOL_CREATE) or (currentFunction = TOOL_QUAD)) and toolAction then
              begin
                if ((Shift = 0) or (Shift = KEY_SHIFT)) and (numVerts > 0) //poly creation then
                  begin
                    CreatingPoly(Shift, X, Y);
                  end;
                end
              else
                if (Button = 0) and (currentFunction = TOOL_SCENERY) then
                  begin
                    CreatingScenery(Shift, X, Y);
                  end
                else
                  if (Button = 0) and (currentFunction = TOOL_OBJECTS) and (Shift < 2) then
                    begin
                      Spawns[0].X := X;
                      Spawns[0].Y := Y;
                      Colliders[0].X := X;
                      Colliders[0].Y := Y;
                      Render;
                    end
                  else
                    if (Button = 0) and ((currentFunction = TOOL_WAYPOINT) or (currentFunction = TOOL_CONNECT)) and (currentWaypoint > 0) then
                      begin
                        Render;
                      end
                    else
                      if (Button = 0) and (currentFunction = TOOL_SKETCH) and toolAction then
                        begin
                          sketch[0].vertex[2].X := X / zoomFactor + scrollCoords[2].X;
                          sketch[0].vertex[2].Y := Y / zoomFactor + scrollCoords[2].Y;
                          Render;
                        end;
                        if (Button <> 1) then
                          begin
                            Exit;
                          end;
                          //----
                          if spaceDown //scrolling then
                            begin
                              if (currentFunction = TOOL_SCENERY) and (numCorners = 0) then
                                begin
                                  Scenery[0].screenTr.X := X;
                                  Scenery[0].screenTr.Y := Y;
                                end
                              else
                                if (currentFunction = TOOL_OBJECTS) then
                                  begin
                                    if not mnuCollider.Checked then
                                      begin
                                        Spawns[0].X := X;
                                        Spawns[0].Y := Y;
                                      end
                                    else
                                      if mnuCollider.Checked then
                                        begin
                                          Colliders[0].X := X;
                                          Colliders[0].Y := Y;
                                        end;
                                      end;
                                      Scrolling(X, Y);
                                      if (Button = 5) then
                                        begin
                                          moveCoords[1].X := X;
                                          moveCoords[1].Y := Y;
                                        end;
                                      end
                                    else
                                      if (currentFunction = TOOL_MOVE) and toolAction //moving -------- then
                                        begin
                                          if (Shift = KEY_SHIFT) //constrained then
                                            begin
                                              if (Abs(X - moveCoords[2].X) > Abs(Y - moveCoords[2].Y)) then
                                                begin
                                                  Y := moveCoords[2].Y;
                                                end
                                              else
                                              begin
                                                X := moveCoords[2].X;
                                              end;
                                            end;
                                            Moving(X, Y);
                                          end
                                        else
                                          if (currentFunction = TOOL_SCALE) and toolAction //scaling then
                                            begin
                                              if (Shift = KEY_CTRL) then
                                                begin
                                                  Scaling(X, Y, false);
                                                end
                                              else
                                                if (Shift = KEY_SHIFT + KEY_CTRL) //constrained scaling then
                                                  begin
                                                    Scaling(X, Y, true);
                                                  end;
                                                end
                                              else
                                                if (currentFunction = TOOL_ROTATE) and toolAction //rotating then
                                                  begin
                                                    if (Shift = KEY_ALT) then
                                                      begin
                                                        Rotating(X, Y, false);
                                                      end
                                                    else
                                                      if (Shift = KEY_SHIFT + KEY_ALT) //constrained rotating then
                                                        begin
                                                          Rotating(X, Y, true);
                                                        end;
                                                      end
                                                    else
                                                      if ((currentFunction = TOOL_CREATE) or (currentFunction = TOOL_CREATE)) and toolAction //poly creation -------- then
                                                      else
                                                        if (currentFunction = TOOL_VSELECT) or (currentFunction = TOOL_VSELADD) or (currentFunction = TOOL_VSELSUB) //vertex selection -------- then
                                                          begin
                                                            if toolAction then
                                                              begin
                                                                Render;
                                                                selectedCoords[2].X := X;
                                                                selectedCoords[2].Y := Y;
                                                              end;
                                                            end
                                                          else
                                                            if (currentFunction = TOOL_PSELECT) and toolAction //poly selection -------- then
                                                            else
                                                              if (currentFunction = TOOL_VCOLOUR) and toolAction // vertex colouring then
                                                                begin
                                                                  if (colourMode > 0) then
                                                                    begin
                                                                      VertexColouring(X, Y);
                                                                    end;
                                                                  end
                                                                else
                                                                  if (currentFunction = TOOL_PCOLOUR) //poly colouring -------- then
                                                                  else
                                                                    if (currentFunction = TOOL_TEXTURE) and toolAction //texture -------- then
                                                                      begin
                                                                        if (Shift = 0) then
                                                                          begin
                                                                            StretchingTexture(X, Y);
                                                                          end
                                                                        else
                                                                          if (Shift = KEY_SHIFT) then
                                                                            begin
                                                                              if (Abs(X - moveCoords[2].X) > Abs(Y - moveCoords[2].Y)) then
                                                                                begin
                                                                                  Y := moveCoords[2].Y;
                                                                                end
                                                                              else
                                                                              begin
                                                                                X := moveCoords[2].X;
                                                                              end;
                                                                              StretchingTexture(X, Y);
                                                                            end;
                                                                          end
                                                                        else
                                                                          if (currentFunction = TOOL_SCENERY) //scenery -------- then
                                                                          else
                                                                            if (currentFunction = TOOL_CLRPICKER) //colour picker -------- then
                                                                              begin
                                                                                if (currentTool = TOOL_DEPTHMAP) then
                                                                                  begin
                                                                                    depthPicker(X, Y);
                                                                                  end
                                                                                else
                                                                                  if (currentTool = TOOL_SCENERY) then
                                                                                  else
                                                                                  begin
                                                                                    ColourPicker(X, Y);
                                                                                  end;
                                                                                end
                                                                              else
                                                                                if (currentFunction = TOOL_PIXPICKER) //pixel picker then
                                                                                  begin
                                                                                    tempClr := getRGB(GetPixel(self.hDC, X, Y));
                                                                                    if (frmPalette.Enabled = false) then
                                                                                      begin
                                                                                        frmColour.InitClr(tempClr.blue, tempClr.green, tempClr.red);
                                                                                      end
                                                                                    else
                                                                                    begin
                                                                                      polyClr.red := tempClr.blue;
                                                                                      polyClr.green := tempClr.green;
                                                                                      polyClr.blue := tempClr.red;
                                                                                      Scenery[0].Color := ARGB(Scenery[0].alpha, RGB(polyClr.blue, polyClr.green, polyClr.red));
                                                                                      frmPalette.setValues(polyClr.red, polyClr.green, polyClr.blue);
                                                                                    end;
                                                                                    Render;
                                                                                  end
                                                                                else
                                                                                  if (currentFunction = TOOL_LITPICKER) //light picker then
                                                                                  else
                                                                                    if (currentFunction = TOOL_OBJECTS) //objects -------- then
                                                                                      begin
                                                                                        Spawns[0].X := X;
                                                                                        Spawns[0].Y := Y;
                                                                                        if mnuGostek.Checked then
                                                                                          begin
                                                                                            gostek.X := X / zoomFactor + scrollCoords[2].X;
                                                                                            gostek.Y := Y / zoomFactor + scrollCoords[2].Y;
                                                                                            Render;
                                                                                          end;
                                                                                        end
                                                                                      else
                                                                                        if (currentFunction = TOOL_WAYPOINT) and toolAction //waypoints -------- then
                                                                                        else
                                                                                          if (currentFunction = TOOL_DEPTHMAP) and toolAction //depthmap -------- then
                                                                                            begin
                                                                                              EditDepthMap(X, Y);
                                                                                            end
                                                                                          else
                                                                                            if (currentFunction = TOOL_SKETCH) and toolAction //sketch -------- then
                                                                                              begin
                                                                                                if (Shift = 0) //freeform then
                                                                                                  begin
                                                                                                    linkSketch(X, Y);
                                                                                                    sketch[sketchLines].vertex[2].X := X / zoomFactor + scrollCoords[2].X;
                                                                                                    sketch[sketchLines].vertex[2].Y := Y / zoomFactor + scrollCoords[2].Y;
                                                                                                    Render;
                                                                                                  end
                                                                                                else
                                                                                                  if (Shift = KEY_SHIFT) //lines then
                                                                                                    begin
                                                                                                      sketch[0].vertex[2].X := X / zoomFactor + scrollCoords[2].X;
                                                                                                      sketch[0].vertex[2].Y := Y / zoomFactor + scrollCoords[2].Y;
                                                                                                      Render;
                                                                                                    end;
                                                                                                  end
                                                                                                else
                                                                                                  if (currentFunction = TOOL_ERASER) and toolAction then
                                                                                                    begin
                                                                                                      if (eraseSketch(X / zoomFactor + scrollCoords[2].X, Y / zoomFactor + scrollCoords[2].Y) = 1) then
                                                                                                        begin
                                                                                                          Render;
                                                                                                        end;
                                                                                                      end
                                                                                                    else
                                                                                                      if (currentFunction = TOOL_SMUDGE) and toolAction then
                                                                                                        begin
                                                                                                          if (moveLines(X / zoomFactor + scrollCoords[2].X, Y / zoomFactor + scrollCoords[2].Y, X - moveCoords[2].X, Y - moveCoords[2].Y) = 1) then
                                                                                                            begin
                                                                                                              Render;
                                                                                                            end;
                                                                                                            moveCoords[2].X := X;
                                                                                                            moveCoords[2].Y := Y;
                                                                                                          end;
                                                                                                          Exit;
                                                                                                          ErrorHandler:
                                                                                                            Application.MessageBox(pchar('form_mousemove error' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
                                                                                                        end;

procedure TfrmSoldatMapEditor.CreatingScenery(var Shift: Smallint; var X: Single; var Y: Single);
var
  xVal: Single;
  yVal: Single;
  angle: Single;
begin
  xVal := X;
  yVal := Y;
  if snapToGrid and showGrid then
    begin
      xVal := Floor(snapVertexToGrid(X, (scrollCoords[2].X - Floor(scrollCoords[2].X / inc) * inc) * zoomFactor) + 0.5);
      yVal := Floor(snapVertexToGrid(Y, (scrollCoords[2].Y - Floor(scrollCoords[2].Y / inc) * inc) * zoomFactor) + 0.5);
    end;
    if (numCorners = 0) then
      begin
        Scenery[0].screenTr.X := xVal;
        Scenery[0].screenTr.Y := yVal;
      end;
      xVal := xVal - Floor(Scenery[0].screenTr.X + 0.5);
      yVal := yVal - Floor(Scenery[0].screenTr.Y + 0.5);
      angle := GetAngle(xVal, yVal);
      if (numCorners = 1) and toolAction then
        begin
          if (Shift = 1) then
            begin
              angle := (Floor((angle * 180 / pi + 0) / 15) * 15) / 180 * pi;
            end;
            Scenery[0].rotation := angle;
          end
        else
          if (numCorners = 2) and toolAction then
            begin
              angle := angle - Scenery[0].rotation;
              Scenery[0].Scaling.X := (Cos(angle) * Sqr(sqr(xVal) + sqr(yVal))) / (SceneryTextures[Scenery[0].Style].Width) / zoomFactor;
              Scenery[0].Scaling.Y := -(Sin(angle) * Sqr(sqr(xVal) + sqr(yVal))) / (SceneryTextures[Scenery[0].Style].Height) / zoomFactor;
              if (Shift = 1) then
                begin
                  if (Scenery[0].Scaling.X < 0) then
                    begin
                      Scenery[0].Scaling.X := -Sqr((sqr(xVal) + sqr(yVal)) / (sqr(SceneryTextures[Scenery[0].Style].Width) + sqr(SceneryTextures[Scenery[0].Style].Height))) / zoomFactor;
                    end
                  else
                  begin
                    Scenery[0].Scaling.X := Sqr((sqr(xVal) + sqr(yVal)) / (sqr(SceneryTextures[Scenery[0].Style].Width) + sqr(SceneryTextures[Scenery[0].Style].Height))) / zoomFactor;
                  end;
                  if (Scenery[0].Scaling.Y * Scenery[0].Scaling.X < 0) then
                    begin
                      Scenery[0].Scaling.Y := -Scenery[0].Scaling.X;
                    end
                  else
                  begin
                    Scenery[0].Scaling.Y := Scenery[0].Scaling.X;
                  end;
                end;
              end;
              Render;
            end;

function TfrmSoldatMapEditor.ConstrainAngle(var xDiff: Smallint; var yDiff: Smallint): D3DVECTOR2;
var
  theta: Single;
  R: Single;
begin
  R := Sqr(sqr(xDiff) + sqr(yDiff));
  if (xDiff = 0) then
    begin
      if (yDiff > 0) then
        begin
          theta := pi / 2;
        end
      else
      begin
        theta := 3 * pi / 2;
      end;
    end
  else
    if (xDiff > 0) then
      begin
        theta := Atn(yDiff / xDiff);
      end
    else
      if (xDiff < 0) then
        begin
          theta := pi + Atn(yDiff / xDiff);
        end;
        theta := (Floor((theta * 180 / pi + 7.5) / 15) * 15) / 180 * pi;
        result.X := R;
        result.Y := theta;
      end;

procedure TfrmSoldatMapEditor.Scrolling(var X: Single; var Y: Single);
var
  i: Smallint;
begin
  scrollCoords[2].X := scrollCoords[2].X - (X - scrollCoords[1].X) / zoomFactor;
  scrollCoords[2].Y := scrollCoords[2].Y - (Y - scrollCoords[1].Y) / zoomFactor;
  for i := 1 to polyCount do //move polys
  begin
    Polys[i].vertex[1].X := Polys[i].vertex[1].X + X - scrollCoords[1].X;
    Polys[i].vertex[1].Y := Polys[i].vertex[1].Y + Y - scrollCoords[1].Y;
    Polys[i].vertex[2].X := Polys[i].vertex[2].X + X - scrollCoords[1].X;
    Polys[i].vertex[2].Y := Polys[i].vertex[2].Y + Y - scrollCoords[1].Y;
    Polys[i].vertex[3].X := Polys[i].vertex[3].X + X - scrollCoords[1].X;
    Polys[i].vertex[3].Y := Polys[i].vertex[3].Y + Y - scrollCoords[1].Y;
  end;
  for i := 1 to 4 do //move background
  begin
    bgPolys[i].X := bgPolys[i].X + X - scrollCoords[1].X;
    bgPolys[i].Y := bgPolys[i].Y + Y - scrollCoords[1].Y;
  end;
  for i := 1 to sceneryCount do
  begin
    Scenery[i].screenTr.X := Scenery[i].screenTr.X + X - scrollCoords[1].X;
    Scenery[i].screenTr.Y := Scenery[i].screenTr.Y + Y - scrollCoords[1].Y;
  end;
  if (numVerts > 0) //move existing vertices of poly being created then
    begin
      for i := 1 to 3 do
      begin
        Polys[polyCount + 1].vertex[i].X := Polys[polyCount + 1].vertex[i].X + X - scrollCoords[1].X;
        Polys[polyCount + 1].vertex[i].Y := Polys[polyCount + 1].vertex[i].Y + Y - scrollCoords[1].Y;
      end;
    end;
    if (numCorners > 0) then
      begin
        Scenery[0].screenTr.X := Scenery[0].screenTr.X + X - scrollCoords[1].X;
        Scenery[0].screenTr.Y := Scenery[0].screenTr.Y + Y - scrollCoords[1].Y;
      end
    else
      if (currentFunction = TOOL_SCENERY) and (numCorners = 0) then
        begin
          Scenery[0].screenTr.X := X;
          Scenery[0].screenTr.Y := Y;
        end
      else
        if (currentFunction = TOOL_OBJECTS) then
          begin
            Spawns[0].X := X;
            Spawns[0].Y := Y;
            Colliders[0].X := X;
            Colliders[0].Y := Y;
          end;
          if ((currentFunction = TOOL_VSELECT) or (currentFunction = TOOL_VSELADD) or (currentFunction = TOOL_VSELSUB)) and toolAction then
            begin
              selectedCoords[1].X := selectedCoords[1].X + X - scrollCoords[1].X;
              selectedCoords[1].Y := selectedCoords[1].Y + Y - scrollCoords[1].Y;
              selectedCoords[2].X := X;
              selectedCoords[2].Y := Y;
            end;
            scrollCoords[1].X := X;
            scrollCoords[1].Y := Y;
            Render;
            if ((currentFunction = TOOL_VSELECT) or (currentFunction = TOOL_VSELADD) or (currentFunction = TOOL_VSELSUB)) and toolAction then
              begin
                Render;
              end;
            end;

procedure TfrmSoldatMapEditor.Moving(X: Single; Y: Single);
var
  i: Smallint;
  j: Smallint;
  PolyNum: Smallint;
  xDiff: Single;
  yDiff: Single;
  xVal: Single;
  yVal: Single;
begin
  if snapToGrid and showGrid and toolAction then
    begin
      X := snapVertexToGrid(X, (scrollCoords[2].X - Floor(scrollCoords[2].X / inc) * inc) * zoomFactor);
      Y := snapVertexToGrid(Y, (scrollCoords[2].Y - Floor(scrollCoords[2].Y / inc) * inc) * zoomFactor);
    end;
    xVal := X - moveCoords[1].X;
    yVal := Y - moveCoords[1].Y;
    for i := 1 to numSelectedPolys do
    begin
      PolyNum := selectedPolys[i];
      for j := 1 to 3 do
      begin
        if (vertexList[PolyNum].vertex[j] = 1) then
          begin
            xDiff := Polys[PolyNum].vertex[j].tu - PolyCoords[PolyNum].vertex[j].X / xTexture;
            yDiff := Polys[PolyNum].vertex[j].tv - PolyCoords[PolyNum].vertex[j].Y / yTexture;
            PolyCoords[PolyNum].vertex[j].X := PolyCoords[PolyNum].vertex[j].X + xVal / zoomFactor;
            PolyCoords[PolyNum].vertex[j].Y := PolyCoords[PolyNum].vertex[j].Y + yVal / zoomFactor;
            //switch
            Polys[PolyNum].vertex[j].X := (PolyCoords[PolyNum].vertex[j].X - scrollCoords[2].X) * zoomFactor;
            Polys[PolyNum].vertex[j].Y := (PolyCoords[PolyNum].vertex[j].Y - scrollCoords[2].Y) * zoomFactor;
            if fixedTexture then
              begin
                Polys[PolyNum].vertex[j].tu := (Polys[PolyNum].vertex[j].X / zoomFactor + scrollCoords[2].X) / xTexture + xDiff;
                Polys[PolyNum].vertex[j].tv := (Polys[PolyNum].vertex[j].Y / zoomFactor + scrollCoords[2].Y) / yTexture + yDiff;
              end;
            end;
          end;
        end;
        for i := 1 to sceneryCount do
        begin
          if (Scenery[i].selected = 1) then
            begin
              Scenery[i].Translation.X := Scenery[i].Translation.X + xVal / zoomFactor;
              Scenery[i].Translation.Y := Scenery[i].Translation.Y + yVal / zoomFactor;
              Scenery[i].screenTr.X := (Scenery[i].Translation.X - scrollCoords[2].X) * zoomFactor;
              Scenery[i].screenTr.Y := (Scenery[i].Translation.Y - scrollCoords[2].Y) * zoomFactor;
            end;
          end;
          for i := 1 to spawnPoints do
          begin
            if (Spawns[i].active = 1) then
              begin
                Spawns[i].X := Spawns[i].X + xVal / zoomFactor;
                Spawns[i].Y := Spawns[i].Y + yVal / zoomFactor;
              end;
            end;
            for i := 1 to colliderCount do
            begin
              if (Colliders[i].active = 1) then
                begin
                  Colliders[i].X := Colliders[i].X + xVal / zoomFactor;
                  Colliders[i].Y := Colliders[i].Y + yVal / zoomFactor;
                end;
              end;
              for i := 1 to lightCount do
              begin
                if (Lights[i].selected = 1) then
                  begin
                    Lights[i].X := Lights[i].X + xVal / zoomFactor;
                    Lights[i].Y := Lights[i].Y + yVal / zoomFactor;
                  end;
                end;
                for i := 1 to waypointCount do
                begin
                  if (Waypoints[i].selected = true) then
                    begin
                      Waypoints[i].X := Waypoints[i].X + xVal / zoomFactor;
                      Waypoints[i].Y := Waypoints[i].Y + yVal / zoomFactor;
                    end;
                  end;
                  rCenter.X := rCenter.X + xVal / zoomFactor;
                  rCenter.Y := rCenter.Y + yVal / zoomFactor;
                  for i := 0 to 3 do
                  begin
                    selRect[i].X := selRect[i].X + xVal / zoomFactor;
                    selRect[i].Y := selRect[i].Y + yVal / zoomFactor;
                  end;
                  moveCoords[1].X := X;
                  moveCoords[1].Y := Y;
                  getInfo;
                  prompt := true;
                  Render;
                end;

procedure TfrmSoldatMapEditor.Scaling(X: Single; Y: Single; var constrained: Boolean);
var
  i: Smallint;
  j: Smallint;
  xVal: Single;
  yVal: Single;
  xCenter: Single;
  yCenter: Single;
  PolyNum: Smallint;
  theta: Single;
begin
  xCenter := (rCenter.X - scrollCoords[2].X) * zoomFactor;
  yCenter := (rCenter.Y - scrollCoords[2].Y) * zoomFactor;
  if snapToGrid and showGrid then
    begin
      X := snapVertexToGrid(X, (scrollCoords[2].X - Floor(scrollCoords[2].X / inc) * inc) * zoomFactor);
      Y := snapVertexToGrid(Y, (scrollCoords[2].Y - Floor(scrollCoords[2].Y / inc) * inc) * zoomFactor);
    end;
    if not constrained then
      begin
        if (moveCoords[1].X = xCenter) then
          begin
            scaleDiff.X := 1;
          end
        else
        begin
          scaleDiff.X := 1 + (X - moveCoords[1].X) / (moveCoords[1].X - xCenter);
        end;
        if (moveCoords[1].Y = yCenter) then
          begin
            scaleDiff.Y := 1;
          end
        else
        begin
          scaleDiff.Y := 1 + (Y - moveCoords[1].Y) / (moveCoords[1].Y - yCenter);
        end;
      end
    else
    begin
      if ((moveCoords[1].X - xCenter) * (moveCoords[1].Y - yCenter) > 0) then
        begin
          scaleDiff.X := (((X - xCenter) + (Y - yCenter)) / ((moveCoords[1].X - xCenter) + (moveCoords[1].Y - yCenter)));
          scaleDiff.Y := scaleDiff.X;
        end
      else
      begin
        scaleDiff.X := (((X - xCenter) - (Y - yCenter)) / ((moveCoords[1].X - xCenter) - (moveCoords[1].Y - yCenter)));
        scaleDiff.Y := scaleDiff.X;
      end;
    end;
    if (numSelectedPolys > 0) then
      begin
        for i := 1 to numSelectedPolys do
        begin
          PolyNum := selectedPolys[i];
          for j := 1 to 3 do
          begin
            if (vertexList[PolyNum].vertex[j] = 1) then
              begin
                Polys[PolyNum].vertex[j].X := ((rCenter.X + (PolyCoords[PolyNum].vertex[j].X - rCenter.X) * scaleDiff.X) - scrollCoords[2].X) * zoomFactor;
                Polys[PolyNum].vertex[j].Y := ((rCenter.Y + (PolyCoords[PolyNum].vertex[j].Y - rCenter.Y) * scaleDiff.Y) - scrollCoords[2].Y) * zoomFactor;
              end;
            end;
          end;
        end;
        if (numSelectedScenery > 0) then
          begin
            for i := 1 to sceneryCount do
            begin
              if (Scenery[i].selected = 1) then
                begin
                  Scenery[i].screenTr.X := (rCenter.X + (Scenery[i].Translation.X - rCenter.X) * scaleDiff.X - scrollCoords[2].X) * zoomFactor;
                  Scenery[i].screenTr.Y := (rCenter.Y + (Scenery[i].Translation.Y - rCenter.Y) * scaleDiff.Y - scrollCoords[2].Y) * zoomFactor;
                end;
              end;
            end;
            moveCoords[2].X := X;
            moveCoords[2].Y := Y;
            frmInfo.txtScale(0).Text := Floor(scaleDiff.X * 1000) / 10;
            frmInfo.txtScale(1).Text := Floor(scaleDiff.Y * 1000) / 10;
            prompt := true;
            Render;
          end;

procedure TfrmSoldatMapEditor.ApplyTransform(var Rotating: Boolean);
var
  i: Smallint;
  j: Smallint;
  pNum: Smallint;
  temp: D3DVECTOR2;
  tempVertex: TCustomVertex;
  vertSel: Byte;
  xVal: Single;
  yVal: Single;
  angle: Single;
  theta: Single;
  R: Single;
  tempClr: TColour;
begin
  if selectionChanged then
    begin
      SaveUndo;
      selectionChanged := false;
    end;
    for i := 1 to numSelectedPolys do
    begin
      pNum := selectedPolys[i];
      for j := 1 to 3 do
      begin
        PolyCoords[pNum].vertex[j].X := Polys[pNum].vertex[j].X / zoomFactor + scrollCoords[2].X;
        PolyCoords[pNum].vertex[j].Y := Polys[pNum].vertex[j].Y / zoomFactor + scrollCoords[2].Y;
        if (scaleDiff.X * scaleDiff.Y < 0) then
          begin
            //make sure polys are cw
            if not isCW(pNum) //switch to make cw then
              begin
                temp := PolyCoords[pNum].vertex[3];
                PolyCoords[pNum].vertex[3] := PolyCoords[pNum].vertex[2];
                PolyCoords[pNum].vertex[2] := temp;
                tempVertex := Polys[pNum].vertex[3];
                Polys[pNum].vertex[3] := Polys[pNum].vertex[2];
                Polys[pNum].vertex[2] := tempVertex;
                vertSel := vertexList[pNum].vertex[3];
                vertexList[pNum].vertex[3] := vertexList[pNum].vertex[2];
                vertexList[pNum].vertex[2] := vertSel;
                tempClr := vertexList[pNum].colour[3];
                vertexList[pNum].colour[3] := vertexList[pNum].colour[2];
                vertexList[pNum].colour[2] := tempClr;
              end;
            end;
          end;
        end;
        if (numSelectedScenery > 0) then
          begin
            for i := 1 to sceneryCount do
            begin
              if (Scenery[i].selected = 1) then
                begin
                  Scenery[i].Translation.X := Scenery[i].screenTr.X / zoomFactor + scrollCoords[2].X;
                  Scenery[i].Translation.Y := Scenery[i].screenTr.Y / zoomFactor + scrollCoords[2].Y;
                  if not Rotating then
                    begin
                      xVal := SceneryTextures[Scenery[i].Style].Width * Scenery[i].Scaling.X;
                      yVal := SceneryTextures[Scenery[i].Style].Height * Scenery[i].Scaling.Y;
                      angle := GetAngle(xVal, yVal) + Scenery[i].rotation;
                      R := Sqr(sqr(xVal) + sqr(yVal));
                      xVal := Cos(angle) * R * scaleDiff.X;
                      yVal := -Sin(angle) * R * scaleDiff.Y;
                      angle := GetAngle(xVal, yVal) - Scenery[i].rotation;
                      R := Sqr(sqr(xVal) + sqr(yVal));
                      Scenery[i].Scaling.X := (Cos(angle) * R) / (SceneryTextures[Scenery[i].Style].Width);
                      Scenery[i].Scaling.Y := -(Sin(angle) * R) / (SceneryTextures[Scenery[i].Style].Height);
                    end;
                    if (scaleDiff.X * scaleDiff.Y < 0) and Rotating then
                      begin
                        Scenery[i].rotation := -(Scenery[i].rotation - rDiff);
                      end
                    else
                    begin
                      Scenery[i].rotation := (Scenery[i].rotation - rDiff);
                    end;
                  end;
                end;
              end;
              if not Rotating then
                begin
                  for i := 0 to 3 do
                  begin
                    selRect[i].X := rCenter.X + (selRect[i].X - rCenter.X) * scaleDiff.X;
                    selRect[i].Y := rCenter.Y + (selRect[i].Y - rCenter.Y) * scaleDiff.Y;
                  end;
                end
              else
              begin
                for i := 0 to 3 do
                begin
                  xVal := (selRect[i].X - rCenter.X);
                  yVal := (selRect[i].Y - rCenter.Y);
                  R := Sqr(sqr(xVal) + sqr(yVal)); //distance of point from rotation center
                  angle := GetAngle(xVal, yVal) - rDiff;
                  selRect[i].X := rCenter.X + R * Cos(angle);
                  selRect[i].Y := rCenter.Y + R * -Sin(angle);
                end;
              end;
              scaleDiff.X := 1;
              scaleDiff.Y := 1;
              rDiff := 0;
              getRCenter;
              SaveUndo;
              getInfo;
              Render;
            end;

procedure TfrmSoldatMapEditor.applyScale(var tehXvalue: Single; var tehYvalue: Single);
var
  i: Smallint;
  j: Smallint;
  PolyNum: Smallint;
  vertSel: Byte;
  temp: D3DVECTOR2;
  tempVertex: TCustomVertex;
  xVal: Single;
  yVal: Single;
  R: Single;
  angle: Single;
begin
  if selectionChanged then
    begin
      SaveUndo;
      selectionChanged := false;
    end;
    scaleDiff.X := tehXvalue;
    scaleDiff.Y := tehYvalue;
    rCenter.X := Midpoint(selRect[0].X, selRect[2].X);
    rCenter.Y := Midpoint(selRect[0].Y, selRect[2].Y);
    if (numSelectedPolys > 0) then
      begin
        for i := 1 to numSelectedPolys do
        begin
          PolyNum := selectedPolys[i];
          for j := 1 to 3 do
          begin
            if (vertexList[PolyNum].vertex[j] = 1) then
              begin
                PolyCoords[PolyNum].vertex[j].X := (rCenter.X + (PolyCoords[PolyNum].vertex[j].X - rCenter.X) * scaleDiff.X);
                PolyCoords[PolyNum].vertex[j].Y := (rCenter.Y + (PolyCoords[PolyNum].vertex[j].Y - rCenter.Y) * scaleDiff.Y);
                Polys[PolyNum].vertex[j].X := (PolyCoords[PolyNum].vertex[j].X - scrollCoords[2].X) * zoomFactor;
                Polys[PolyNum].vertex[j].Y := (PolyCoords[PolyNum].vertex[j].Y - scrollCoords[2].Y) * zoomFactor;
              end;
            end;
            //make sure polys are cw
            if not isCW(PolyNum) //switch to make cw then
              begin
                temp := PolyCoords[PolyNum].vertex[3];
                PolyCoords[PolyNum].vertex[3] := PolyCoords[PolyNum].vertex[2];
                PolyCoords[PolyNum].vertex[2] := temp;
                tempVertex := Polys[PolyNum].vertex[3];
                Polys[PolyNum].vertex[3] := Polys[PolyNum].vertex[2];
                Polys[PolyNum].vertex[2] := tempVertex;
                vertSel := vertexList[PolyNum].vertex[3];
                vertexList[PolyNum].vertex[3] := vertexList[PolyNum].vertex[2];
                vertexList[PolyNum].vertex[2] := vertSel;
              end;
            end;
          end;
          if (numSelectedScenery > 0) then
            begin
              for i := 1 to sceneryCount do
              begin
                if (Scenery[i].selected = 1) then
                  begin
                    Scenery[i].Translation.X := rCenter.X + (Scenery[i].Translation.X - rCenter.X) * scaleDiff.X;
                    Scenery[i].Translation.Y := rCenter.Y + (Scenery[i].Translation.Y - rCenter.Y) * scaleDiff.Y;
                    Scenery[i].screenTr.X := (Scenery[i].Translation.X - scrollCoords[2].X) * zoomFactor;
                    Scenery[i].screenTr.Y := (Scenery[i].Translation.Y - scrollCoords[2].Y) * zoomFactor;
                    xVal := SceneryTextures[Scenery[i].Style].Width * Scenery[i].Scaling.X;
                    yVal := SceneryTextures[Scenery[i].Style].Height * Scenery[i].Scaling.Y;
                    angle := GetAngle(xVal, yVal) + Scenery[i].rotation;
                    R := Sqr(sqr(xVal) + sqr(yVal));
                    xVal := Cos(angle) * R * scaleDiff.X;
                    yVal := -Sin(angle) * R * scaleDiff.Y;
                    angle := GetAngle(xVal, yVal) - Scenery[i].rotation;
                    R := Sqr(sqr(xVal) + sqr(yVal));
                    Scenery[i].Scaling.X := (Cos(angle) * R) / (SceneryTextures[Scenery[i].Style].Width);
                    Scenery[i].Scaling.Y := -(Sin(angle) * R) / (SceneryTextures[Scenery[i].Style].Height);
                  end;
                end;
              end;
              //MESS!
              if (numSelSpawns > 0) then
                begin
                  for i := 1 to spawnPoints do
                  begin
                    if (Spawns[i].active = 1) then
                      begin
                        Spawns[i].X := rCenter.X + (Spawns[i].X - rCenter.X) * scaleDiff.X;
                        Spawns[i].Y := rCenter.Y + (Spawns[i].Y - rCenter.Y) * scaleDiff.Y;
                      end;
                    end;
                  end;
                  if (numSelColliders > 0) then
                    begin
                      for i := 1 to colliderCount do
                      begin
                        if (Colliders[i].active = 1) then
                          begin
                            Colliders[i].X := rCenter.X + (Colliders[i].X - rCenter.X) * scaleDiff.X;
                            Colliders[i].Y := rCenter.Y + (Colliders[i].Y - rCenter.Y) * scaleDiff.Y;
                          end;
                        end;
                      end;
                      if (numSelLights > 0) then
                        begin
                          for i := 1 to lightCount do
                          begin
                            if (Lights[i].selected = 1) then
                              begin
                                Lights[i].X := rCenter.X + (Lights[i].X - rCenter.X) * scaleDiff.X;
                                Lights[i].Y := rCenter.Y + (Lights[i].Y - rCenter.Y) * scaleDiff.Y;
                              end;
                            end;
                          end;
                          if (numSelWaypoints > 0) then
                            begin
                              for i := 1 to waypointCount do
                              begin
                                if (Waypoints[i].selected = true) then
                                  begin
                                    Waypoints[i].X := rCenter.X + (Waypoints[i].X - rCenter.X) * scaleDiff.X;
                                    Waypoints[i].Y := rCenter.Y + (Waypoints[i].Y - rCenter.Y) * scaleDiff.Y;
                                  end;
                                end;
                              end;
                              scaleDiff.X := 1;
                              scaleDiff.Y := 1;
                              getRCenter;
                              getInfo;
                              SaveUndo;
                              Render;
                            end;

procedure TfrmSoldatMapEditor.applyRotate(var tehValue: Single);
var
  R: Single;
  theta: Single;
  xDiff: Single;
  yDiff: Single;
  i: Smallint;
  j: Smallint;
  PolyNum: Smallint;
begin
  if selectionChanged then
    begin
      SaveUndo;
      selectionChanged := false;
    end;
    rDiff := tehValue;
    rCenter.X := Midpoint(selRect[0].X, selRect[2].X);
    rCenter.Y := Midpoint(selRect[0].Y, selRect[2].Y);
    if (numSelectedPolys > 0) then
      begin
        for i := 1 to numSelectedPolys do
        begin
          PolyNum := selectedPolys[i];
          for j := 1 to 3 do
          begin
            if (vertexList[PolyNum].vertex[j] = 1) then
              begin
                xDiff := (PolyCoords[PolyNum].vertex[j].X - rCenter.X);
                yDiff := (PolyCoords[PolyNum].vertex[j].Y - rCenter.Y);
                theta := rDiff;
                PolyCoords[PolyNum].vertex[j].X := (Cos(theta) * xDiff - Sin(theta) * yDiff) + rCenter.X;
                PolyCoords[PolyNum].vertex[j].Y := (Sin(theta) * xDiff + Cos(theta) * yDiff) + rCenter.Y;
                Polys[PolyNum].vertex[j].X := (PolyCoords[PolyNum].vertex[j].X - scrollCoords[2].X) * zoomFactor;
                Polys[PolyNum].vertex[j].Y := (PolyCoords[PolyNum].vertex[j].Y - scrollCoords[2].Y) * zoomFactor;
              end;
            end;
          end;
        end;
        if (numSelectedScenery > 0) then
          begin
            for i := 1 to sceneryCount do
            begin
              if (Scenery[i].selected = 1) then
                begin
                  xDiff := (Scenery[i].Translation.X - rCenter.X);
                  yDiff := (Scenery[i].Translation.Y - rCenter.Y);
                  R := Sqr(sqr(xDiff) + sqr(yDiff)); //distance of point from rotation center
                  if (xDiff = 0) then
                    begin
                      if (yDiff > 0) then
                        begin
                          theta := pi / 2;
                        end
                      else
                      begin
                        theta := 3 * pi / 2;
                      end;
                    end
                  else
                    if (xDiff > 0) then
                      begin
                        theta := Atn(yDiff / xDiff);
                      end
                    else
                      if (xDiff < 0) then
                        begin
                          theta := pi + Atn(yDiff / xDiff);
                        end;
                        theta := theta + rDiff;
                        Scenery[i].Translation.X := rCenter.X + R * Cos(theta);
                        Scenery[i].Translation.Y := rCenter.Y + R * Sin(theta);
                        Scenery[i].screenTr.X := (Scenery[i].Translation.X - scrollCoords[2].X) * zoomFactor;
                        Scenery[i].screenTr.Y := (Scenery[i].Translation.Y - scrollCoords[2].Y) * zoomFactor;
                        if (scaleDiff.X * scaleDiff.Y < 0) then
                          begin
                            Scenery[i].rotation := -(Scenery[i].rotation - rDiff);
                          end
                        else
                        begin
                          Scenery[i].rotation := (Scenery[i].rotation - rDiff);
                        end;
                      end;
                    end;
                  end;
                  //MESS!
                  if (numSelSpawns > 0) then
                    begin
                      for i := 1 to spawnPoints do
                      begin
                        if (Spawns[i].active = 1) then
                          begin
                            xDiff := (Spawns[i].X - rCenter.X);
                            yDiff := (Spawns[i].Y - rCenter.Y);
                            theta := rDiff;
                            Spawns[i].X := (Cos(theta) * xDiff - Sin(theta) * yDiff) + rCenter.X;
                            Spawns[i].Y := (Sin(theta) * xDiff + Cos(theta) * yDiff) + rCenter.Y;
                          end;
                        end;
                      end;
                      if (numSelColliders > 0) then
                        begin
                          for i := 1 to colliderCount do
                          begin
                            if (Colliders[i].active = 1) then
                              begin
                                xDiff := (Colliders[i].X - rCenter.X);
                                yDiff := (Colliders[i].Y - rCenter.Y);
                                theta := rDiff;
                                Colliders[i].X := (Cos(theta) * xDiff - Sin(theta) * yDiff) + rCenter.X;
                                Colliders[i].Y := (Sin(theta) * xDiff + Cos(theta) * yDiff) + rCenter.Y;
                              end;
                            end;
                          end;
                          if (numSelLights > 0) then
                            begin
                              for i := 1 to lightCount do
                              begin
                                if (Lights[i].selected = 1) then
                                  begin
                                    xDiff := (Lights[i].X - rCenter.X);
                                    yDiff := (Lights[i].Y - rCenter.Y);
                                    theta := rDiff;
                                    Lights[i].X := (Cos(theta) * xDiff - Sin(theta) * yDiff) + rCenter.X;
                                    Lights[i].Y := (Sin(theta) * xDiff + Cos(theta) * yDiff) + rCenter.Y;
                                  end;
                                end;
                              end;
                              if (numSelWaypoints > 0) then
                                begin
                                  for i := 1 to waypointCount do
                                  begin
                                    if (Waypoints[i].selected = true) then
                                      begin
                                        xDiff := (Waypoints[i].X - rCenter.X);
                                        yDiff := (Waypoints[i].Y - rCenter.Y);
                                        theta := rDiff;
                                        Waypoints[i].X := (Cos(theta) * xDiff - Sin(theta) * yDiff) + rCenter.X;
                                        Waypoints[i].Y := (Sin(theta) * xDiff + Cos(theta) * yDiff) + rCenter.Y;
                                      end;
                                    end;
                                  end;
                                  rCenter.X := selRect[0].X;
                                  rCenter.Y := selRect[0].Y;
                                  rDiff := 0;
                                  getRCenter;
                                  getInfo;
                                  SaveUndo;
                                  Render;
                                end;

function TfrmSoldatMapEditor.GetAngle(xVal: Single; yVal: Single): Single;
begin
  if (xVal < 0) then
    begin
      result := pi - Atn(yVal / xVal);
    end
  else
    if (xVal > 0) then
      begin
        if (Atn(yVal / xVal) > 0) then
          begin
            result := 2 * pi - Atn(yVal / xVal);
          end
        else
        begin
          result := -Atn(yVal / xVal);
        end;
      end
    else
    begin
      if (yVal > 0) then
        begin
          result := 3 * pi / 2;
        end
      else
      begin
        result := pi / 2;
      end;
    end;
  end;

procedure TfrmSoldatMapEditor.Rotating(var X: Single; var Y: Single; var constrained: Boolean);
var
  i: Smallint;
  j: Smallint;
  angle: Single;
  oldAngle: Single;
  xCenter: Single;
  yCenter: Single;
  xDiff: Smallint;
  yDiff: Smallint;
  PolyNum: Smallint;
  R: Single;
  theta: Single;
begin
  if snapToGrid and showGrid then
    begin
      X := snapVertexToGrid(X, (scrollCoords[2].X - Floor(scrollCoords[2].X / inc) * inc) * zoomFactor);
      Y := snapVertexToGrid(Y, (scrollCoords[2].Y - Floor(scrollCoords[2].Y / inc) * inc) * zoomFactor);
    end;
    xCenter := (rCenter.X - scrollCoords[2].X) * zoomFactor;
    yCenter := (rCenter.Y - scrollCoords[2].Y) * zoomFactor;
    if (xCenter = moveCoords[1].X) then
      begin
        if (moveCoords[1].Y - yCenter > 0) then
          begin
            oldAngle := pi / 2;
          end
        else
        begin
          oldAngle := 3 * pi / 2;
        end;
      end
    else
      if (moveCoords[1].X - xCenter > 0) then
        begin
          oldAngle := Atn((moveCoords[1].Y - yCenter) / (moveCoords[1].X - xCenter));
        end
      else
        if (moveCoords[1].X - xCenter < 0) then
          begin
            oldAngle := pi + Atn((moveCoords[1].Y - yCenter) / (moveCoords[1].X - xCenter));
          end;
          if (xCenter = X) then
            begin
              if (Y - yCenter > 0) then
                begin
                  angle := pi / 2;
                end
              else
              begin
                angle := 3 * pi / 2;
              end;
            end
          else
            if (X - xCenter > 0) then
              begin
                angle := Atn((Y - yCenter) / (X - xCenter));
              end
            else
              if (X - xCenter < 0) then
                begin
                  angle := pi + Atn((Y - yCenter) / (X - xCenter));
                end;
                rDiff := angle - oldAngle;
                if constrained then
                  begin
                    rDiff := (Floor((rDiff * 180 / pi + 7.5) / 15) * 15) / 180 * pi;
                  end;
                  if (numSelectedPolys > 0) then
                    begin
                      for i := 1 to numSelectedPolys do
                      begin
                        PolyNum := selectedPolys[i];
                        for j := 1 to 3 do
                        begin
                          if (vertexList[PolyNum].vertex[j] = 1) then
                            begin
                              xDiff := (PolyCoords[PolyNum].vertex[j].X - rCenter.X) * zoomFactor;
                              yDiff := (PolyCoords[PolyNum].vertex[j].Y - rCenter.Y) * zoomFactor;
                              R := Sqr(sqr(xDiff) + sqr(yDiff)); //distance of point from rotation center
                              if (xDiff = 0) then
                                begin
                                  if (yDiff > 0) then
                                    begin
                                      theta := pi / 2 + rDiff;
                                    end
                                  else
                                  begin
                                    theta := 3 * pi / 2 + rDiff;
                                  end;
                                end
                              else
                                if (xDiff > 0) then
                                  begin
                                    theta := Atn(yDiff / xDiff) + rDiff;
                                  end
                                else
                                  if (xDiff < 0) then
                                    begin
                                      theta := pi + Atn(yDiff / xDiff) + rDiff;
                                    end;
                                    Polys[PolyNum].vertex[j].X := xCenter + R * Cos(theta);
                                    Polys[PolyNum].vertex[j].Y := yCenter + R * Sin(theta);
                                  end;
                                end;
                              end;
                            end;
                            if (numSelectedScenery > 0) then
                              begin
                                for i := 1 to sceneryCount do
                                begin
                                  if (Scenery[i].selected = 1) then
                                    begin
                                      xDiff := (Scenery[i].Translation.X - rCenter.X) * zoomFactor;
                                      yDiff := (Scenery[i].Translation.Y - rCenter.Y) * zoomFactor;
                                      R := Sqr(sqr(xDiff) + sqr(yDiff)); //distance of point from rotation center
                                      if (xDiff = 0) then
                                        begin
                                          if (yDiff > 0) then
                                            begin
                                              theta := pi / 2 + rDiff;
                                            end
                                          else
                                          begin
                                            theta := 3 * pi / 2 + rDiff;
                                          end;
                                        end
                                      else
                                        if (xDiff > 0) then
                                          begin
                                            theta := Atn(yDiff / xDiff) + rDiff;
                                          end
                                        else
                                          if (xDiff < 0) then
                                            begin
                                              theta := pi + Atn(yDiff / xDiff) + rDiff;
                                            end;
                                            Scenery[i].screenTr.X := xCenter + R * Cos(theta);
                                            Scenery[i].screenTr.Y := yCenter + R * Sin(theta);
                                          end;
                                        end;
                                      end;
                                      if numSelWaypoints then
                                        begin
                                          for i := 1 to waypointCount do
                                          begin
                                            if Waypoints[i].selected then
                                              begin
                                                xDiff := (Scenery[i].Translation.X - rCenter.X) * zoomFactor;
                                                yDiff := (Scenery[i].Translation.Y - rCenter.Y) * zoomFactor;
                                                R := Sqr(sqr(xDiff) + sqr(yDiff)); //distance of point from rotation center
                                                if (xDiff = 0) then
                                                  begin
                                                    if (yDiff > 0) then
                                                      begin
                                                        theta := pi / 2 + rDiff;
                                                      end
                                                    else
                                                    begin
                                                      theta := 3 * pi / 2 + rDiff;
                                                    end;
                                                  end
                                                else
                                                  if (xDiff > 0) then
                                                    begin
                                                      theta := Atn(yDiff / xDiff) + rDiff;
                                                    end
                                                  else
                                                    if (xDiff < 0) then
                                                      begin
                                                        theta := pi + Atn(yDiff / xDiff) + rDiff;
                                                      end;
                                                      Scenery[i].screenTr.X := xCenter + R * Cos(theta);
                                                      Scenery[i].screenTr.Y := yCenter + R * Sin(theta);
                                                    end;
                                                  end;
                                                end;
                                                moveCoords[2].X := X;
                                                moveCoords[2].Y := Y;
                                                frmInfo.txtRotate.Text := Floor(rDiff / pi * 180 * 100) / 100;
                                                prompt := true;
                                                Render;
                                              end;

procedure TfrmSoldatMapEditor.PrecisionColouring(var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  closestPoly: Single;
  closestVert: Single;
  currentDist: Longint;
  shortestDist: Longint;
  PolyNum: Smallint;
  destClr: TColour;
  R: Smallint;
begin
  R := clrRadius * zoomFactor;
  shortestDist := sqr(R) + 1;
  if (numSelectedPolys > 0) then
    begin
      for i := 1 to numSelectedPolys do //find closest
      begin
        PolyNum := selectedPolys[i];
        if pointInPoly(X, Y, i) then
          begin
            for j := 1 to 3 do
            begin
              if nearCoord(X, Polys[PolyNum].vertex[j].X, R) and nearCoord(Y, Polys[PolyNum].vertex[j].Y, R) then
                begin
                  currentDist := sqr(Polys[PolyNum].vertex[j].X - X) + sqr(Polys[PolyNum].vertex[j].Y - Y);
                  if (currentDist < shortestDist) then
                    begin
                      shortestDist := currentDist;
                      closestPoly := PolyNum;
                      closestVert := j;
                    end;
                  end;
                end;
              end;
            end;
            if (closestPoly > 0) and (closestVert > 0) then
              begin
                destClr := getRGB(Polys[closestPoly].vertex[closestVert].Color);
                destClr := applyBlend(destClr);
                Polys[closestPoly].vertex[closestVert].Color := ARGB(getAlpha(Polys[closestPoly].vertex[closestVert].Color), RGB(destClr.blue, destClr.green, destClr.red));
                vertexList[closestPoly].colour[closestVert].red := destClr.red;
                vertexList[closestPoly].colour[closestVert].green := destClr.green;
                vertexList[closestPoly].colour[closestVert].blue := destClr.blue;
              end;
            end
          else
          begin
            for i := 1 to polyCount do //find closest
            begin
              if pointInPoly(X, Y, i) then
                begin
                  for j := 1 to 3 do
                  begin
                    if nearCoord(X, Polys[i].vertex[j].X, R) and nearCoord(Y, Polys[i].vertex[j].Y, R) then
                      begin
                        currentDist := sqr(Polys[i].vertex[j].X - X) + sqr(Polys[i].vertex[j].Y - Y);
                        if (currentDist < shortestDist) then
                          begin
                            shortestDist := currentDist;
                            closestPoly := i;
                            closestVert := j;
                          end;
                        end;
                      end;
                    end;
                  end;
                  if (closestPoly > 0) and (closestVert > 0) then
                    begin
                      destClr := getRGB(Polys[closestPoly].vertex[closestVert].Color);
                      destClr := applyBlend(destClr);
                      Polys[closestPoly].vertex[closestVert].Color := ARGB(getAlpha(Polys[closestPoly].vertex[closestVert].Color), RGB(destClr.blue, destClr.green, destClr.red));
                      vertexList[closestPoly].colour[closestVert].red := destClr.red;
                      vertexList[closestPoly].colour[closestVert].green := destClr.green;
                      vertexList[closestPoly].colour[closestVert].blue := destClr.blue;
                    end;
                  end;
                  prompt := true;
                  Render;
                end;

procedure TfrmSoldatMapEditor.VertexColouring(var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  pNum: Smallint;
  destClr: TColour;
  R: Smallint;
  coloured: Boolean;
begin
  R := clrRadius * zoomFactor;
  if (numSelectedPolys > 0) and (showPolys or showWireframe or showPoints) then
    begin
      for i := 1 to numSelectedPolys do
      begin
        pNum := selectedPolys[i];
        for j := 1 to 3 do
        begin
          if (vertexList[pNum].vertex[j] = 1) then
            begin
              if nearCoord(X, Polys[pNum].vertex[j].X, R) and nearCoord(Y, Polys[pNum].vertex[j].Y, R) then
                begin
                  if (sqr(Polys[pNum].vertex[j].X - X) + sqr(Polys[pNum].vertex[j].Y - Y) <= sqr(R)) then
                    begin
                      destClr := getRGB(Polys[pNum].vertex[j].Color);
                      destClr := applyBlend(destClr);
                      Polys[pNum].vertex[j].Color := ARGB(getAlpha(Polys[pNum].vertex[j].Color), RGB(destClr.blue, destClr.green, destClr.red));
                      vertexList[pNum].colour[j].red := destClr.red;
                      vertexList[pNum].colour[j].green := destClr.green;
                      vertexList[pNum].colour[j].blue := destClr.blue;
                      if (lightCount > 0) then
                        begin
                          applyLightsToVert(pNum, j);
                        end;
                        if (colourMode = 1) then
                          begin
                            vertexList[pNum].vertex[j] := 3;
                          end;
                          coloured := true;
                        end;
                      end;
                    end;
                  end;
                end;
              end
            else
              if (showPolys or showWireframe or showPoints) and (numSelectedScenery = 0) then
                begin
                  for i := 1 to polyCount do
                  begin
                    for j := 1 to 3 do
                    begin
                      if (vertexList[i].vertex[j] = 0) then
                        begin
                          if nearCoord(X, Polys[i].vertex[j].X, R) and nearCoord(Y, Polys[i].vertex[j].Y, R) then
                            begin
                              if (sqr(Polys[i].vertex[j].X - X) + sqr(Polys[i].vertex[j].Y - Y) <= sqr(R)) then
                                begin
                                  destClr := getRGB(Polys[i].vertex[j].Color);
                                  destClr := applyBlend(destClr);
                                  Polys[i].vertex[j].Color := ARGB(getAlpha(Polys[i].vertex[j].Color), RGB(destClr.blue, destClr.green, destClr.red));
                                  vertexList[i].colour[j].red := destClr.red;
                                  vertexList[i].colour[j].green := destClr.green;
                                  vertexList[i].colour[j].blue := destClr.blue;
                                  if (lightCount > 0) then
                                    begin
                                      applyLightsToVert(i, j);
                                    end;
                                    if (colourMode = 1) then
                                      begin
                                        vertexList[i].vertex[j] := 2;
                                      end;
                                      coloured := true;
                                    end;
                                  end;
                                end;
                              end;
                            end;
                          end;
                          if (numSelectedScenery > 0) and showScenery then
                            begin
                              for i := 1 to sceneryCount do
                              begin
                                if (Scenery[i].selected = 1) then
                                  begin
                                    if nearCoord(X, Scenery[i].screenTr.X, R) and nearCoord(Y, Scenery[i].screenTr.Y, R) then
                                      begin
                                        if (sqr(Scenery[i].screenTr.X - X) + sqr(Scenery[i].screenTr.Y - Y) <= sqr(R)) then
                                          begin
                                            destClr := getRGB(Scenery[i].Color);
                                            destClr := applyBlend(destClr);
                                            Scenery[i].Color := ARGB(Scenery[i].alpha, RGB(destClr.blue, destClr.green, destClr.red));
                                            if (colourMode = 1) then
                                              begin
                                                Scenery[i].selected := 3;
                                              end;
                                              coloured := true;
                                            end;
                                          end;
                                        end;
                                      end;
                                    end
                                  else
                                    if showScenery and (numSelectedPolys = 0) then
                                      begin
                                        for i := 1 to sceneryCount do
                                        begin
                                          if (Scenery[i].selected = 0) then
                                            begin
                                              if nearCoord(X, Scenery[i].screenTr.X, R) and nearCoord(Y, Scenery[i].screenTr.Y, R) then
                                                begin
                                                  if (sqr(Scenery[i].screenTr.X - X) + sqr(Scenery[i].screenTr.Y - Y) <= sqr(R)) then
                                                    begin
                                                      destClr := getRGB(Scenery[i].Color);
                                                      destClr := applyBlend(destClr);
                                                      Scenery[i].Color := ARGB(Scenery[i].alpha, RGB(destClr.blue, destClr.green, destClr.red));
                                                      if (colourMode = 1) then
                                                        begin
                                                          Scenery[i].selected := 2;
                                                        end;
                                                        coloured := true;
                                                      end;
                                                    end;
                                                  end;
                                                end;
                                              end;
                                              if coloured then
                                                begin
                                                  prompt := true;
                                                  Render;
                                                end;
                                              end;

procedure TfrmSoldatMapEditor.EditDepthMap(var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  pNum: Smallint;
  destClr: TColour;
  R: Smallint;
  edited: Boolean;
begin
  R := clrRadius * zoomFactor;
  if (numSelectedPolys > 0) and (showPolys or showWireframe or showPoints) then
    begin
      for i := 1 to numSelectedPolys do
      begin
        pNum := selectedPolys[i];
        for j := 1 to 3 do
        begin
          if (vertexList[pNum].vertex[j] = 1) then
            begin
              if nearCoord(X, Polys[pNum].vertex[j].X, R) and nearCoord(Y, Polys[pNum].vertex[j].Y, R) then
                begin
                  if (sqr(Polys[pNum].vertex[j].X - X) + sqr(Polys[pNum].vertex[j].Y - Y) <= sqr(R)) then
                    begin
                      Polys[pNum].vertex[j].z := Polys[pNum].vertex[j].z * (1 - opacity) + polyClr.red * opacity;
                      if (colourMode = 1) then
                        begin
                          vertexList[pNum].vertex[j] := 3;
                        end;
                        edited := true;
                      end;
                    end;
                  end;
                end;
              end;
            end
          else
            if (showPolys or showWireframe or showPoints) and (numSelectedScenery = 0) then
              begin
                for i := 1 to polyCount do
                begin
                  for j := 1 to 3 do
                  begin
                    if (vertexList[i].vertex[j] = 0) then
                      begin
                        if nearCoord(X, Polys[i].vertex[j].X, R) and nearCoord(Y, Polys[i].vertex[j].Y, R) then
                          begin
                            if (sqr(Polys[i].vertex[j].X - X) + sqr(Polys[i].vertex[j].Y - Y) <= sqr(R)) then
                              begin
                                Polys[i].vertex[j].z := Polys[i].vertex[j].z * (1 - opacity) + polyClr.red * opacity;
                                if (colourMode = 1) then
                                  begin
                                    vertexList[i].vertex[j] := 2;
                                  end;
                                  edited := true;
                                end;
                              end;
                            end;
                          end;
                        end;
                      end;
                      if edited then
                        begin
                          prompt := true;
                          Render;
                        end;
                      end;

procedure TfrmSoldatMapEditor.ColourPicker(var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  shortestDist: Smallint;
  currentDist: Smallint;
  pNum: Smallint;
  vNum: Smallint;
  tempClr: TColour;
begin
  if showPolys or showWireframe or showPoints then
    begin
      shortestDist := sqr(32) + 1;
      for i := 1 to polyCount do
      begin
        if pointInPoly(X, Y, i) then
          begin
            for j := 1 to 3 do
            begin
              if nearCoord(X, Polys[i].vertex[j].X, 32) and nearCoord(Y, Polys[i].vertex[j].Y, 32) then
                begin
                  currentDist := sqr(Polys[i].vertex[j].X - X) + sqr(Polys[i].vertex[j].Y - Y);
                  if (currentDist < shortestDist) then
                    begin
                      shortestDist := currentDist;
                      pNum := i;
                      vNum := j;
                    end;
                  end;
                end;
              end;
            end;
          end;
          if (vNum > 0) //poly colour absorbed then
            begin
              tempClr := vertexList[pNum].colour[vNum];
              if (tempClr.red = polyClr.red) and (tempClr.green = polyClr.green) and (tempClr.blue = polyClr.blue) then
              else
                if (frmPalette.Enabled = false) //non modal then
                  begin
                    frmColour.InitClr(tempClr.red, tempClr.green, tempClr.blue);
                  end
                else
                begin
                  polyClr := tempClr;
                  Scenery[0].Color := ARGB(Scenery[0].alpha, Polys[pNum].vertex[vNum].Color);
                  frmPalette.setValues(polyClr.red, polyClr.green, polyClr.blue);
                  frmPalette.checkPalette(polyClr.red, polyClr.green, polyClr.blue);
                end;
              end
            else
              if showScenery //no poly clrs absorbed, do scenery then
                begin
                  for i := 1 to sceneryCount do
                  begin
                    if PointInProp(X, Y, i) and (vNum = 0) then
                      begin
                        vNum := i;
                      end;
                    end;
                    if (vNum > 0) then
                      begin
                        tempClr := getRGB(Scenery[vNum].Color);
                        if (tempClr.red = polyClr.red) and (tempClr.green = polyClr.green) and (tempClr.blue = polyClr.blue) then
                        else
                          if (frmPalette.Enabled = false) //non modal then
                            begin
                              frmColour.InitClr(tempClr.red, tempClr.green, tempClr.blue);
                            end
                          else
                          begin
                            polyClr := tempClr;
                            Scenery[0].Color := ARGB(Scenery[0].alpha, Scenery[vNum].Color);
                            frmPalette.setValues(polyClr.red, polyClr.green, polyClr.blue);
                            frmPalette.checkPalette(polyClr.red, polyClr.green, polyClr.blue);
                          end;
                        end;
                      end;
                    end;

procedure TfrmSoldatMapEditor.depthPicker(var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  shortestDist: Smallint;
  currentDist: Smallint;
  pNum: Smallint;
  vNum: Smallint;
begin
  if showPolys or showWireframe or showPoints then
    begin
      shortestDist := sqr(32) + 1;
      for i := 1 to polyCount do
      begin
        if pointInPoly(X, Y, i) then
          begin
            for j := 1 to 3 do
            begin
              if nearCoord(X, Polys[i].vertex[j].X, 32) and nearCoord(Y, Polys[i].vertex[j].Y, 32) then
                begin
                  currentDist := sqr(Polys[i].vertex[j].X - X) + sqr(Polys[i].vertex[j].Y - Y);
                  if (currentDist < shortestDist) then
                    begin
                      shortestDist := currentDist;
                      pNum := i;
                      vNum := j;
                    end;
                  end;
                end;
              end;
            end;
          end;
          if (vNum > 0) //poly colour absorbed then
            begin
              if (Polys[pNum].vertex[vNum].z >= 0) and (Polys[pNum].vertex[vNum].z <= 255) then
                begin
                  polyClr.red := Polys[pNum].vertex[vNum].z;
                end
              else
                if (Polys[pNum].vertex[vNum].z < 0) then
                  begin
                    polyClr.red := 0;
                  end
                else
                  if (Polys[pNum].vertex[vNum].z > 255) then
                    begin
                      polyClr.red := 255;
                    end;
                    polyClr.green := polyClr.red;
                    polyClr.blue := polyClr.red;
                    Scenery[0].Color := ARGB(Scenery[0].alpha, Polys[pNum].vertex[vNum].Color);
                    frmPalette.setValues(polyClr.red, polyClr.green, polyClr.blue);
                    frmPalette.checkPalette(polyClr.red, polyClr.green, polyClr.blue);
                  end;
                end;

procedure TfrmSoldatMapEditor.lightPicker(var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  shortestDist: Smallint;
  currentDist: Smallint;
  pNum: Smallint;
  vNum: Smallint;
  tempClr: TColour;
begin
  if showPolys or showWireframe or showPoints then
    begin
      shortestDist := sqr(32) + 1;
      for i := 1 to polyCount do
      begin
        if pointInPoly(X, Y, i) then
          begin
            for j := 1 to 3 do
            begin
              if nearCoord(X, Polys[i].vertex[j].X, 32) and nearCoord(Y, Polys[i].vertex[j].Y, 32) then
                begin
                  currentDist := sqr(Polys[i].vertex[j].X - X) + sqr(Polys[i].vertex[j].Y - Y);
                  if (currentDist < shortestDist) then
                    begin
                      shortestDist := currentDist;
                      pNum := i;
                      vNum := j;
                    end;
                  end;
                end;
              end;
            end;
          end;
          if (vNum > 0) //poly colour absorbed then
            begin
              tempClr := getRGB(Polys[pNum].vertex[vNum].Color);
              if (tempClr.red = polyClr.red) and (tempClr.green = polyClr.green) and (tempClr.blue = polyClr.blue) then
              else
                if (frmPalette.Enabled = false) //non modal then
                  begin
                    frmColour.InitClr(tempClr.red, tempClr.green, tempClr.blue);
                  end
                else
                begin
                  polyClr := tempClr;
                  Scenery[0].Color := ARGB(Scenery[0].alpha, Polys[pNum].vertex[vNum].Color);
                  frmPalette.setValues(polyClr.red, polyClr.green, polyClr.blue);
                  frmPalette.checkPalette(polyClr.red, polyClr.green, polyClr.blue);
                end;
              end;
            end;

procedure TfrmSoldatMapEditor.StretchingTexture(var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  PolyNum: Smallint;
begin
  if (numSelectedPolys > 0) then
    begin
      for i := 1 to numSelectedPolys do
      begin
        PolyNum := selectedPolys[i];
        for j := 1 to 3 do
        begin
          if (vertexList[PolyNum].vertex[j] = 1) then
            begin
              Polys[PolyNum].vertex[j].tu := (Polys[PolyNum].vertex[j].tu - (X - moveCoords[1].X) / zoomFactor / xTexture);
              Polys[PolyNum].vertex[j].tv := (Polys[PolyNum].vertex[j].tv - (Y - moveCoords[1].Y) / zoomFactor / yTexture);
            end;
          end;
        end;
        moveCoords[1].X := X;
        moveCoords[1].Y := Y;
        prompt := true;
      end;
      getInfo;
      Render;
    end;

procedure TfrmSoldatMapEditor.Form_MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
begin
  if (Button = 4) then
    begin
      SetCursor(currentFunction + 1);
    end;
    if (Button <> 1) then
      begin
        Exit;
      end;
      if spaceDown then
        begin
          Render;
        end
      else
        if (currentFunction = TOOL_MOVE) and toolAction //snap selected vertex then
          begin
            if (Shift = KEY_SHIFT) //constrained, don't snap then
            else
            begin
              snapSelected(X, Y);
              if noneSelected then
                begin
                  mnuDeselect_Click;
                  noneSelected := false;
                end;
              end;
              if (lightCount > 0) and showLights then
                begin
                  if (numSelLights > 0) then
                    begin
                      applyLights;
                      Render;
                    end
                  else
                    if (numSelectedPolys > 0) then
                      begin
                        applyLights(true);
                        Render;
                      end;
                    end;
                    SaveUndo;
                  end
                else
                  if (currentFunction = TOOL_SCALE) and toolAction //apply scaling then
                    begin
                      if (Shift = KEY_CTRL) then
                        begin
                          ApplyTransform(false);
                        end
                      else
                        if (Shift = KEY_SHIFT + KEY_CTRL) //constrained scaling then
                          begin
                            ApplyTransform(false);
                          end;
                        end
                      else
                        if (currentFunction = TOOL_ROTATE) and toolAction //apply rotation then
                          begin
                            if (Shift = KEY_ALT) then
                              begin
                                ApplyTransform(true);
                              end
                            else
                              if (Shift = KEY_SHIFT + KEY_ALT) //constrained rotation then
                                begin
                                  ApplyTransform(true);
                                end;
                              end
                            else
                              if ((currentFunction = TOOL_CREATE) or (currentFunction = TOOL_QUAD)) and toolAction //create polys then
                                begin
                                  if (Shift = KEY_SHIFT) and (numVerts > 0) then
                                    begin
                                      X := Polys[polyCount + 1].vertex[numVerts + 1].X;
                                      Y := Polys[polyCount + 1].vertex[numVerts + 1].Y;
                                    end;
                                    CreatePolys(X, Y);
                                  end
                                else
                                  if (currentFunction = TOOL_SCENERY) and toolAction //create scenery then
                                    begin
                                      CreateScenery(X, Y);
                                    end
                                  else
                                    if (currentFunction = TOOL_VSELECT) or (currentFunction = TOOL_VSELADD) or (currentFunction = TOOL_VSELSUB) //select vertices then
                                      begin
                                        if toolAction then
                                          begin
                                            selectedCoords[2].X := X;
                                            selectedCoords[2].Y := Y;
                                            eraseLines := false;
                                            noRedraw := true;
                                            if (selectedCoords[2].X = selectedCoords[1].X) and (selectedCoords[2].Y = selectedCoords[1].Y) then
                                              begin
                                                regionSelection(X, Y);
                                              end
                                            else
                                            begin
                                              VertexSelection(X, Y);
                                            end;
                                            noRedraw := false;
                                            selectedCoords[1].X := X;
                                            selectedCoords[1].Y := Y;
                                            Render;
                                            if (numSelectedPolys = 0) and (numSelectedScenery = 0) and (numSelLights = 0) and (numSelSpawns = 0) and (numSelWaypoints = 0) and (numSelColliders = 1) then
                                              begin
                                                for i := 1 to colliderCount do
                                                begin
                                                  if (Colliders[i].active = 1) then
                                                    begin
                                                      frmPalette.txtRadius.Text := TrimLeft(Str(Colliders[i].radius));
                                                      setRadius(VarAsType(Colliders[i].radius, varSmallint));
                                                    end;
                                                  end;
                                                end;
                                              end;
                                            end
                                          else
                                            if (currentFunction = TOOL_PSELECT) and toolAction //poly selection then
                                            else
                                              if (currentFunction = TOOL_VCOLOUR) and toolAction //vertex colouring then
                                                begin
                                                  toolAction := false;
                                                  if (colourMode = 1) then
                                                    begin
                                                      for i := 1 to polyCount do
                                                      begin
                                                        for j := 1 to 3 do
                                                        begin
                                                          if (vertexList[i].vertex[j] > 1) then
                                                            begin
                                                              vertexList[i].vertex[j] := vertexList[i].vertex[j] - 2;
                                                            end;
                                                          end;
                                                        end;
                                                        for i := 1 to sceneryCount do
                                                        begin
                                                          if (Scenery[i].selected > 1) then
                                                            begin
                                                              Scenery[i].selected := Scenery[i].selected - 2;
                                                            end;
                                                          end;
                                                        end;
                                                        SaveUndo;
                                                      end
                                                    else
                                                      if (currentFunction = TOOL_PCOLOUR) and toolAction //poly colour then
                                                      else
                                                        if (currentFunction = TOOL_TEXTURE) and toolAction //texture then
                                                          begin
                                                            SaveUndo;
                                                          end
                                                        else
                                                          if (currentFunction = TOOL_OBJECTS) and toolAction //objects then
                                                            begin
                                                              SaveUndo;
                                                            end
                                                          else
                                                            if (currentFunction = TOOL_WAYPOINT) and toolAction //waypoints then
                                                              begin
                                                                SaveUndo;
                                                              end
                                                            else
                                                              if (currentFunction = TOOL_CONNECT) and toolAction then
                                                                begin
                                                                  CreateConnection(X, Y);
                                                                end
                                                              else
                                                                if (currentFunction = TOOL_SKETCH) then
                                                                  begin
                                                                    if (Shift = 0) and toolAction //freeform then
                                                                      begin
                                                                        endSketch(X, Y);
                                                                        toolAction := false;
                                                                      end
                                                                    else
                                                                      if (Shift = 1) //lines then
                                                                        begin
                                                                          if toolAction then
                                                                            begin
                                                                              lineSketch(X, Y);
                                                                            end
                                                                          else
                                                                          begin
                                                                            toolAction := true;
                                                                          end;
                                                                          sketch[0].vertex[1].X := X / zoomFactor + scrollCoords[2].X;
                                                                          sketch[0].vertex[1].Y := Y / zoomFactor + scrollCoords[2].Y;
                                                                          sketch[0].vertex[2].X := X / zoomFactor + scrollCoords[2].X;
                                                                          sketch[0].vertex[2].Y := Y / zoomFactor + scrollCoords[2].Y;
                                                                        end;
                                                                        deleteSmallLines;
                                                                      end
                                                                    else
                                                                      if (currentFunction = TOOL_ERASER) then
                                                                        begin
                                                                          toolAction := false;
                                                                        end
                                                                      else
                                                                        if (currentFunction = TOOL_DEPTHMAP) then
                                                                          begin
                                                                            toolAction := false;
                                                                            if (colourMode = 1) then
                                                                              begin
                                                                                for i := 1 to polyCount do
                                                                                begin
                                                                                  for j := 1 to 3 do
                                                                                  begin
                                                                                    if (vertexList[i].vertex[j] > 1) then
                                                                                      begin
                                                                                        vertexList[i].vertex[j] := vertexList[i].vertex[j] - 2;
                                                                                      end;
                                                                                    end;
                                                                                  end;
                                                                                end;
                                                                                SaveUndo;
                                                                              end;
                                                                              if (currentFunction <> TOOL_CREATE) and (currentFunction <> TOOL_QUAD) and (currentFunction <> TOOL_SKETCH) and (currentFunction <> TOOL_SCENERY) then
                                                                                begin
                                                                                  if (numVerts = 0) then
                                                                                    begin
                                                                                      toolAction := false;
                                                                                    end;
                                                                                  end;
                                                                                  if noneSelected then
                                                                                    begin
                                                                                      mnuDeselect_Click;
                                                                                      noneSelected := false;
                                                                                    end;
                                                                                    if (numSelWaypoints = 0) and (frmWaypoints.Visible = true) then
                                                                                      begin
                                                                                        frmWaypoints.ClearWaypt;
                                                                                      end;
                                                                                      selectedCoords[1].X := 0;
                                                                                      selectedCoords[1].Y := 0;
                                                                                      selectedCoords[2].X := 0;
                                                                                      selectedCoords[2].Y := 0;
                                                                                    end;

procedure TfrmSoldatMapEditor.CreateConnection(var X: Single; var Y: Single);
var
  i: Smallint;
  notSel: Smallint;
  currentDist: Longint;
  shortestDist: Longint;
  xVal: Single;
  yVal: Single;
begin
  xVal := X / zoomFactor + scrollCoords[2].X;
  yVal := Y / zoomFactor + scrollCoords[2].Y;
  notSel := 0;
  shortestDist := (sqr(8) + 1);
  for i := 1 to waypointCount do
  begin
    if ((Waypoints[i].pathNum = 1) and (frmWaypoints.showPaths <> 2)) or ((Waypoints[i].pathNum = 2) and (frmWaypoints.showPaths <> 1)) then
      begin
        if nearCoord(xVal, Waypoints[i].X, 8 / zoomFactor) and nearCoord(yVal, Waypoints[i].Y, 8 / zoomFactor) then
          begin
            currentDist := sqr(Waypoints[i].X - xVal) + sqr(Waypoints[i].Y - yVal);
            if (currentDist < shortestDist) then
              begin
                shortestDist := currentDist;
                notSel := i;
              end;
            end;
          end;
        end;
        if (notSel > 0) and (currentWaypoint <> notSel) then
          begin
            if (currentWaypoint > 0) //connecting waypoints then
              begin
                if selectionChanged then
                  begin
                    SaveUndo;
                    selectionChanged := false;
                  end;
                  conCount := conCount + 1;
                  setlength(Connections, conCount);
                  Connections[conCount].point1 := currentWaypoint;
                  Connections[conCount].point2 := notSel;
                  Waypoints[currentWaypoint].numConnections := Waypoints[currentWaypoint].numConnections + 1;
                  SaveUndo;
                end;
                currentWaypoint := notSel;
              end
            else
              if (notSel > 0) then
                begin
                  currentWaypoint := notSel;
                end
              else
              begin
                currentWaypoint := 0;
                for i := 1 to waypointCount do
                begin
                  Waypoints[i].selected := false;
                end;
                numSelWaypoints := 0;
              end;
              getInfo;
              Render;
            end;

procedure TfrmSoldatMapEditor.CreatePolys(var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  xVal: Single;
  yVal: Single;
  shortestDist: Smallint;
  currentDist: Longint;
  temp: D3DVECTOR2;
  tempVertex: TCustomVertex;
begin
  if (numVerts = 0) then
    begin
      setlength(Polys, polyCount + 1);
      setlength(PolyCoords, polyCount + 1);
      setlength(vertexList, polyCount + 1);
      vertexList[polyCount + 1].polyType := polyType;
    end;
    numVerts := numVerts + 1;
    xVal := X;
    yVal := Y;
    if snapToGrid and showGrid then
      begin
        xVal := snapVertexToGrid(xVal, (scrollCoords[2].X - Floor(scrollCoords[2].X / inc) * inc) * zoomFactor);
        yVal := snapVertexToGrid(yVal, (scrollCoords[2].Y - Floor(scrollCoords[2].Y / inc) * inc) * zoomFactor);
        PolyCoords[polyCount + 1].vertex[numVerts].X := Floor(xVal / zoomFactor + scrollCoords[2].X + 0.5);
        PolyCoords[polyCount + 1].vertex[numVerts].Y := Floor(yVal / zoomFactor + scrollCoords[2].Y + 0.5);
      end
    else
      if ohSnap //snap then
        begin
          shortestDist := sqr(snapRadius) + 1;
          for i := 1 to polyCount do
          begin
            for j := 1 to 3 do
            begin
              if nearCoord(xVal, Polys[i].vertex[j].X, shortestDist) and nearCoord(yVal, Polys[i].vertex[j].Y, shortestDist) then
                begin
                  currentDist := (sqr(Polys[i].vertex[j].X - xVal) + sqr(Polys[i].vertex[j].Y - yVal));
                  if (currentDist < shortestDist) then
                    begin
                      shortestDist := currentDist;
                      xVal := Polys[i].vertex[j].X;
                      yVal := Polys[i].vertex[j].Y;
                      PolyCoords[polyCount + 1].vertex[numVerts].X := PolyCoords[i].vertex[j].X;
                      PolyCoords[polyCount + 1].vertex[numVerts].Y := PolyCoords[i].vertex[j].Y;
                    end;
                  end;
                end;
              end;
            end;
            if ((xVal = X) and (yVal = Y)) or (not ohSnap and not snapToGrid) //no snapping occured then
              begin
                PolyCoords[polyCount + 1].vertex[numVerts].X := Floor(xVal / zoomFactor + scrollCoords[2].X + 0.5);
                PolyCoords[polyCount + 1].vertex[numVerts].Y := Floor(yVal / zoomFactor + scrollCoords[2].Y + 0.5);
              end;
              Polys[polyCount + 1].vertex[numVerts] := CreateCustomVertex(xVal, yVal, 0, 1, ARGB(255 * opacity, RGB(polyClr.blue, polyClr.green, polyClr.red)), (xVal / zoomFactor + scrollCoords[2].X) / xTexture, (yVal / zoomFactor + scrollCoords[2].Y) / yTexture);
              vertexList[polyCount + 1].colour[numVerts].red := polyClr.red;
              vertexList[polyCount + 1].colour[numVerts].green := polyClr.green;
              vertexList[polyCount + 1].colour[numVerts].blue := polyClr.blue;
              if mnuQuad.Checked and mnuCustomX.Checked then
                begin
                  if creatingQuad then
                    begin
                      Polys[polyCount + 1].vertex[numVerts].tu := (frmTexture.x1tex * 2 + 0.5) / xTexture;
                    end
                  else
                  begin
                    if (numVerts = 2) or (numVerts = 3) then
                      begin
                        Polys[polyCount + 1].vertex[numVerts].tu := (frmTexture.x2tex * 2 - 0.5) / xTexture;
                      end
                    else
                    begin
                      Polys[polyCount + 1].vertex[numVerts].tu := (frmTexture.x1tex * 2 + 0.5) / xTexture;
                    end;
                  end;
                end;
                if mnuQuad.Checked and mnuCustomY.Checked then
                  begin
                    if creatingQuad then
                      begin
                        Polys[polyCount + 1].vertex[numVerts].tv := (frmTexture.y2tex * 2 - 0.5) / yTexture;
                      end
                    else
                    begin
                      if (numVerts > 2) then
                        begin
                          Polys[polyCount + 1].vertex[numVerts].tv := (frmTexture.y2tex * 2 - 0.5) / yTexture;
                        end
                      else
                      begin
                        Polys[polyCount + 1].vertex[numVerts].tv := (frmTexture.y1tex * 2 + 0.5) / yTexture;
                      end;
                    end;
                  end;
                  if (numVerts = 1) then
                    begin
                      Polys[polyCount + 1].vertex[2] := Polys[polyCount + 1].vertex[1];
                      Polys[polyCount + 1].vertex[numVerts + 1].X := X;
                      Polys[polyCount + 1].vertex[numVerts + 1].Y := Y;
                      Polys[polyCount + 1].vertex[numVerts + 2] := Polys[polyCount + 1].vertex[1];
                      PolyCoords[polyCount + 1].vertex[numVerts + 2] := PolyCoords[polyCount + 1].vertex[1];
                    end
                  else
                    if (numVerts = 3) then
                      begin
                        numVerts := 0;
                        polyCount := polyCount + 1;
                        if not isCW(polyCount) //switch to make cw then
                          begin
                            temp := PolyCoords[polyCount].vertex[3];
                            PolyCoords[polyCount].vertex[3] := PolyCoords[polyCount].vertex[2];
                            PolyCoords[polyCount].vertex[2] := temp;
                            tempVertex := Polys[polyCount].vertex[3];
                            Polys[polyCount].vertex[3] := Polys[polyCount].vertex[2];
                            Polys[polyCount].vertex[2] := tempVertex;
                          end;
                          toolAction := false;
                          frmInfo.lblCount(0).Caption := polyCount;
                          frmInfo.lblCount(6).Caption := getMapDimensions;
                          applyLightsToVert(smallint(polyCount), 1);
                          applyLightsToVert(smallint(polyCount), 2);
                          applyLightsToVert(smallint(polyCount), 3);
                          Polys[polyCount].Perp.vertex(1).z := 2;
                          Polys[polyCount].Perp.vertex(2).z := 2;
                          Polys[polyCount].Perp.vertex(3).z := 2;
                          SaveUndo;
                          if mnuQuad.Checked and not creatingQuad then
                            begin
                              setlength(Polys, polyCount + 1);
                              setlength(PolyCoords, polyCount + 1);
                              setlength(vertexList, polyCount + 1);
                              vertexList[polyCount + 1].polyType := polyType;
                              Polys[polyCount + 1].vertex[1] := Polys[polyCount].vertex[1];
                              Polys[polyCount + 1].vertex[2] := Polys[polyCount].vertex[3];
                              PolyCoords[polyCount + 1].vertex[1] := PolyCoords[polyCount].vertex[1];
                              PolyCoords[polyCount + 1].vertex[2] := PolyCoords[polyCount].vertex[3];
                              vertexList[polyCount + 1].colour[1] := vertexList[polyCount].colour[1];
                              vertexList[polyCount + 1].colour[2] := vertexList[polyCount].colour[3];
                              numVerts := 2;
                              Polys[polyCount + 1].vertex[3] := Polys[polyCount].vertex[3];
                              PolyCoords[polyCount + 1].vertex[3] := PolyCoords[polyCount].vertex[3];
                              toolAction := true;
                              creatingQuad := true;
                            end
                          else
                            if creatingQuad then
                              begin
                                creatingQuad := false;
                              end;
                              prompt := true;
                            end;
                            Render;
                          end;

procedure TfrmSoldatMapEditor.startSketch(var X: Single; var Y: Single);
label
ErrorHandler;
begin
  //ON ERROR
  showSketch := true;
  frmDisplay.setLayer(10, showSketch);
  sketchLines := sketchLines + 1;
  setlength(sketch, sketchLines);
  sketch[sketchLines].vertex[1].X := X / zoomFactor + scrollCoords[2].X;
  sketch[sketchLines].vertex[1].Y := Y / zoomFactor + scrollCoords[2].Y;
  sketch[sketchLines].vertex[2].X := sketch[sketchLines].vertex[1].X;
  sketch[sketchLines].vertex[2].Y := sketch[sketchLines].vertex[1].Y;
  sketch[sketchLines].vertex[1].z := 1;
  sketch[sketchLines].vertex[2].z := 1;
  Render;
  Exit;
  ErrorHandler:
    Application.MessageBox(pchar('Error starting sketch' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
end;

procedure TfrmSoldatMapEditor.lineSketch(var X: Single; var Y: Single);
label
ErrorHandler;
begin
  //ON ERROR
  sketchLines := sketchLines + 1;
  setlength(sketch, sketchLines);
  sketch[sketchLines].vertex[1].X := sketch[0].vertex[1].X;
  sketch[sketchLines].vertex[1].Y := sketch[0].vertex[1].Y;
  sketch[sketchLines].vertex[2].X := Floor(X / zoomFactor + scrollCoords[2].X + 0.5);
  sketch[sketchLines].vertex[2].Y := Floor(Y / zoomFactor + scrollCoords[2].Y + 0.5);
  sketch[sketchLines].vertex[1].z := 1;
  sketch[sketchLines].vertex[2].z := 1;
  Exit;
  ErrorHandler:
    Application.MessageBox(pchar('Error sketching line' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
end;

procedure TfrmSoldatMapEditor.linkSketch(var X: Single; var Y: Single);
var
  xVal: Single;
  yVal: Single;
  label
  ErrorHandler;
  begin
    //ON ERROR
    xVal := X / zoomFactor + scrollCoords[2].X;
    yVal := Y / zoomFactor + scrollCoords[2].Y;
    if (sqr(xVal - sketch[sketchLines].vertex[1].X) + sqr(yVal - sketch[sketchLines].vertex[1].Y) > sqr(16)) then
      begin
        sketch[sketchLines].vertex[2].X := X / zoomFactor + scrollCoords[2].X;
        sketch[sketchLines].vertex[2].Y := Y / zoomFactor + scrollCoords[2].Y;
        sketchLines := sketchLines + 1;
        setlength(sketch, sketchLines);
        sketch[sketchLines].vertex[1].X := X / zoomFactor + scrollCoords[2].X;
        sketch[sketchLines].vertex[1].Y := Y / zoomFactor + scrollCoords[2].Y;
        sketch[sketchLines].vertex[2].X := X / zoomFactor + scrollCoords[2].X;
        sketch[sketchLines].vertex[2].Y := Y / zoomFactor + scrollCoords[2].Y;
        sketch[sketchLines].vertex[1].z := 1;
        sketch[sketchLines].vertex[2].z := 1;
      end;
      Exit;
      ErrorHandler:
        Application.MessageBox(pchar('Error linking sketch' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
    end;

procedure TfrmSoldatMapEditor.endSketch(var X: Single; var Y: Single);
label
ErrorHandler;
begin
  sketch[sketchLines].vertex[2].X := X / zoomFactor + scrollCoords[2].X;
  sketch[sketchLines].vertex[2].Y := Y / zoomFactor + scrollCoords[2].Y;
  Render;
  Exit;
  ErrorHandler:
    Application.MessageBox(pchar('Error ending sketch' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
end;

procedure TfrmSoldatMapEditor.CreateScenery(var X: Single; var Y: Single);
var
  xVal: Smallint;
  yVal: Smallint;
  i: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    if (numCorners = 0) then
      begin
        Scenery[0].screenTr.X := X;
        Scenery[0].screenTr.Y := Y;
      end;
      numCorners := numCorners + 1;
      xVal := (Scenery[0].screenTr.X);
      yVal := (Scenery[0].screenTr.Y);
      if snapToGrid and showGrid then
        begin
          xVal := snapVertexToGrid(xVal, (scrollCoords[2].X - Floor(scrollCoords[2].X / inc) * inc) * zoomFactor);
          yVal := snapVertexToGrid(yVal, (scrollCoords[2].Y - Floor(scrollCoords[2].Y / inc) * inc) * zoomFactor);
          if (numCorners = 1) then
            begin
              Scenery[0].screenTr.X := xVal;
              Scenery[0].screenTr.Y := yVal;
            end
          else
            if (numCorners = 2)
              then;
            end;
            if (numCorners = 1) and not frmScenery.rotateScenery then
              begin
                numCorners := numCorners + 1;
              end;
              if (numCorners = 2) and not frmScenery.scaleScenery then
                begin
                  numCorners := numCorners + 1;
                end;
                if (numCorners = 3) then
                  begin
                    sceneryCount := sceneryCount + 1;
                    setlength(Scenery, sceneryCount);
                    Scenery[sceneryCount] := Scenery[0];
                    Scenery[sceneryCount].Translation.X := Floor(Scenery[0].screenTr.X / zoomFactor + scrollCoords[2].X + 0.5);
                    Scenery[sceneryCount].Translation.Y := Floor(Scenery[0].screenTr.Y / zoomFactor + scrollCoords[2].Y + 0.5);
                    if (Scenery[0].Style = 0) //create scenery texture then
                      begin
                        CreateSceneryTexture(currentScenery);
                        Scenery[0].Style := sceneryElements;
                        Scenery[sceneryCount].Style := sceneryElements;
                        frmScenery.notClicked := true;
                      end;
                      setCurrentScenery;
                      frmInfo.lblCount(1).Caption := sceneryCount + '/500 (' + sceneryElements + ')';
                      numCorners := 0;
                      prompt := true;
                      SaveUndo;
                    end;
                    Exit;
                    ErrorHandler:
                      Application.MessageBox(pchar('Error creating scenery' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
                  end;

procedure TfrmSoldatMapEditor.snapSelected(var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  PolyNum: Smallint;
  xVal: Single;
  yVal: Single;
  temp: D3DVECTOR2;
  tempVertex: TCustomVertex;
  shortestDist: Single;
  currentDist: Single;
  xDiff: Single;
  yDiff: Single;
begin
  //make sure polys are cw
  for i := 1 to numSelectedPolys do
  begin
    if not isCW(selectedPolys[i]) //switch to make cw then
      begin
        temp := PolyCoords[selectedPolys[i]].vertex[3];
        PolyCoords[selectedPolys[i]].vertex[3] := PolyCoords[selectedPolys[i]].vertex[2];
        PolyCoords[selectedPolys[i]].vertex[2] := temp;
        tempVertex := Polys[selectedPolys[i]].vertex[3];
        Polys[selectedPolys[i]].vertex[3] := Polys[selectedPolys[i]].vertex[2];
        Polys[selectedPolys[i]].vertex[2] := tempVertex;
        PolyNum := vertexList[selectedPolys[i]].vertex[3];
        vertexList[selectedPolys[i]].vertex[3] := vertexList[selectedPolys[i]].vertex[2];
        vertexList[selectedPolys[i]].vertex[2] := PolyNum;
        PolyNum := 0;
      end;
    end;
    //if grid is on, snap to grid
    //else, if vert snapping is on then snap to verts
    //find which vertex of poly is selected
    PolyNum := 0;
    if (numSelectedPolys > 0) then
      begin
        for j := 1 to 3 do
        begin
          if (vertexList[selectedPolys[1]].vertex[j] = 1) //which vertex in poly is selected then
            begin
              if (PolyNum > 0) and not (snapToGrid and showGrid) //if more than one vertex in poly selected then
                begin
                  Render;
                  Exit;
                end
              else
              begin
                PolyNum := j;
              end;
            end;
          end;
          xVal := (Polys[selectedPolys[1]].vertex[PolyNum].X);
          yVal := (Polys[selectedPolys[1]].vertex[PolyNum].Y);
        end
      else
      begin
        for i := 1 to sceneryCount do
        begin
          if (Scenery[i].selected = 1) then
            begin
              xVal := Scenery[i].screenTr.X;
              yVal := Scenery[i].screenTr.Y;
              Break;
            end;
          end;
        end;
        if snapToGrid and showGrid then
          begin
            xDiff := xVal - snapVertexToGrid(xVal, (scrollCoords[2].X - Floor(scrollCoords[2].X / inc) * inc) * zoomFactor);
            yDiff := yVal - snapVertexToGrid(yVal, (scrollCoords[2].Y - Floor(scrollCoords[2].Y / inc) * inc) * zoomFactor);
            if (numSelectedPolys > 0) then
              begin
                for i := 1 to numSelectedPolys do
                begin
                  PolyNum := selectedPolys[i];
                  for j := 1 to 3 do
                  begin
                    if (vertexList[PolyNum].vertex[j] = 1) //if selected then
                      begin
                        Polys[PolyNum].vertex[j].X := Polys[PolyNum].vertex[j].X - xDiff;
                        Polys[PolyNum].vertex[j].Y := Polys[PolyNum].vertex[j].Y - yDiff;
                        PolyCoords[PolyNum].vertex[j].X := Floor(Polys[PolyNum].vertex[j].X / zoomFactor + scrollCoords[2].X + 0.5);
                        PolyCoords[PolyNum].vertex[j].Y := Floor(Polys[PolyNum].vertex[j].Y / zoomFactor + scrollCoords[2].Y + 0.5);
                        if fixedTexture then
                          begin
                            Polys[PolyNum].vertex[j].tu := PolyCoords[PolyNum].vertex[j].X / xTexture;
                            Polys[PolyNum].vertex[j].tv := PolyCoords[PolyNum].vertex[j].Y / yTexture;
                          end;
                        end;
                      end;
                    end;
                  end;
                  if (numSelectedScenery > 0) then
                    begin
                      for i := 1 to sceneryCount do
                      begin
                        if (Scenery[i].selected = 1) then
                          begin
                            Scenery[i].screenTr.X := Scenery[i].screenTr.X - xDiff;
                            Scenery[i].screenTr.Y := Scenery[i].screenTr.Y - yDiff;
                            Scenery[i].Translation.X := Floor(Scenery[i].screenTr.X / zoomFactor + scrollCoords[2].X + 0.5);
                            Scenery[i].Translation.Y := Floor(Scenery[i].screenTr.Y / zoomFactor + scrollCoords[2].Y + 0.5);
                          end;
                        end;
                      end;
                      if (numSelSpawns > 0) then
                        begin
                          for i := 1 to spawnPoints do
                          begin
                            if (Spawns[i].active = 1) then
                              begin
                                Spawns[i].X := Floor((Spawns[i].X + inc / 2) / inc) * inc;
                                Spawns[i].Y := Floor((Spawns[i].Y + inc / 2) / inc) * inc;
                              end;
                            end;
                          end;
                          if (numSelColliders > 0) then
                            begin
                              for i := 1 to colliderCount do
                              begin
                                if (Colliders[i].active = 1) then
                                  begin
                                    Colliders[i].X := Floor((Colliders[i].X + inc / 2) / inc) * inc;
                                    Colliders[i].Y := Floor((Colliders[i].Y + inc / 2) / inc) * inc;
                                  end;
                                end;
                              end;
                              if (numSelLights > 0) then
                                begin
                                  for i := 1 to lightCount do
                                  begin
                                    if Lights[i].selected then
                                      begin
                                        Lights[i].X := Floor((Lights[i].X + inc / 2) / inc) * inc;
                                        Lights[i].Y := Floor((Lights[i].Y + inc / 2) / inc) * inc;
                                      end;
                                    end;
                                  end;
                                  rCenter.X := rCenter.X - xDiff / zoomFactor;
                                  rCenter.Y := rCenter.Y - yDiff / zoomFactor;
                                  for i := 0 to 3 do
                                  begin
                                    selRect[i].X := selRect[i].X - xDiff / zoomFactor;
                                    selRect[i].Y := selRect[i].Y - yDiff / zoomFactor;
                                  end;
                                end
                              else
                                if ohSnap and (numSelectedPolys > 0) then
                                  begin
                                    //if vertices with different coords are selected then exit sub
                                    if (numSelectedPolys > 1) //check if any different coords then
                                      begin
                                        for i := 2 to numSelectedPolys do
                                        begin
                                          for j := 1 to 3 do
                                          begin
                                            if (vertexList[selectedPolys[i]].vertex[j] = 1) //if selected and has same coords then
                                              begin
                                                if (Polys[selectedPolys[i]].vertex[j].X <> xVal) or (Polys[selectedPolys[i]].vertex[j].Y <> yVal) then
                                                  begin
                                                    Render;
                                                    Exit;
                                                  end;
                                                end;
                                              end;
                                            end;
                                          end;
                                          //snap
                                          shortestDist := sqr(snapRadius) + 1;
                                          for i := 1 to polyCount do
                                          begin
                                            for j := 1 to 3 do
                                            begin
                                              if nearCoord(xVal, Polys[i].vertex[j].X, shortestDist) and nearCoord(yVal, Polys[i].vertex[j].Y, shortestDist) then
                                                begin
                                                  currentDist := sqr(Polys[i].vertex[j].X - xVal) + sqr(Polys[i].vertex[j].Y - yVal);
                                                  if (currentDist <= shortestDist) and (vertexList[i].vertex[j] = 0) then
                                                    begin
                                                      shortestDist := currentDist;
                                                      xDiff := xVal - Polys[i].vertex[j].X;
                                                      yDiff := yVal - Polys[i].vertex[j].Y;
                                                      xVal := Polys[i].vertex[j].X;
                                                      yVal := Polys[i].vertex[j].Y;
                                                    end;
                                                  end;
                                                end;
                                              end;
                                              //if snapping occured
                                              if (xVal <> (Polys[selectedPolys[1]].vertex[PolyNum].X)) or (yVal <> (Polys[selectedPolys[1]].vertex[PolyNum].Y)) then
                                                begin
                                                  for i := 1 to numSelectedPolys do
                                                  begin
                                                    for j := 1 to 3 do
                                                    begin
                                                      if (vertexList[selectedPolys[i]].vertex[j] = 1) then
                                                        begin
                                                          Polys[selectedPolys[i]].vertex[j].X := xVal;
                                                          Polys[selectedPolys[i]].vertex[j].Y := yVal;
                                                          PolyCoords[selectedPolys[i]].vertex[j].X := (xVal / zoomFactor + scrollCoords[2].X);
                                                          PolyCoords[selectedPolys[i]].vertex[j].Y := (yVal / zoomFactor + scrollCoords[2].Y);
                                                        end;
                                                      end;
                                                    end;
                                                    rCenter.X := rCenter.X - xDiff / zoomFactor;
                                                    rCenter.Y := rCenter.Y - yDiff / zoomFactor;
                                                    for i := 0 to 3 do
                                                    begin
                                                      selRect[i].X := selRect[i].X - xDiff / zoomFactor;
                                                      selRect[i].Y := selRect[i].Y - yDiff / zoomFactor;
                                                    end;
                                                  end;
                                                  PolyNum := 0;
                                                end;
                                                getInfo;
                                                Render;
                                              end;

procedure TfrmSoldatMapEditor.regionSelection(var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  xVal: Single;
  yVal: Single;
  isSelected: Boolean;
begin
  xVal := X / zoomFactor + scrollCoords[2].X;
  yVal := Y / zoomFactor + scrollCoords[2].Y;
  if (currentFunction = TOOL_VSELECT) then
    begin
      numSelectedPolys := 0;
      setlength(selectedPolys, numSelectedPolys);
      numSelectedScenery := 0;
      numSelSpawns := 0;
      numSelColliders := 0;
      numSelWaypoints := 0;
      numSelLights := 0;
      for i := 1 to sceneryCount do
      begin
        Scenery[i].selected := 0;
      end;
    end;
    if showPolys or showWireframe or showPoints then
      begin
        isSelected := RegionSelPolys(X, Y);
      end
    else
      if (currentFunction = TOOL_VSELECT) then
        begin
          for i := 1 to polyCount do
          begin
            vertexList[i].vertex[1] := 0;
            vertexList[i].vertex[2] := 0;
            vertexList[i].vertex[3] := 0;
          end;
        end;
        if showObjects then
          begin
            isSelected := RegionSelObjects(xVal, yVal, isSelected);
          end
        else
          if (currentFunction = TOOL_VSELECT) then
            begin
              for i := 1 to spawnPoints do
              begin
                Spawns[i].active := 0;
              end;
              for i := 1 to colliderCount do
              begin
                Colliders[i].active := 0;
              end;
            end;
            if showWaypoints then
              begin
                isSelected := RegionSelWaypoints(xVal, yVal, isSelected);
              end
            else
            begin
              for i := 1 to waypointCount do
              begin
                Waypoints[i].selected := false;
              end;
            end;
            if showLights then
              begin
                isSelected := regionSelLights(xVal, yVal, isSelected);
              end
            else
              if (currentFunction = TOOL_VSELECT) then
                begin
                  for i := 1 to lightCount do
                  begin
                    Lights[i].selected := 0;
                  end;
                end;
                currentWaypoint := 0;
                selectedCoords[1].X := 0;
                selectedCoords[1].Y := 0;
                selectedCoords[2].X := 0;
                selectedCoords[2].Y := 0;
                getRCenter;
                getInfo;
                selectionChanged := true;
                Render;
              end;

function TfrmSoldatMapEditor.RegionSelPolys(var X: Single; var Y: Single): Boolean;
var
  i: Smallint;
  j: Smallint;
  currentDist: Longint;
  shortestDist: Longint;
  pIndex: Smallint;
  vIndex: Smallint;
  selVerts: Byte;
  selected: Byte;
  xVal: Single;
  yVal: Single;
begin
  xVal := X / zoomFactor + scrollCoords[2].X;
  yVal := Y / zoomFactor + scrollCoords[2].Y;
  for i := 1 to polyCount do
  begin
    if (currentFunction = TOOL_VSELECT) then
      begin
        vertexList[i].vertex[1] := 0;
        vertexList[i].vertex[2] := 0;
        vertexList[i].vertex[3] := 0;
      end;
      if (pointInPoly(X, Y, i)) then
        begin
          shortestDist := sqr(64) + 1;
          for j := 1 to 3 do
          begin
            currentDist := sqr(PolyCoords[i].vertex[j].X - xVal) + sqr(PolyCoords[i].vertex[j].Y - yVal);
            if (currentDist < shortestDist) then
              begin
                shortestDist := currentDist;
                pIndex := i;
                vIndex := j;
              end;
            end;
            if (pIndex > 0) and (vIndex > 0) then
              begin
                if ((currentFunction = TOOL_VSELADD) and (vertexList[pIndex].vertex[vIndex] = 1)) or ((currentFunction = TOOL_VSELSUB) and (vertexList[pIndex].vertex[vIndex] = 0)) then
                  begin
                    pIndex := 0;
                    vIndex := 0;
                  end
                else
                  if (currentFunction <> TOOL_VSELECT) then
                    begin
                      Break;
                    end;
                  end;
                end;
              end;
              if (pIndex > 0) and (vIndex > 0) then
                begin
                  if (currentFunction = TOOL_VSELECT) then
                    begin
                      numSelectedPolys := numSelectedPolys + 1;
                      setlength(selectedPolys, numSelectedPolys);
                      selectedPolys[numSelectedPolys] := pIndex;
                      vertexList[pIndex].vertex[vIndex] := 1;
                      result := true;
                    end
                  else
                    if (currentFunction = TOOL_VSELADD) then
                      begin
                        for j := 1 to 3 do
                        begin
                          selVerts := selVerts + vertexList[pIndex].vertex[j];
                        end;
                        if (selVerts > 0) //poly already selected then
                          begin
                            vertexList[pIndex].vertex[vIndex] := 1;
                          end
                        else
                        begin
                          numSelectedPolys := numSelectedPolys + 1;
                          setlength(selectedPolys, numSelectedPolys);
                          selectedPolys[numSelectedPolys] := pIndex;
                          vertexList[pIndex].vertex[vIndex] := 1;
                        end;
                        result := true;
                      end
                    else
                      if (currentFunction = TOOL_VSELSUB) then
                        begin
                          vertexList[pIndex].vertex[vIndex] := 0;
                          for i := 1 to numSelectedPolys do
                          begin
                            for j := 1 to 3 do
                            begin
                              selVerts := selVerts + vertexList[selectedPolys[i]].vertex[j];
                            end;
                            if (selVerts = 0) //no longer selected, put last here and shorten array then
                              begin
                                selectedPolys[i] := selectedPolys[numSelectedPolys];
                                numSelectedPolys := numSelectedPolys - 1;
                              end;
                              selVerts := 0;
                            end;
                            setlength(selectedPolys, numSelectedPolys);
                            result := true;
                          end;
                        end;
                      end;

function TfrmSoldatMapEditor.RegionSelObjects(var xVal: Single; var yVal: Single; var skipSel: Boolean): Boolean;
var
  i: Smallint;
  j: Smallint;
  currentDist: Longint;
  shortestDist: Longint;
  Index: Smallint;
begin
  shortestDist := (sqr(8) + 1);
  for i := 1 to spawnPoints do
  begin
    if (currentFunction = TOOL_VSELECT) then
      begin
        Spawns[i].active := 0;
      end;
      if nearCoord(xVal, Spawns[i].X, 8 / zoomFactor) and nearCoord(yVal, Spawns[i].Y, 8 / zoomFactor) then
        begin
          currentDist := sqr(Spawns[i].X - xVal) + sqr(Spawns[i].Y - yVal);
          if (currentDist < shortestDist) then
            begin
              shortestDist := currentDist;
              Index := i;
            end;
          end;
        end;
        if (Index > 0) then
          begin
            if (currentFunction = TOOL_VSELECT) then
              begin
                Spawns[Index].active := 1;
                numSelSpawns := numSelSpawns + 1;
                skipSel := true;
              end
            else
              if (currentFunction = TOOL_VSELADD) then
                begin
                  Spawns[Index].active := 1;
                  numSelSpawns := numSelSpawns + 1;
                  skipSel := true;
                end
              else
                if (currentFunction = TOOL_VSELSUB) then
                  begin
                    Spawns[Index].active := 0;
                    numSelSpawns := numSelSpawns - 1;
                    skipSel := true;
                  end;
                end;
                shortestDist := sqr(64) + 1;
                for i := 1 to colliderCount do
                begin
                  if (currentFunction = TOOL_VSELECT) then
                    begin
                      Colliders[i].active := 0;
                    end;
                    if nearCoord(xVal, Colliders[i].X, Colliders[i].radius / 2) and nearCoord(yVal, Colliders[i].Y, Colliders[i].radius / 2) then
                      begin
                        currentDist := sqr(Colliders[i].X - xVal) + sqr(Colliders[i].Y - yVal);
                        if (currentDist < shortestDist) then
                          begin
                            shortestDist := currentDist;
                            Index := i;
                          end;
                        end;
                      end;
                      if (Index > 0) and not skipSel then
                        begin
                          if (currentFunction = TOOL_VSELECT) then
                            begin
                              Colliders[Index].active := 1;
                              numSelColliders := numSelColliders + 1;
                              skipSel := true;
                            end
                          else
                            if (currentFunction = TOOL_VSELADD) then
                              begin
                                Colliders[Index].active := 1;
                                numSelColliders := numSelColliders + 1;
                                skipSel := true;
                              end
                            else
                              if (currentFunction = TOOL_VSELSUB) then
                                begin
                                  Colliders[Index].active := 0;
                                  numSelColliders := numSelColliders - 1;
                                  skipSel := true;
                                end;
                              end;
                              result := skipSel;
                            end;

function TfrmSoldatMapEditor.regionSelLights(var xVal: Single; var yVal: Single; var skipSel: Boolean): Boolean;
var
  i: Smallint;
  j: Smallint;
  currentDist: Longint;
  shortestDist: Longint;
  Index: Smallint;
begin
  shortestDist := (sqr(8) + 1);
  for i := 1 to lightCount do
  begin
    if (currentFunction = TOOL_VSELECT) then
      begin
        Lights[i].selected := 0;
      end;
      if nearCoord(xVal, Lights[i].X, 8 / zoomFactor) and nearCoord(yVal, Lights[i].Y, 8 / zoomFactor) then
        begin
          currentDist := sqr(Lights[i].X - xVal) + sqr(Lights[i].Y - yVal);
          if (currentDist < shortestDist) then
            begin
              shortestDist := currentDist;
              Index := i;
            end;
          end;
        end;
        if (Index > 0) and not skipSel then
          begin
            if (currentFunction = TOOL_VSELECT) then
              begin
                Lights[Index].selected := 1;
                numSelLights := numSelLights + 1;
                skipSel := true;
              end
            else
              if (currentFunction = TOOL_VSELADD) then
                begin
                  Lights[Index].selected := 1;
                  numSelLights := numSelLights + 1;
                  skipSel := true;
                end
              else
                if (currentFunction = TOOL_VSELSUB) then
                  begin
                    Lights[Index].selected := 0;
                    numSelLights := numSelLights - 1;
                    skipSel := true;
                  end;
                end;
                result := skipSel;
              end;

function TfrmSoldatMapEditor.RegionSelWaypoints(var xVal: Single; var yVal: Single; var skipSel: Boolean): Boolean;
var
  i: Smallint;
  j: Smallint;
  currentDist: Longint;
  shortestDist: Longint;
  Index: Smallint;
begin
  shortestDist := (sqr(8) + 1);
  for i := 1 to waypointCount do
  begin
    if (currentFunction = TOOL_VSELECT) then
      begin
        Waypoints[i].selected := false;
      end;
      if (frmWaypoints.showPaths = Waypoints[i].pathNum) or (frmWaypoints.showPaths = 0) then
        begin
          if nearCoord(xVal, Waypoints[i].X, 8 / zoomFactor) and nearCoord(yVal, Waypoints[i].Y, 8 / zoomFactor) then
            begin
              currentDist := sqr(Waypoints[i].X - xVal) + sqr(Waypoints[i].Y - yVal);
              if (currentDist < shortestDist) then
                begin
                  shortestDist := currentDist;
                  Index := i;
                end;
              end;
            end;
          end;
          if (Index > 0) and not skipSel then
            begin
              if (currentFunction = TOOL_VSELECT) then
                begin
                  Waypoints[Index].selected := true;
                  numSelWaypoints := numSelWaypoints + 1;
                end
              else
                if (currentFunction = TOOL_VSELADD) then
                  begin
                    Waypoints[Index].selected := true;
                    numSelWaypoints := numSelWaypoints + 1;
                  end
                else
                  if (currentFunction = TOOL_VSELSUB) then
                    begin
                      Waypoints[Index].selected := false;
                      numSelWaypoints := numSelWaypoints - 1;
                    end;
                  end;
                end;

function TfrmSoldatMapEditor.eraseSketch(var X: Single; var Y: Single): Byte;
var
  i: Smallint;
  j: Smallint;
  currentDist: Longint;
  shortestDist: Longint;
  lineIndex: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    result := 0;
    shortestDist := sqr(clrRadius) + 1;
    for i := 1 to sketchLines do
    begin
      for j := 1 to 2 do
      begin
        currentDist := sqr(X - sketch[i].vertex[j].X) + sqr(Y - sketch[i].vertex[j].Y);
        if (currentDist < shortestDist) then
          begin
            shortestDist := currentDist;
            lineIndex := i;
          end;
        end;
      end;
      if (lineIndex > 0) then
        begin
          sketch[lineIndex] := sketch[sketchLines];
          sketchLines := sketchLines - 1;
          setlength(sketch, sketchLines);
          Render;
          result := 1;
        end;
        Exit;
        ErrorHandler:
          Application.MessageBox(pchar('Error erasing sketch' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
      end;

function TfrmSoldatMapEditor.moveLines(var X: Single; var Y: Single; var xDiff: Single; var yDiff: Single): Byte;
var
  i: Smallint;
  j: Smallint;
  dist: Single;
  label
  ErrorHandler;
  begin
    //ON ERROR
    xDiff := xDiff / zoomFactor;
    yDiff := yDiff / zoomFactor;
    result := 0;
    for i := 1 to sketchLines do
    begin
      for j := 1 to 2 do
      begin
        dist := sqr(X - sketch[i].vertex[j].X) + sqr(Y - sketch[i].vertex[j].Y);
        if (dist < sqr(clrRadius)) then
          begin
            sketch[i].vertex[j].X := sketch[i].vertex[j].X + xDiff * Cos((dist / (sqr(clrRadius))) * pi / 2);
            sketch[i].vertex[j].Y := sketch[i].vertex[j].Y + yDiff * Cos((dist / (sqr(clrRadius))) * pi / 2);
            result := 1;
          end;
        end;
      end;
      Exit;
      ErrorHandler:
        Application.MessageBox(pchar('Error moving sketch lines' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
    end;

procedure TfrmSoldatMapEditor.deleteSmallLines;
var
  i: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    for i := 1 to sketchLines do
    begin
      if (Floor(sketch[i].vertex[1].X + 0.5) = Floor(sketch[i].vertex[2].X + 0.5)) and (Floor(sketch[i].vertex[1].Y + 0.5) = Floor(sketch[i].vertex[2].Y + 0.5)) then
        begin
          sketch[i] := sketch[sketchLines];
          sketchLines := sketchLines - 1;
        end;
      end;
      setlength(sketch, sketchLines);
      Render;
      Exit;
      ErrorHandler:
        Application.MessageBox(pchar('Error deleting small sketch lines' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
    end;

procedure TfrmSoldatMapEditor.VertexSelection(var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    if (currentFunction = TOOL_VSELECT) then
      begin
        numSelectedPolys := 0;
        setlength(selectedPolys, numSelectedPolys);
        numSelectedScenery := 0;
        numSelSpawns := 0;
        numSelColliders := 0;
        numSelWaypoints := 0;
      end
    else
      if (currentFunction = TOOL_VSELSUB) then
        begin
          numSelectedPolys := 0;
          setlength(selectedPolys, numSelectedPolys);
        end;
        if showPolys or showWireframe or showPoints then
          begin
            VertexSelPolys;
          end
        else
          if (currentFunction = TOOL_VSELECT) then
            begin
              for i := 1 to polyCount do
              begin
                for j := 1 to 3 do
                begin
                  vertexList[i].vertex[j] := 0;
                end;
              end;
            end;
            if showScenery then
              begin
                VertexSelScenery;
              end
            else
              if (currentFunction = TOOL_VSELECT) then
                begin
                  for i := 1 to sceneryCount do
                  begin
                    Scenery[i].selected := 0;
                  end;
                end;
                if showObjects then
                  begin
                    VertexSelObjects;
                  end
                else
                  if (currentFunction = TOOL_VSELECT) then
                    begin
                      for i := 1 to spawnPoints do
                      begin
                        Spawns[i].active := 0;
                      end;
                      for i := 1 to colliderCount do
                      begin
                        Colliders[i].active := 0;
                      end;
                    end;
                    if showWaypoints then
                      begin
                        VertexSelWaypoints;
                      end
                    else
                      if (currentFunction = TOOL_VSELECT) then
                        begin
                          for i := 1 to waypointCount do
                          begin
                            Waypoints[i].selected := false;
                          end;
                        end;
                        if showLights then
                          begin
                            VertexSelLights;
                          end
                        else
                          if (currentFunction = TOOL_VSELECT) then
                            begin
                              for i := 1 to lightCount do
                              begin
                                Lights[i].selected := 0;
                              end;
                            end;
                            currentWaypoint := 0;
                            selectedCoords[1].X := X;
                            selectedCoords[1].Y := Y;
                            selectedCoords[2].X := X;
                            selectedCoords[2].Y := Y;
                            getRCenter;
                            getInfo;
                            selectionChanged := true;
                            Render;
                            Exit;
                            ErrorHandler:
                              Application.MessageBox(pchar('Error selecting vertices' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
                          end;

procedure TfrmSoldatMapEditor.VertexSelPolys;
var
  i: Smallint;
  j: Smallint;
  addPoly: Smallint;
  notSel: Smallint;
begin
  if (currentFunction = TOOL_VSELECT) then
    begin
      for i := 1 to polyCount do
      begin
        for j := 1 to 3 do
        begin
          vertexList[i].vertex[j] := 0;
          if inSelRect(Polys[i].vertex[j].X, Polys[i].vertex[j].Y) then
            begin
              addPoly := 1;
              vertexList[i].vertex[j] := 1;
            end;
          end;
          if (addPoly = 1) then
            begin
              numSelectedPolys := numSelectedPolys + 1;
              setlength(selectedPolys, numSelectedPolys);
              selectedPolys[numSelectedPolys] := i;
            end;
            addPoly := 0;
            notSel := 0;
          end;
        end
      else
        if (currentFunction = TOOL_VSELADD) then
          begin
            for i := 1 to polyCount do
            begin
              for j := 1 to 3 do
              begin
                if (vertexList[i].vertex[j] = 0) then
                  begin
                    notSel := notSel + 1;
                    if inSelRect(Polys[i].vertex[j].X, Polys[i].vertex[j].Y) then
                      begin
                        addPoly := 1;
                        vertexList[i].vertex[j] := 1;
                      end;
                    end;
                  end;
                  if (addPoly = 1) and (notSel = 3) then
                    begin
                      numSelectedPolys := numSelectedPolys + 1;
                      setlength(selectedPolys, numSelectedPolys);
                      selectedPolys[numSelectedPolys] := i;
                    end;
                    addPoly := 0;
                    notSel := 0;
                  end;
                end
              else
                if (currentFunction = TOOL_VSELSUB) then
                  begin
                    for i := 1 to polyCount do
                    begin
                      for j := 1 to 3 do
                      begin
                        if (vertexList[i].vertex[j] = 1) //if already selected and if in range then
                          begin
                            if inSelRect(Polys[i].vertex[j].X, Polys[i].vertex[j].Y) then
                              begin
                                notSel := notSel + 1;
                                vertexList[i].vertex[j] := 0;
                              end
                            else
                            begin
                              addPoly := 1;
                            end;
                          end;
                        end;
                        if (addPoly = 1) then
                          begin
                            numSelectedPolys := numSelectedPolys + 1;
                            setlength(selectedPolys, numSelectedPolys);
                            selectedPolys[numSelectedPolys] := i;
                          end;
                          addPoly := 0;
                          notSel := 0;
                        end;
                      end;
                    end;

procedure TfrmSoldatMapEditor.VertexSelScenery;
var
  i: Smallint;
  sVal: Smallint;
  sceneryCoords: array[0..3] of TCustomVertex;
  selected: array[0..3] of Boolean;
begin
  for i := 1 to sceneryCount do
  begin
    sVal := Scenery[i].Style;
    sceneryCoords[0].X := (Scenery[i].Translation.X - scrollCoords[2].X) * zoomFactor;
    sceneryCoords[0].Y := (Scenery[i].Translation.Y - scrollCoords[2].Y) * zoomFactor;
    sceneryCoords[1].X := sceneryCoords[0].X + Cos(Scenery[i].rotation) * (SceneryTextures[sVal].Width) * Scenery[i].Scaling.X * zoomFactor;
    sceneryCoords[1].Y := sceneryCoords[0].Y - Sin(Scenery[i].rotation) * (SceneryTextures[sVal].Width) * Scenery[i].Scaling.X * zoomFactor;
    sceneryCoords[3].X := sceneryCoords[0].X + Sin(Scenery[i].rotation) * (SceneryTextures[sVal].Height) * Scenery[i].Scaling.Y * zoomFactor;
    sceneryCoords[3].Y := sceneryCoords[0].Y + Cos(Scenery[i].rotation) * (SceneryTextures[sVal].Height) * Scenery[i].Scaling.Y * zoomFactor;
    sceneryCoords[2].X := sceneryCoords[3].X + sceneryCoords[1].X - sceneryCoords[0].X;
    sceneryCoords[2].Y := sceneryCoords[3].Y + sceneryCoords[1].Y - sceneryCoords[0].Y;
    selected[0] := inSelRect(sceneryCoords[0].X, sceneryCoords[0].Y);
    if sceneryVerts then
      begin
        selected[1] := inSelRect(sceneryCoords[1].X, sceneryCoords[1].Y);
        selected[2] := inSelRect(sceneryCoords[2].X, sceneryCoords[2].Y);
        selected[3] := inSelRect(sceneryCoords[3].X, sceneryCoords[3].Y);
      end
    else
    begin
      selected[1] := false;
      selected[2] := false;
      selected[3] := false;
    end;
    if (currentFunction = TOOL_VSELECT) then
      begin
        Scenery[i].selected := 0;
      end;
      if showWireframe or (((Scenery[i].level = 0) and sslBack) or ((Scenery[i].level = 1) and sslMid) or ((Scenery[i].level = 2) and sslFront)) then
        begin
          if selected[0] or selected[1] or selected[2] or selected[3] then
            begin
              if (currentFunction = TOOL_VSELECT) then
                begin
                  Scenery[i].selected := 1;
                  numSelectedScenery := numSelectedScenery + 1;
                end
              else
                if (currentFunction = TOOL_VSELADD) then
                  begin
                    if (Scenery[i].selected = 0) then
                      begin
                        numSelectedScenery := numSelectedScenery + 1;
                      end;
                      Scenery[i].selected := 1;
                    end
                  else
                    if (currentFunction = TOOL_VSELSUB) then
                      begin
                        if (Scenery[i].selected = 1) then
                          begin
                            numSelectedScenery := numSelectedScenery - 1;
                          end;
                          Scenery[i].selected := 0;
                        end;
                      end;
                    end;
                  end;
                end;

procedure TfrmSoldatMapEditor.VertexSelObjects;
var
  i: Smallint;
  j: Smallint;
  xCoord: Longint;
  yCoord: Longint;
begin
  for i := 1 to spawnPoints do
  begin
    xCoord := (Spawns[i].X - scrollCoords[2].X) * zoomFactor;
    yCoord := (Spawns[i].Y - scrollCoords[2].Y) * zoomFactor;
    if (currentFunction = TOOL_VSELECT) then
      begin
        Spawns[i].active := 0;
      end;
      if inSelRect(xCoord, yCoord) then
        begin
          if (currentFunction = TOOL_VSELECT) then
            begin
              Spawns[i].active := 1;
              numSelSpawns := numSelSpawns + 1;
            end
          else
            if (currentFunction = TOOL_VSELADD) and (Spawns[i].active = 0) then
              begin
                numSelSpawns := numSelSpawns + 1;
                Spawns[i].active := 1;
              end
            else
              if (currentFunction = TOOL_VSELSUB) and (Spawns[i].active = 1) then
                begin
                  numSelSpawns := numSelSpawns - 1;
                  Spawns[i].active := 0;
                end;
              end;
            end;
            for i := 1 to colliderCount do
            begin
              xCoord := (Colliders[i].X - scrollCoords[2].X) * zoomFactor;
              yCoord := (Colliders[i].Y - scrollCoords[2].Y) * zoomFactor;
              if (currentFunction = TOOL_VSELECT) then
                begin
                  Colliders[i].active := 0;
                end;
                if inSelRect(xCoord, yCoord) then
                  begin
                    if (currentFunction = TOOL_VSELECT) then
                      begin
                        numSelColliders := numSelColliders + 1;
                        Colliders[i].active := 1;
                      end
                    else
                      if (currentFunction = TOOL_VSELADD) and (Colliders[i].active = 0) then
                        begin
                          numSelColliders := numSelColliders + 1;
                          Colliders[i].active := 1;
                        end
                      else
                        if (currentFunction = TOOL_VSELSUB) and (Colliders[i].active = 1) then
                          begin
                            numSelColliders := numSelColliders - 1;
                            Colliders[i].active := 0;
                          end;
                        end;
                      end;
                    end;

procedure TfrmSoldatMapEditor.VertexSelLights;
var
  i: Smallint;
  j: Smallint;
  xCoord: Longint;
  yCoord: Longint;
begin
  for i := 1 to lightCount do
  begin
    xCoord := (Lights[i].X - scrollCoords[2].X) * zoomFactor;
    yCoord := (Lights[i].Y - scrollCoords[2].Y) * zoomFactor;
    if (currentFunction = TOOL_VSELECT) then
      begin
        Lights[i].selected := 0;
      end;
      if inSelRect(xCoord, yCoord) then
        begin
          if (currentFunction = TOOL_VSELECT) then
            begin
              Lights[i].selected := 1;
              numSelLights := numSelLights + 1;
            end
          else
            if (currentFunction = TOOL_VSELADD) and (Lights[i].selected = 0) then
              begin
                numSelLights := numSelLights + 1;
                Lights[i].selected := 1;
              end
            else
              if (currentFunction = TOOL_VSELSUB) and (Lights[i].selected = 1) then
                begin
                  numSelLights := numSelLights - 1;
                  Lights[i].selected := 0;
                end;
              end;
            end;
          end;

procedure TfrmSoldatMapEditor.VertexSelWaypoints;
var
  i: Smallint;
  j: Smallint;
  xCoord: Longint;
  yCoord: Longint;
begin
  for i := 1 to waypointCount do
  begin
    if (frmWaypoints.showPaths = Waypoints[i].pathNum) or (frmWaypoints.showPaths = 0) then
      begin
        xCoord := (Waypoints[i].X - scrollCoords[2].X) * zoomFactor;
        yCoord := (Waypoints[i].Y - scrollCoords[2].Y) * zoomFactor;
        if (currentFunction = TOOL_VSELECT) then
          begin
            Waypoints[i].selected := false;
          end;
          if inSelRect(xCoord, yCoord) then
            begin
              if (currentFunction = TOOL_VSELECT) then
                begin
                  Waypoints[i].selected := true;
                  numSelWaypoints := numSelWaypoints + 1;
                end
              else
                if (currentFunction = TOOL_VSELADD) and not Waypoints[i].selected then
                  begin
                    numSelWaypoints := numSelWaypoints + 1;
                    Waypoints[i].selected := true;
                  end
                else
                  if (currentFunction = TOOL_VSELSUB) and Waypoints[i].selected then
                    begin
                      numSelWaypoints := numSelWaypoints - 1;
                      Waypoints[i].selected := false;
                    end;
                  end;
                end;
              end;
            end;

procedure TfrmSoldatMapEditor.getRCenter;
var
  i: Smallint;
  j: Smallint;
  setCoords: Boolean;
  xVal: Single;
  yVal: Single;
  Width: Single;
  Height: Single;
  label
  ErrorHandler;
  begin
    //ON ERROR
    if (numSelectedPolys > 0) then
      begin
        for j := 1 to 3 do
        begin
          if (vertexList[selectedPolys[1]].vertex[j] = 1) then
            begin
              selRect[0].X := PolyCoords[selectedPolys[1]].vertex[j].X;
              selRect[0].Y := PolyCoords[selectedPolys[1]].vertex[j].Y;
              selRect[2].X := PolyCoords[selectedPolys[1]].vertex[j].X;
              selRect[2].Y := PolyCoords[selectedPolys[1]].vertex[j].Y;
            end;
          end;
          for i := 1 to numSelectedPolys do
          begin
            for j := 1 to 3 do
            begin
              if (vertexList[selectedPolys[i]].vertex[j] = 1) then
                begin
                  compareRect(PolyCoords[selectedPolys[i]].vertex[j].X, PolyCoords[selectedPolys[i]].vertex[j].Y);
                end;
              end;
            end;
          end;
          if (numSelectedScenery > 0) then
            begin
              setCoords := false;
              for i := 1 to sceneryCount do
              begin
                if (Scenery[i].selected = 1) then
                  begin
                    if not setCoords and (numSelectedPolys = 0) then
                      begin
                        setCoords := true;
                        selRect[0].X := Scenery[i].Translation.X;
                        selRect[0].Y := Scenery[i].Translation.Y;
                        selRect[2].X := Scenery[i].Translation.X;
                        selRect[2].Y := Scenery[i].Translation.Y;
                      end;
                      compareRect(Scenery[i].Translation.X, Scenery[i].Translation.Y);
                      Width := SceneryTextures[Scenery[i].Style].Width * Scenery[i].Scaling.X;
                      Height := SceneryTextures[Scenery[i].Style].Height * Scenery[i].Scaling.Y;
                      xVal := Scenery[i].Translation.X + (Cos(Scenery[i].rotation) * Width) + (Sin(Scenery[i].rotation) * Height);
                      yVal := Scenery[i].Translation.Y - (Sin(Scenery[i].rotation) * Width) + (Cos(Scenery[i].rotation) * Height);
                      compareRect(xVal, yVal);
                    end;
                  end;
                end;
                if (numSelWaypoints > 0) then
                  begin
                    setCoords := false;
                    for i := 1 to waypointCount do
                    begin
                      if Waypoints[i].selected then
                        begin
                          if not setCoords and (numSelectedPolys = 0) and (numSelectedScenery = 0) then
                            begin
                              setCoords := true;
                              selRect[0].X := Waypoints[i].X;
                              selRect[0].Y := Waypoints[i].Y;
                              selRect[2].X := Waypoints[i].X;
                              selRect[2].Y := Waypoints[i].Y;
                            end;
                            compareRect(Waypoints[i].X, Waypoints[i].Y);
                          end;
                        end;
                      end;
                      if (numSelColliders > 0) then
                        begin
                          setCoords := false;
                          for i := 1 to colliderCount do
                          begin
                            if Colliders[i].active then
                              begin
                                if not setCoords and (numSelectedPolys = 0) and (numSelectedScenery = 0) then
                                  begin
                                    setCoords := true;
                                    selRect[0].X := Colliders[i].X;
                                    selRect[0].Y := Colliders[i].Y;
                                    selRect[2].X := Colliders[i].X;
                                    selRect[2].Y := Colliders[i].Y;
                                  end;
                                  compareRect(Colliders[i].X, Colliders[i].Y);
                                end;
                              end;
                            end;
                            if (numSelSpawns > 0) then
                              begin
                                setCoords := false;
                                for i := 1 to spawnPoints do
                                begin
                                  if Spawns[i].active then
                                    begin
                                      if not setCoords and (numSelectedPolys = 0) and (numSelectedScenery = 0) then
                                        begin
                                          setCoords := true;
                                          selRect[0].X := Spawns[i].X;
                                          selRect[0].Y := Spawns[i].Y;
                                          selRect[2].X := Spawns[i].X;
                                          selRect[2].Y := Spawns[i].Y;
                                        end;
                                        compareRect(Spawns[i].X, Spawns[i].Y);
                                      end;
                                    end;
                                  end;
                                  if (numSelLights > 0) then
                                    begin
                                      setCoords := false;
                                      for i := 1 to lightCount do
                                      begin
                                        if Lights[i].selected then
                                          begin
                                            if not setCoords and (numSelectedPolys = 0) and (numSelectedScenery = 0) then
                                              begin
                                                setCoords := true;
                                                selRect[0].X := Lights[i].X;
                                                selRect[0].Y := Lights[i].Y;
                                                selRect[2].X := Lights[i].X;
                                                selRect[2].Y := Lights[i].Y;
                                              end;
                                              compareRect(Lights[i].X, Lights[i].Y);
                                            end;
                                          end;
                                        end;
                                        selRect[1].X := selRect[2].X;
                                        selRect[1].Y := selRect[0].Y;
                                        selRect[3].X := selRect[0].X;
                                        selRect[3].Y := selRect[2].Y;
                                        if mnuFixedRCenter.Checked then
                                          begin
                                            rCenter.X := Midpoint(selRect[0].X, selRect[2].X);
                                            rCenter.Y := Midpoint(selRect[0].Y, selRect[2].Y);
                                          end;
                                          Exit;
                                          ErrorHandler:
                                            Application.MessageBox(pchar(Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
                                        end;

procedure TfrmSoldatMapEditor.compareRect(xVal: Smallint; yVal: Smallint);
begin
  if (xVal < selRect[0].X) then
    begin
      selRect[0].X := xVal;
    end;
    if (xVal > selRect[2].X) then
      begin
        selRect[2].X := xVal;
      end;
      if (yVal < selRect[0].Y) then
        begin
          selRect[0].Y := yVal;
        end;
        if (yVal > selRect[2].Y) then
          begin
            selRect[2].Y := yVal;
          end;
        end;

procedure TfrmSoldatMapEditor.vertexSelAlt(var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  xDist: Smallint;
  yDist: Smallint;
  xCenter: Smallint;
  yCenter: Smallint;
  addPoly: Smallint;
  notSel: Smallint;
begin
  xDist := (X - selectedCoords[1].X) / 2; //x distance from coord
  yDist := (Y - selectedCoords[1].Y) / 2; //y distance from coord
  xCenter := X - xDist;
  yCenter := Y - yDist;
  numSelectedPolys := 0;
  setlength(selectedPolys, numSelectedPolys);
  for i := 1 to polyCount do
  begin
    for j := 1 to 3 do
    begin
      //if in range
      if nearCoord(xCenter, Polys[i].vertex[j].X, Abs(xDist)) and nearCoord(yCenter, Polys[i].vertex[j].Y, Abs(yDist)) then
        begin
          if (vertexList[i].vertex[j] = 0) then
            begin
              vertexList[i].vertex[j] := 1;
              addPoly := 1;
            end
          else
          begin
            vertexList[i].vertex[j] := 0;
          end;
        end
      else
        if (vertexList[i].vertex[j] = 1) then
          begin
            addPoly := 1;
          end;
        end;
        if (addPoly = 1) then
          begin
            numSelectedPolys := numSelectedPolys + 1;
            setlength(selectedPolys, numSelectedPolys);
            selectedPolys[numSelectedPolys] := i;
          end;
          addPoly := 0;
        end;
        selectedCoords[1].X := X;
        selectedCoords[1].Y := Y;
        selectedCoords[2].X := X;
        selectedCoords[2].Y := Y;
        Render;
      end;

procedure TfrmSoldatMapEditor.polySelection(var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  addPoly: Smallint;
  shortestDist: Smallint;
  firstClicked: Smallint;
  foundSelected: Smallint;
begin
  addPoly := 0;
  if (currentFunction = TOOL_PSELECT) //select polys (destroy and remake) then
    begin
      setlength(selectedPolys, 0);
      numSelectedPolys := 0;
      numSelectedScenery := 0;
      if showPolys or showWireframe or showPoints then
        begin
          shortestDist := sqr(16) + 1;
          for i := 1 to polyCount do
          begin
            if (pointInPoly(X, Y, i)) and (addPoly = 0) //if in poly and no other poly selected then
              begin
                if (firstClicked = 0) then
                  begin
                    firstClicked := i;
                  end;
                  //not selected and after selected
                  if (foundSelected > 0) and (vertexList[i].vertex[1] + vertexList[i].vertex[1] + vertexList[i].vertex[1] < 3) then
                    begin
                      vertexList[i].vertex[1] := 1;
                      vertexList[i].vertex[2] := 1;
                      vertexList[i].vertex[3] := 1;
                      numSelectedPolys := numSelectedPolys + 1;
                      setlength(selectedPolys, numSelectedPolys);
                      selectedPolys[numSelectedPolys] := i;
                      addPoly := 1;
                      //not selected, not found
                    end
                  else
                    if (vertexList[i].vertex[1] + vertexList[i].vertex[1] + vertexList[i].vertex[1] < 3) then
                    else
                    begin
                      foundSelected := i;
                      vertexList[i].vertex[1] := 0;
                      vertexList[i].vertex[2] := 0;
                      vertexList[i].vertex[3] := 0;
                    end;
                  end
                else
                begin
                  vertexList[i].vertex[1] := 0;
                  vertexList[i].vertex[2] := 0;
                  vertexList[i].vertex[3] := 0;
                end;
              end;
            end;
            if (addPoly = 0) and (firstClicked > 0) then
              begin
                vertexList[firstClicked].vertex[1] := 1;
                vertexList[firstClicked].vertex[2] := 1;
                vertexList[firstClicked].vertex[3] := 1;
                numSelectedPolys := numSelectedPolys + 1;
                setlength(selectedPolys, numSelectedPolys);
                selectedPolys[numSelectedPolys] := firstClicked;
                addPoly := 1;
              end;
              if showScenery and (addPoly = 0) then
                begin
                  for i := 1 to sceneryCount do
                  begin
                    Scenery[i].selected := 0;
                    if showWireframe or (((Scenery[i].level = 0) and sslBack) or ((Scenery[i].level = 1) and sslMid) or ((Scenery[i].level = 2) and sslFront)) then
                      begin
                        if PointInProp(X, Y, i) and (addPoly = 0) then
                          begin
                            Scenery[i].selected := 1;
                            numSelectedScenery := numSelectedScenery + 1;
                            addPoly := 1;
                          end;
                        end;
                      end;
                    end
                  else
                  begin
                    for i := 1 to sceneryCount do
                    begin
                      Scenery[i].selected := 0;
                    end;
                  end;
                  if showObjects then
                    begin
                      for i := 1 to spawnPoints do
                      begin
                        Spawns[i].active := 0;
                      end;
                      numSelSpawns := 0;
                      for i := 1 to colliderCount do
                      begin
                        Colliders[i].active := 0;
                      end;
                      numSelColliders := 0;
                    end;
                    if showLights then
                      begin
                        for i := 1 to lightCount do
                        begin
                          Lights[i].selected := 0;
                        end;
                        numSelLights := 0;
                      end;
                      if showWaypoints then
                        begin
                          for i := 1 to waypointCount do
                          begin
                            if (frmWaypoints.showPaths = Waypoints[i].pathNum) or (frmWaypoints.showPaths = 0) then
                              begin
                                Waypoints[i].selected := false;
                              end;
                            end;
                            numSelWaypoints := 0;
                          end;
                        end
                      else
                        if (currentFunction = TOOL_PSELADD) //add polys then
                          begin
                            addPoly := 0;
                            if showPolys or showWireframe or showPoints then
                              begin
                                for i := 1 to polyCount do
                                begin
                                  if pointInPoly(X, Y, i) and (vertexList[i].vertex[1] = 0) and (addPoly = 0) //if in poly and not already selected then
                                    begin
                                      numSelectedPolys := numSelectedPolys + 1;
                                      setlength(selectedPolys, numSelectedPolys);
                                      selectedPolys[numSelectedPolys] := i;
                                      vertexList[i].vertex[1] := 1;
                                      vertexList[i].vertex[2] := 1;
                                      vertexList[i].vertex[3] := 1;
                                      addPoly := 1;
                                    end;
                                  end;
                                end;
                                if showScenery and (addPoly = 0) then
                                  begin
                                    for i := 1 to sceneryCount do
                                    begin
                                      if (Scenery[i].selected = 0) and (addPoly = 0) then
                                        begin
                                          if PointInProp(X, Y, i) then
                                            begin
                                              Scenery[i].selected := 1;
                                              numSelectedScenery := numSelectedScenery + 1;
                                              addPoly := 1;
                                            end;
                                          end;
                                        end;
                                      end;
                                    end
                                  else
                                    if (currentFunction = TOOL_PSELSUB) //subtract polys then
                                      begin
                                        setlength(selectedPolys, 1);
                                        numSelectedPolys := 0;
                                        if showPolys or showWireframe or showPoints then
                                          begin
                                            for i := 1 to polyCount do
                                            begin
                                              if (vertexList[i].vertex[1] = 1) //if poly already selected then
                                                begin
                                                  if (pointInPoly(X, Y, i)) and (addPoly = 0) //if poly clicked then
                                                    begin
                                                      vertexList[i].vertex[1] := 0;
                                                      vertexList[i].vertex[2] := 0;
                                                      vertexList[i].vertex[3] := 0;
                                                      addPoly := 1;
                                                    end
                                                  else
                                                  begin
                                                    numSelectedPolys := numSelectedPolys + 1;
                                                    setlength(selectedPolys, numSelectedPolys);
                                                    selectedPolys[numSelectedPolys] := i;
                                                  end;
                                                end;
                                              end;
                                            end;
                                            if showScenery and (addPoly = 0) then
                                              begin
                                                for i := 1 to sceneryCount do
                                                begin
                                                  if (Scenery[i].selected = 1) and (addPoly = 0) then
                                                    begin
                                                      if PointInProp(X, Y, i) then
                                                        begin
                                                          Scenery[i].selected := 0;
                                                          numSelectedScenery := numSelectedScenery - 1;
                                                          addPoly := 1;
                                                        end;
                                                      end;
                                                    end;
                                                  end;
                                                end;
                                                getRCenter;
                                                getInfo;
                                                selectionChanged := true;
                                                Render;
                                              end;

function TfrmSoldatMapEditor.PointInProp(X: Single; Y: Single; var Index: Smallint): Boolean;
var
  xDiff: Longint;
  yDiff: Longint;
  theta: Single;
  R: Single;
  label
  ErrorHandler;
  begin
    //ON ERROR
    result := false;
    xDiff := (X - Scenery[Index].screenTr.X);
    yDiff := (Y - Scenery[Index].screenTr.Y);
    R := Sqr(sqr(xDiff) + sqr(yDiff)); //distance of point from scenery rotation center
    if (xDiff = 0) then
      begin
        if (yDiff > 0) then
          begin
            theta := pi / 2 + Scenery[Index].rotation;
          end
        else
        begin
          theta := 3 * pi / 2 + Scenery[Index].rotation;
        end;
      end
    else
      if (xDiff > 0) then
        begin
          theta := Atn(yDiff / xDiff) + Scenery[Index].rotation;
        end
      else
        if (xDiff < 0) then
          begin
            theta := pi + Atn(yDiff / xDiff) + Scenery[Index].rotation;
          end;
          X := R * Cos(theta);
          Y := R * Sin(theta);
          if isBetween(0, X, SceneryTextures[Scenery[Index].Style].Width * Scenery[Index].Scaling.X * zoomFactor) then
            begin
              if isBetween(0, Y, SceneryTextures[Scenery[Index].Style].Height * Scenery[Index].Scaling.Y * zoomFactor) then
                begin
                  result := true;
                end;
              end;
              Exit;
              ErrorHandler:
                Application.MessageBox(pchar('Error selecting scenery' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
            end;

procedure TfrmSoldatMapEditor.ColourFill(var X: Single; var Y: Single);
var
  i: Smallint;
  j: Smallint;
  PolyNum: Smallint;
  destClr: TColour;
  polyColoured: Boolean;
begin
  if (numSelectedPolys > 0) or (numSelectedScenery > 0) then
    begin
      if showPolys or showWireframe or showPoints then
        begin
          for i := 1 to numSelectedPolys do
          begin
            PolyNum := selectedPolys[i];
            for j := 1 to 3 do
            begin
              if (vertexList[PolyNum].vertex[j] = 1) then
                begin
                  if selectionChanged then
                    begin
                      SaveUndo;
                      selectionChanged := false;
                    end;
                    destClr := getRGB(Polys[PolyNum].vertex[j].Color);
                    destClr := applyBlend(destClr);
                    Polys[PolyNum].vertex[j].Color := ARGB(getAlpha(Polys[PolyNum].vertex[j].Color), RGB(destClr.blue, destClr.green, destClr.red));
                    vertexList[PolyNum].colour[j].red := destClr.red;
                    vertexList[PolyNum].colour[j].green := destClr.green;
                    vertexList[PolyNum].colour[j].blue := destClr.blue;
                    applyLightsToVert(PolyNum, j);
                    polyColoured := true;
                  end;
                end;
              end;
            end;
            if showScenery then
              begin
                for i := 1 to sceneryCount do
                begin
                  if (Scenery[i].selected = 1) then
                    begin
                      if selectionChanged then
                        begin
                          SaveUndo;
                          selectionChanged := false;
                        end;
                        destClr := getRGB(Scenery[i].Color);
                        destClr := applyBlend(destClr);
                        Scenery[i].Color := ARGB(Scenery[i].alpha, RGB(destClr.blue, destClr.green, destClr.red));
                        polyColoured := true;
                      end;
                    end;
                  end;
                  if polyColoured then
                    begin
                      SaveUndo;
                    end;
                  end
                else
                begin
                  if showPolys or showWireframe or showPoints then
                    begin
                      for i := 1 to polyCount do
                      begin
                        if (pointInPoly(X, Y, i)) then
                          begin
                            for j := 1 to 3 do
                            begin
                              if selectionChanged then
                                begin
                                  SaveUndo;
                                  selectionChanged := false;
                                end;
                                destClr := getRGB(Polys[i].vertex[j].Color); //get clr of poly
                                destClr := applyBlend(destClr);
                                Polys[i].vertex[j].Color := ARGB(getAlpha(Polys[i].vertex[j].Color), RGB(destClr.blue, destClr.green, destClr.red));
                                vertexList[i].colour[j].red := destClr.red;
                                vertexList[i].colour[j].green := destClr.green;
                                vertexList[i].colour[j].blue := destClr.blue;
                                applyLightsToVert(i, j);
                                polyColoured := true;
                              end;
                            end;
                          end;
                        end;
                        if not polyColoured and showScenery then
                          begin
                            for i := 1 to sceneryCount do
                            begin
                              if PointInProp(X, Y, i) then
                                begin
                                  if selectionChanged then
                                    begin
                                      SaveUndo;
                                      selectionChanged := false;
                                    end;
                                    destClr := getRGB(Scenery[i].Color);
                                    destClr := applyBlend(destClr);
                                    Scenery[i].Color := ARGB(Scenery[i].alpha, RGB(destClr.blue, destClr.green, destClr.red));
                                    polyColoured := true;
                                  end;
                                end;
                              end;
                              if polyColoured then
                                begin
                                  SaveUndo;
                                end;
                              end;
                              prompt := true;
                              Render;
                            end;

function TfrmSoldatMapEditor.applyBlend(var dClr: TColour): TColour;
begin
  if (blendMode = 0) //normal then
    begin
      result.red := polyClr.red * opacity + dClr.red * (1 - opacity);
      result.green := polyClr.green * opacity + dClr.green * (1 - opacity);
      result.blue := polyClr.blue * opacity + dClr.blue * (1 - opacity);
    end
  else
    if (blendMode = 1) //multiply then
      begin
        result.red := (dClr.red / 255 * polyClr.red) * opacity + dClr.red * (1 - opacity);
        result.green := (dClr.green / 255 * polyClr.green) * opacity + dClr.green * (1 - opacity);
        result.blue := (dClr.blue / 255 * polyClr.blue) * opacity + dClr.blue * (1 - opacity);
      end
    else
      if (blendMode = 2) //screen then
        begin
          result.red := (dClr.red - dClr.red / 255 * polyClr.red + polyClr.red) * opacity + dClr.red * (1 - opacity);
          result.green := (dClr.green - dClr.green / 255 * polyClr.green + polyClr.green) * opacity + dClr.green * (1 - opacity);
          result.blue := (dClr.blue - dClr.blue / 255 * polyClr.blue + polyClr.blue) * opacity + dClr.blue * (1 - opacity);
        end
      else
        if (blendMode = 3) //AND 'darken then
          begin
            result.red := lowerVal(dClr.red, polyClr.red) * opacity + dClr.red * (1 - opacity);
            result.green := lowerVal(dClr.green, polyClr.green) * opacity + dClr.green * (1 - opacity);
            result.blue := lowerVal(dClr.blue, polyClr.blue) * opacity + dClr.blue * (1 - opacity);
          end
        else
          if (blendMode = 4) //OR 'lighten then
            begin
              result.red := higherVal(dClr.red, polyClr.red) * opacity + dClr.red * (1 - opacity);
              result.green := higherVal(dClr.green, polyClr.green) * opacity + dClr.green * (1 - opacity);
              result.blue := higherVal(dClr.blue, polyClr.blue) * opacity + dClr.blue * (1 - opacity);
            end
          else
            if (blendMode = 5) //XOR 'difference then
              begin
                result.red := diffVal(dClr.red, polyClr.red) * opacity + dClr.red * (1 - opacity);
                result.green := diffVal(dClr.green, polyClr.green) * opacity + dClr.green * (1 - opacity);
                result.blue := diffVal(dClr.blue, polyClr.blue) * opacity + dClr.blue * (1 - opacity);
              end
            else
            begin
              result.red := 0;
              result.green := 0;
              result.blue := 0;
            end;
          end;

function TfrmSoldatMapEditor.diffVal(var val1: Byte; var val2: Byte): Byte;
begin
  if (val1 > val2) then
    begin
      result := val1 - val2;
    end
  else
  begin
    result := val2 - val1;
  end;
end;

function TfrmSoldatMapEditor.lowerVal(var val1: Byte; var val2: Byte): Byte;
begin
  if (val1 < val2) then
    begin
      result := val1;
    end
  else
  begin
    result := val2;
  end;
end;

function TfrmSoldatMapEditor.higherVal(var val1: Byte; var val2: Byte): Byte;
begin
  if (val1 > val2) then
    begin
      result := val1;
    end
  else
  begin
    result := val2;
  end;
end;

function TfrmSoldatMapEditor.snapVertexToGrid(coord: Single; var offset: Single): Single;
var
  target: Single;
begin
  offset := (inc * zoomFactor) - offset;
  target := (Floor(coord / (inc * zoomFactor)) * (inc * zoomFactor) + offset);
  if (target > coord) then
    begin
      target := target - inc * zoomFactor;
    end;
    if ((coord - target) < ((inc * zoomFactor) / 2)) then
      begin
        result := target;
      end
    else
    begin
      result := target + inc * zoomFactor;
    end;
  end;

procedure TfrmSoldatMapEditor.deletePolys;
var
  i: Smallint;
  j: Smallint;
  offset: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    if selectionChanged then
      begin
        SaveUndo;
        selectionChanged := false;
      end;
      prompt := true;
      if (numSelectedScenery > 0) then
        begin
          offset := 1;
          for i := 1 to sceneryCount do
          begin
            Scenery[offset] := Scenery[i];
            if (Scenery[i].selected = 1) //scenery selected then
              begin
                sceneryCount := sceneryCount - 1;
              end
            else
            begin
              offset := offset + 1;
            end;
          end;
          setlength(Scenery, sceneryCount);
        end;
        if (numSelSpawns > 0) then
          begin
            offset := 1;
            for i := 1 to spawnPoints do
            begin
              Spawns[offset] := Spawns[i];
              if (Spawns[i].active = 1) then
                begin
                  spawnPoints := spawnPoints - 1;
                end
              else
              begin
                offset := offset + 1;
              end;
            end;
            setlength(Spawns, spawnPoints);
          end;
          if (numSelColliders > 0) then
            begin
              offset := 1;
              for i := 1 to colliderCount do
              begin
                Colliders[offset] := Colliders[i];
                if (Colliders[i].active = 1) //scenery selected then
                  begin
                    colliderCount := colliderCount - 1;
                  end
                else
                begin
                  offset := offset + 1;
                end;
              end;
              setlength(Colliders, colliderCount);
            end;
            if (numSelWaypoints > 0) then
              begin
                currentWaypoint := 0;
                offset := 1;
                for i := 1 to waypointCount do
                begin
                  Waypoints[i].tempIndex := Waypoints[offset].tempIndex;
                  Waypoints[offset] := Waypoints[i];
                  if Waypoints[i].selected then
                    begin
                      waypointCount := waypointCount - 1;
                      Waypoints[i].tempIndex := -1;
                    end
                  else
                  begin
                    Waypoints[i].tempIndex := offset;
                    offset := offset + 1;
                  end;
                end;
                offset := 1;
                for i := 1 to conCount do
                begin
                  Connections[offset] := Connections[i];
                  if (Waypoints[Connections[i].point1].tempIndex < 0) or (Waypoints[Connections[i].point2].tempIndex < 0) then
                    begin
                      conCount := conCount - 1;
                    end
                  else
                  begin
                    Connections[offset].point1 := Waypoints[Connections[offset].point1].tempIndex;
                    Connections[offset].point2 := Waypoints[Connections[offset].point2].tempIndex;
                    offset := offset + 1;
                  end;
                end;
                for i := 1 to waypointCount do
                begin
                  Waypoints[i].tempIndex := i;
                  Waypoints[i].numConnections := 0;
                end;
                setlength(Waypoints, waypointCount);
                setlength(Connections, conCount);
                for i := 1 to conCount do
                begin
                  Waypoints[Connections[i].point1].numConnections := Waypoints[Connections[i].point1].numConnections + 1;
                end;
              end;
              if (numSelLights > 0) then
                begin
                  offset := 1;
                  for i := 1 to lightCount do
                  begin
                    Lights[offset] := Lights[i];
                    if (Lights[i].selected = 1) then
                      begin
                        lightCount := lightCount - 1;
                      end
                    else
                    begin
                      offset := offset + 1;
                    end;
                  end;
                  setlength(Lights, lightCount);
                  if (lightCount > 0) then
                    begin
                      applyLights;
                    end
                  else
                    if (lightCount = 0) then
                      begin
                        for i := 1 to polyCount do
                        begin
                          for j := 1 to 3 do
                          begin
                            Polys[i].vertex[j].Color := ARGB(getAlpha(Polys[i].vertex[j].Color), RGB(vertexList[i].colour[j].blue, vertexList[i].colour[j].green, vertexList[i].colour[j].red));
                          end;
                        end;
                      end;
                    end;
                    numSelectedScenery := 0;
                    numSelSpawns := 0;
                    numSelColliders := 0;
                    numSelWaypoints := 0;
                    numSelLights := 0;
                    if (numSelectedPolys > 0) //delete polys then
                      begin
                        numSelectedPolys := 0;
                        setlength(selectedPolys, 0);
                        offset := 1;
                        for i := 1 to polyCount do
                        begin
                          Polys[offset] := Polys[i];
                          PolyCoords[offset] := PolyCoords[i];
                          vertexList[offset] := vertexList[i];
                          if ((vertexList[i].vertex[1] + vertexList[i].vertex[2] + vertexList[i].vertex[3]) = 3) //poly selected then
                            begin
                              vertexList[offset].vertex[1] := 0;
                              vertexList[offset].vertex[2] := 0;
                              vertexList[offset].vertex[3] := 0;
                              polyCount := polyCount - 1;
                            end
                          else
                            if ((vertexList[i].vertex[1] + vertexList[i].vertex[2] + vertexList[i].vertex[3]) > 0) //vertices selected then
                              begin
                                numSelectedPolys := numSelectedPolys + 1;
                                setlength(selectedPolys, numSelectedPolys);
                                selectedPolys[numSelectedPolys] := offset;
                                offset := offset + 1;
                              end
                            else
                            begin
                              offset := offset + 1;
                            end;
                          end;
                          setlength(Polys, polyCount);
                          setlength(PolyCoords, polyCount);
                          setlength(vertexList, polyCount);
                        end;
                        setMapData;
                        SaveUndo;
                        Render;
                        getInfo;
                        Exit;
                        ErrorHandler:
                          Application.MessageBox(pchar('Error deleting' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
                      end;

function TfrmSoldatMapEditor.nearCoord(mouseCoord: Single; polyCoord: Single; range: Single): Boolean;
begin
  if (mouseCoord <= (polyCoord + range)) and (mouseCoord >= (polyCoord - range)) then
    begin
      result := true;
    end;
  end;

function TfrmSoldatMapEditor.inSelRect(X: Single; Y: Single): Boolean;
begin
  if ((X > selectedCoords[1].X) and (X < selectedCoords[2].X)) or ((X > selectedCoords[2].X) and (X < selectedCoords[1].X)) then
    begin
      if ((Y > selectedCoords[1].Y) and (Y < selectedCoords[2].Y)) or ((Y > selectedCoords[2].Y) and (Y < selectedCoords[1].Y)) then
        begin
          result := true;
        end;
      end;
    end;

procedure TfrmSoldatMapEditor.mnuClrSketch_Click;
begin
  sketchLines := 0;
  setlength(sketch, 0);
end;

procedure TfrmSoldatMapEditor.mnuCopy_Click;
begin
  savePrefab(appPath + '\Temp\copy.PFB');
end;

procedure TfrmSoldatMapEditor.mnuVSelBringForward_Click;
begin
  mnuBringForward_Click;
end;

procedure TfrmSoldatMapEditor.mnuVSelBringToFront_Click;
begin
  mnuBringToFront_Click;
end;

procedure TfrmSoldatMapEditor.mnuVSelClear_Click;
begin
  mnuClear_Click;
end;

procedure TfrmSoldatMapEditor.mnuVSelCopy_Click;
begin
  mnuCopy_Click;
end;

procedure TfrmSoldatMapEditor.mnuFlip_Click(var Index: Smallint);
var
  i: Smallint;
  j: Smallint;
  PolyNum: Smallint;
  vertSel: Byte;
  temp: D3DVECTOR2;
  tempVertex: TCustomVertex;
  tempClr: TColour;
begin
  if selectionChanged then
    begin
      SaveUndo;
      selectionChanged := false;
    end;
    if (Index = 0) then
      begin
        scaleDiff.X := -1;
      end
    else
      if (Index = 1) then
        begin
          scaleDiff.Y := -1;
        end;
        rCenter.X := selRect[0].X + (selRect[2].X - selRect[0].X) / 2;
        rCenter.Y := selRect[0].Y + (selRect[2].Y - selRect[0].Y) / 2;
        if (numSelectedPolys > 0) then
          begin
            for i := 1 to numSelectedPolys do
            begin
              PolyNum := selectedPolys[i];
              for j := 1 to 3 do
              begin
                if (vertexList[PolyNum].vertex[j] = 1) then
                  begin
                    PolyCoords[PolyNum].vertex[j].X := (rCenter.X + (PolyCoords[PolyNum].vertex[j].X - rCenter.X) * scaleDiff.X);
                    PolyCoords[PolyNum].vertex[j].Y := (rCenter.Y + (PolyCoords[PolyNum].vertex[j].Y - rCenter.Y) * scaleDiff.Y);
                    Polys[PolyNum].vertex[j].X := (PolyCoords[PolyNum].vertex[j].X - scrollCoords[2].X) * zoomFactor;
                    Polys[PolyNum].vertex[j].Y := (PolyCoords[PolyNum].vertex[j].Y - scrollCoords[2].Y) * zoomFactor;
                  end;
                end;
                //make sure polys are cw
                if not isCW(PolyNum) //switch to make cw then
                  begin
                    temp := PolyCoords[PolyNum].vertex[3];
                    PolyCoords[PolyNum].vertex[3] := PolyCoords[PolyNum].vertex[2];
                    PolyCoords[PolyNum].vertex[2] := temp;
                    tempVertex := Polys[PolyNum].vertex[3];
                    Polys[PolyNum].vertex[3] := Polys[PolyNum].vertex[2];
                    Polys[PolyNum].vertex[2] := tempVertex;
                    vertSel := vertexList[PolyNum].vertex[3];
                    vertexList[PolyNum].vertex[3] := vertexList[PolyNum].vertex[2];
                    vertexList[PolyNum].vertex[2] := vertSel;
                    tempClr := vertexList[PolyNum].colour[3];
                    vertexList[PolyNum].colour[3] := vertexList[PolyNum].colour[2];
                    vertexList[PolyNum].colour[2] := tempClr;
                  end;
                end;
              end;
              if (numSelectedScenery > 0) then
                begin
                  for i := 1 to sceneryCount do
                  begin
                    if (Scenery[i].selected = 1) then
                      begin
                        if (scaleDiff.X * scaleDiff.Y < 0) then
                          begin
                            Scenery[i].rotation := -Scenery[i].rotation;
                          end
                        else
                        begin
                          Scenery[i].rotation := Scenery[i].rotation;
                        end;
                        Scenery[i].Translation.X := rCenter.X + (Scenery[i].Translation.X - rCenter.X) * scaleDiff.X;
                        Scenery[i].Translation.Y := rCenter.Y + (Scenery[i].Translation.Y - rCenter.Y) * scaleDiff.Y;
                        Scenery[i].screenTr.X := (Scenery[i].Translation.X - scrollCoords[2].X) * zoomFactor;
                        Scenery[i].screenTr.Y := (Scenery[i].Translation.Y - scrollCoords[2].Y) * zoomFactor;
                        Scenery[i].Scaling.X := Scenery[i].Scaling.X * scaleDiff.X;
                        Scenery[i].Scaling.Y := Scenery[i].Scaling.Y * scaleDiff.Y;
                      end;
                    end;
                  end;
                  if (numSelWaypoints > 0) then
                    begin
                      for i := 1 to waypointCount do
                      begin
                        if Waypoints[i].selected then
                          begin
                            Waypoints[i].X := (rCenter.X + (Waypoints[i].X - rCenter.X) * scaleDiff.X);
                            Waypoints[i].Y := (rCenter.Y + (Waypoints[i].Y - rCenter.Y) * scaleDiff.Y);
                            if Waypoints[i].wayType[0] then
                              begin
                                Waypoints[i].wayType[0] := false;
                                Waypoints[i].wayType[1] := true;
                              end
                            else
                              if Waypoints[i].wayType[1] then
                                begin
                                  Waypoints[i].wayType[0] := true;
                                  Waypoints[i].wayType[1] := false;
                                end;
                              end;
                            end;
                          end;
                          scaleDiff.X := 1;
                          scaleDiff.Y := 1;
                          SaveUndo;
                          Render;
                          getInfo;
                        end;

procedure TfrmSoldatMapEditor.mnuFlipTexture_Click(var Index: Smallint);
var
  i: Smallint;
  j: Smallint;
  PolyNum: Smallint;
  avgMul: Single;
begin
  if selectionChanged then
    begin
      SaveUndo;
      selectionChanged := false;
    end;
    if (Index = 0) then
      begin
        scaleDiff.X := -1;
      end
    else
      if (Index = 1) then
        begin
          scaleDiff.Y := -1;
        end;
        rCenter.X := 0;
        rCenter.Y := 0;
        avgMul := 1;
        if (numSelectedPolys > 0) then
          begin
            for i := 1 to numSelectedPolys do
            begin
              PolyNum := selectedPolys[i];
              for j := 1 to 3 do
              begin
                if (vertexList[PolyNum].vertex[j] = 1) then
                  begin
                    rCenter.X := rCenter.X * (1 - 1 / avgMul) + Polys[PolyNum].vertex[j].tu / avgMul;
                    rCenter.Y := rCenter.Y * (1 - 1 / avgMul) + Polys[PolyNum].vertex[j].tv / avgMul;
                    avgMul := avgMul + 1;
                  end;
                end;
              end;
            end;
            if (numSelectedPolys > 0) then
              begin
                for i := 1 to numSelectedPolys do
                begin
                  PolyNum := selectedPolys[i];
                  for j := 1 to 3 do
                  begin
                    if (vertexList[PolyNum].vertex[j] = 1) then
                      begin
                        Polys[PolyNum].vertex[j].tu := (rCenter.X + (Polys[PolyNum].vertex[j].tu - rCenter.X) * scaleDiff.X);
                        Polys[PolyNum].vertex[j].tv := (rCenter.Y + (Polys[PolyNum].vertex[j].tv - rCenter.Y) * scaleDiff.Y);
                      end;
                    end;
                  end;
                end;
                scaleDiff.X := 1;
                scaleDiff.Y := 1;
                SaveUndo;
                Render;
                getInfo;
              end;

procedure TfrmSoldatMapEditor.mnuInvertSel_Click;
var
  i: Smallint;
  j: Smallint;
  addPoly: Boolean;
begin
  if showPolys or showWireframe or showPoints then
    begin
      numSelectedPolys := 0;
      setlength(selectedPolys, polyCount);
      for i := 1 to polyCount do
      begin
        addPoly := false;
        for j := 1 to 3 do
        begin
          if (vertexList[i].vertex[j] = 0) then
            begin
              vertexList[i].vertex[j] := 1;
            end
          else
          begin
            vertexList[i].vertex[j] := 0;
          end;
          if (vertexList[i].vertex[j] = 1) then
            begin
              addPoly := true;
            end;
          end;
          if addPoly then
            begin
              numSelectedPolys := numSelectedPolys + 1;
              selectedPolys[numSelectedPolys] := i;
            end;
          end;
          setlength(selectedPolys, numSelectedPolys);
        end;
        if showScenery or showWireframe or showPoints then
          begin
            numSelectedScenery := 0;
            for i := 1 to sceneryCount do
            begin
              if ((Scenery[i].level = 0) and sslBack) or ((Scenery[i].level = 1) and sslMid) or ((Scenery[i].level = 2) and sslFront) then
                begin
                  if (Scenery[i].selected = 0) then
                    begin
                      Scenery[i].selected := 1;
                    end
                  else
                  begin
                    Scenery[i].selected := 0;
                  end;
                  if (Scenery[i].selected = 1) then
                    begin
                      numSelectedScenery := numSelectedScenery + 1;
                    end;
                  end;
                end;
              end;
              if showObjects then
                begin
                  numSelSpawns := 0;
                  for i := 1 to spawnPoints do
                  begin
                    if (Spawns[i].active = 0) then
                      begin
                        Spawns[i].active := 1;
                      end
                    else
                    begin
                      Spawns[i].active := 0;
                    end;
                    if (Spawns[i].active = 1) then
                      begin
                        numSelSpawns := numSelSpawns + 1;
                      end;
                    end;
                    numSelColliders := 0;
                    for i := 1 to colliderCount do
                    begin
                      if (Colliders[i].active = 0) then
                        begin
                          Colliders[i].active := 1;
                        end
                      else
                      begin
                        Colliders[i].active := 0;
                      end;
                      if Colliders[i].active then
                        begin
                          numSelColliders := numSelColliders + 1;
                        end;
                      end;
                    end;
                    if showLights then
                      begin
                        numSelLights := 0;
                        for i := 1 to lightCount do
                        begin
                          if (Lights[i].selected = 0) then
                            begin
                              Lights[i].selected := 1;
                            end
                          else
                          begin
                            Lights[i].selected := 0;
                          end;
                          if Lights[i].selected then
                            begin
                              numSelLights := numSelLights + 1;
                            end;
                          end;
                        end;
                        if showWaypoints then
                          begin
                            numSelWaypoints := 0;
                            for i := 1 to waypointCount do
                            begin
                              Waypoints[i].selected := not Waypoints[i].selected;
                              if Waypoints[i].selected then
                                begin
                                  numSelWaypoints := numSelWaypoints + 1;
                                end;
                              end;
                            end;
                            getRCenter;
                            getInfo;
                            Render;
                          end;

procedure TfrmSoldatMapEditor.mnuPaste_Click;
label
ErrorHandler;
begin
  //ON ERROR
  if ((GetAttr(appPath + '\Temp\copy.PFB') and vbDirectory) = 0) then
    begin
      loadPrefab(appPath + '\Temp\copy.PFB');
    end;
    ErrorHandler:
      end;

procedure TfrmSoldatMapEditor.mnuRecent_Click(var Index: Smallint);
var
  i: Smallint;
  Result: integer;
  FileName: widestring;
begin
  FileName := mnuRecent(Index).Caption;
  if (length(Dir(FileName)) <> 0) and (FileName <> '') then
    begin
      if prompt then
        begin
          Result := Application.MessageBox(pchar('Save changes to ' + currentFileName + '?'), pchar(''), vbYesNoCancel) {HelpFile:None, Context:None};
          Application.ProcessMessages;
          if (Result = vbCancel) then
            begin
              Exit;
            end
          else
            if (Result = vbYes) then
              begin
                mnuSave_Click;
                if prompt then
                  begin
                    Exit;
                  end;
                end;
              end;
              Application.ProcessMessages;
              LoadFile(FileName);
              for i := Index downto 1 do
              begin
                mnuRecent(i).Caption := mnuRecent(i - 1).Caption;
              end;
              mnuRecent(0).Caption := FileName;
            end
          else
            if (length(Dir(FileName)) = 0) then
              begin
                Application.MessageBox(pchar('File not found: ' + FileName), pchar(''), MB_OK) {HelpFile:None, Context:None};
              end;
            end;

            //put in recent files if it isn't already
procedure TfrmSoldatMapEditor.updateRecent(var FileName: widestring);
var
  i: Smallint;
begin
  mnuRecentFiles.Enabled := true;
  for i := 9 downto 1 do
  begin
    mnuRecent(i).Caption := mnuRecent(i - 1).Caption;
    if (mnuRecent(i).Caption = '') then
      begin
        mnuRecent(i).Visible := false;
      end
    else
    begin
      mnuRecent(i).Visible := true;
    end;
  end;
  mnuRecent(0).Caption := FileName;
end;

procedure TfrmSoldatMapEditor.mnuResetView_Click;
begin
  zoomFactor := 1;
  scrollCoords[2].X := -ScaleWidth / 2;
  scrollCoords[2].Y := -ScaleHeight / 2;
  Zoom(1);
  Render;
end;

procedure TfrmSoldatMapEditor.mnuRotate_Click(var Index: Smallint);
var
  R: Single;
  theta: Single;
  xDiff: Single;
  yDiff: Single;
  i: Smallint;
  j: Smallint;
  PolyNum: Smallint;
begin
  if selectionChanged then
    begin
      SaveUndo;
      selectionChanged := false;
    end;
    if (Index = 0) then
      begin
        rDiff := pi;
      end
    else
      if (Index = 1) then
        begin
          rDiff := pi / 2;
        end
      else
        if (Index = 2) then
          begin
            rDiff := 3 * pi / 2;
          end;
          rCenter.X := selRect[0].X + (selRect[2].X - selRect[0].X) / 2;
          rCenter.Y := selRect[0].Y + (selRect[2].Y - selRect[0].Y) / 2;
          if (numSelectedPolys > 0) then
            begin
              for i := 1 to numSelectedPolys do
              begin
                PolyNum := selectedPolys[i];
                for j := 1 to 3 do
                begin
                  if (vertexList[PolyNum].vertex[j] = 1) then
                    begin
                      xDiff := (PolyCoords[PolyNum].vertex[j].X - rCenter.X);
                      yDiff := (PolyCoords[PolyNum].vertex[j].Y - rCenter.Y);
                      R := Sqr(sqr(xDiff) + sqr(yDiff)); //distance of point from rotation center
                      if (xDiff = 0) then
                        begin
                          if (yDiff > 0) then
                            begin
                              theta := pi / 2;
                            end
                          else
                          begin
                            theta := 3 * pi / 2;
                          end;
                        end
                      else
                        if (xDiff > 0) then
                          begin
                            theta := Atn(yDiff / xDiff);
                          end
                        else
                          if (xDiff < 0) then
                            begin
                              theta := pi + Atn(yDiff / xDiff);
                            end;
                            theta := theta + rDiff;
                            PolyCoords[PolyNum].vertex[j].X := rCenter.X + R * Cos(theta);
                            PolyCoords[PolyNum].vertex[j].Y := rCenter.Y + R * Sin(theta);
                            Polys[PolyNum].vertex[j].X := (PolyCoords[PolyNum].vertex[j].X - scrollCoords[2].X) * zoomFactor;
                            Polys[PolyNum].vertex[j].Y := (PolyCoords[PolyNum].vertex[j].Y - scrollCoords[2].Y) * zoomFactor;
                          end;
                        end;
                      end;
                    end;
                    if (numSelectedScenery > 0) then
                      begin
                        for i := 1 to sceneryCount do
                        begin
                          if (Scenery[i].selected = 1) then
                            begin
                              xDiff := (Scenery[i].Translation.X - rCenter.X);
                              yDiff := (Scenery[i].Translation.Y - rCenter.Y);
                              R := Sqr(sqr(xDiff) + sqr(yDiff)); //distance of point from rotation center
                              if (xDiff = 0) then
                                begin
                                  if (yDiff > 0) then
                                    begin
                                      theta := pi / 2;
                                    end
                                  else
                                  begin
                                    theta := 3 * pi / 2;
                                  end;
                                end
                              else
                                if (xDiff > 0) then
                                  begin
                                    theta := Atn(yDiff / xDiff);
                                  end
                                else
                                  if (xDiff < 0) then
                                    begin
                                      theta := pi + Atn(yDiff / xDiff);
                                    end;
                                    theta := theta + rDiff;
                                    Scenery[i].Translation.X := rCenter.X + R * Cos(theta);
                                    Scenery[i].Translation.Y := rCenter.Y + R * Sin(theta);
                                    Scenery[i].screenTr.X := (Scenery[i].Translation.X - scrollCoords[2].X) * zoomFactor;
                                    Scenery[i].screenTr.Y := (Scenery[i].Translation.Y - scrollCoords[2].Y) * zoomFactor;
                                    if (scaleDiff.X * scaleDiff.Y < 0) then
                                      begin
                                        Scenery[i].rotation := -(Scenery[i].rotation - rDiff);
                                      end
                                    else
                                    begin
                                      Scenery[i].rotation := (Scenery[i].rotation - rDiff);
                                    end;
                                  end;
                                end;
                              end;
                              rCenter.X := selRect[0].X;
                              rCenter.Y := selRect[0].Y;
                              rDiff := 0;
                              getRCenter;
                              getInfo;
                              SaveUndo;
                              Render;
                            end;

procedure TfrmSoldatMapEditor.mnuRotateTexture_Click(var Index: Smallint);
var
  R: Single;
  theta: Single;
  xDiff: Single;
  yDiff: Single;
  i: Smallint;
  j: Smallint;
  PolyNum: Smallint;
  avgMul: Single;
  texRate: Single;
begin
  if selectionChanged then
    begin
      SaveUndo;
      selectionChanged := false;
    end;
    if (Index = 0) then
      begin
        rDiff := pi;
      end
    else
      if (Index = 2) then
        begin
          rDiff := pi / 2;
        end
      else
        if (Index = 1) then
          begin
            rDiff := 3 * pi / 2;
          end;
          texRate := VarAsType(xTexture, varSingle) / VarAsType(yTexture, varSingle);
          rCenter.X := 0;
          rCenter.Y := 0;
          avgMul := 1;
          if (numSelectedPolys > 0) then
            begin
              for i := 1 to numSelectedPolys do
              begin
                PolyNum := selectedPolys[i];
                for j := 1 to 3 do
                begin
                  if (vertexList[PolyNum].vertex[j] = 1) then
                    begin
                      rCenter.X := rCenter.X * (1 - 1 / avgMul) + Polys[PolyNum].vertex[j].tu * texRate / avgMul;
                      rCenter.Y := rCenter.Y * (1 - 1 / avgMul) + Polys[PolyNum].vertex[j].tv / avgMul;
                      avgMul := avgMul + 1;
                    end;
                  end;
                end;
              end;
              if (numSelectedPolys > 0) then
                begin
                  for i := 1 to numSelectedPolys do
                  begin
                    PolyNum := selectedPolys[i];
                    for j := 1 to 3 do
                    begin
                      if (vertexList[PolyNum].vertex[j] = 1) then
                        begin
                          xDiff := (Polys[PolyNum].vertex[j].tu * texRate - rCenter.X);
                          yDiff := (Polys[PolyNum].vertex[j].tv - rCenter.Y);
                          R := Sqr(sqr(xDiff) + sqr(yDiff)); //distance of point from rotation center
                          if (xDiff = 0) then
                            begin
                              if (yDiff > 0) then
                                begin
                                  theta := pi / 2;
                                end
                              else
                              begin
                                theta := 3 * pi / 2;
                              end;
                            end
                          else
                            if (xDiff > 0) then
                              begin
                                theta := Atn(yDiff / xDiff);
                              end
                            else
                              if (xDiff < 0) then
                                begin
                                  theta := pi + Atn(yDiff / xDiff);
                                end;
                                theta := theta + rDiff;
                                Polys[PolyNum].vertex[j].tu := (rCenter.X + R * Cos(theta)) / texRate;
                                Polys[PolyNum].vertex[j].tv := rCenter.Y + R * Sin(theta);
                              end;
                            end;
                          end;
                        end;
                        rCenter.X := selRect[0].X;
                        rCenter.Y := selRect[0].Y;
                        rDiff := 0;
                        getRCenter;
                        getInfo;
                        SaveUndo;
                        Render;
                      end;

procedure TfrmSoldatMapEditor.mnuSetRCenter_Click;
begin
  mnuFixedRCenter.Checked := false;
  mnuSetRCenter.Checked := true;
  mnuCenterRCenter.Checked := false;
  rCenter.X := mouseCoords.X / zoomFactor + scrollCoords[2].X;
  rCenter.Y := mouseCoords.Y / zoomFactor + scrollCoords[2].Y;
end;

procedure TfrmSoldatMapEditor.mnuFixedRCenter_Click;
begin
  mnuFixedRCenter.Checked := true;
  mnuSetRCenter.Checked := false;
  mnuCenterRCenter.Checked := false;
  rCenter.X := Midpoint(selRect[0].X, selRect[2].X);
  rCenter.Y := Midpoint(selRect[0].Y, selRect[2].Y);
end;

procedure TfrmSoldatMapEditor.mnuCenterRCenter_Click;
begin
  mnuFixedRCenter.Checked := false;
  mnuSetRCenter.Checked := false;
  mnuCenterRCenter.Checked := true;
  rCenter.X := Midpoint(selRect[0].X, selRect[2].X);
  rCenter.Y := Midpoint(selRect[0].Y, selRect[2].Y);
end;

procedure TfrmSoldatMapEditor.mnuShowSceneryLayer_Click(var Index: Smallint);
begin
  mnuShowSceneryLayer(Index).Checked := not mnuShowSceneryLayer(Index).Checked;
  if (Index = 0) then
    begin
      sslBack := mnuShowSceneryLayer(0).Checked;
    end
  else
    if (Index = 1) then
      begin
        sslMid := mnuShowSceneryLayer(1).Checked;
      end
    else
      if (Index = 2) then
        begin
          sslFront := mnuShowSceneryLayer(2).Checked;
        end;
      end;

procedure TfrmSoldatMapEditor.mnuSnapSelected_Click;
begin
  SnapSelection;
end;

procedure TfrmSoldatMapEditor.mnuVSelDuplicate_Click;
begin
  mnuDuplicate_Click;
end;

procedure TfrmSoldatMapEditor.mnuVSelFlip_Click(var Index: Smallint);
begin
  mnuFlip_Click(Index);
end;

procedure TfrmSoldatMapEditor.mnuVSelPaste_Click;
begin
  mnuPaste_Click;
end;

procedure TfrmSoldatMapEditor.mnuVSelRotate_Click(var Index: Smallint);
begin
  mnuRotate_Click(Index);
end;

procedure TfrmSoldatMapEditor.mnuVSelSendBackward_Click;
begin
  mnuSendBackward_Click;
end;

procedure TfrmSoldatMapEditor.mnuVSelSendToBack_Click;
begin
  mnuSendToBack_Click;
end;

procedure TfrmSoldatMapEditor.mnuWayType_Click(var Index: Smallint);
var
  i: Smallint;
begin
  mnuWayType(Index).Checked := not mnuWayType(Index).Checked;
  if (Index = 0) then
    begin
      mnuWayType(1).Checked := false;
    end
  else
    if (Index = 1) then
      begin
        mnuWayType(0).Checked := false;
      end
    else
      if (Index = 2) then
        begin
          mnuWayType(3).Checked := false;
        end
      else
        if (Index = 3) then
          begin
            mnuWayType(2).Checked := false;
          end;
          lblCurrentTool.Caption := frmSoldatMapEditor.ImageList.ListImages(currentFunction + 1).Tag;
          for i := 0 to 4 do
          begin
            if mnuWayType(i).Checked then
              begin
                lblCurrentTool.Caption := lblCurrentTool.Caption + ' (' + mnuWayType(i).Caption + ')';
              end;
            end;
          end;

procedure TfrmSoldatMapEditor.tvwScenery_Expand(Node: MSComctlLib.Node);
begin
  if (Node.Key <> 'Master List') and (Node.Key <> 'In Use') and (Node.Key <> '') then
    begin
      mnuScenList.Tag := Node.Key;
      mnuScenList.Caption := 'Add to ' + Node.Key + ' list';
    end;
  end;

procedure TfrmSoldatMapEditor.tvwScenery_MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
begin
  if (Button = 2) then
    begin
      if (tvwScenery.SelectedItem.FirstSibling <> 'In Use') then
        begin
          if (tvwScenery.SelectedItem.Parent.Key = 'Master List') then
            begin
              if (mnuScenList.Tag <> '') then
                begin
                  mnuScenList.Caption := 'Add ' + tvwScenery.SelectedItem.Text + ' to ' + mnuScenList.Tag + ' List';
                  mnuScenList.Enabled := true;
                  mnuScenRemove.Enabled := false;
                  PopupMenu(mnuScenTree);
                end;
              end
            else
              if (tvwScenery.SelectedItem.Parent.Key <> 'In Use') then
                begin
                  mnuScenRemove.Caption := 'Remove ' + tvwScenery.SelectedItem.Text + ' from List';
                  mnuScenList.Enabled := false;
                  mnuScenRemove.Enabled := true;
                  PopupMenu(mnuScenTree);
                end;
              end;
            end;
          end;

procedure TfrmSoldatMapEditor.mnuScenList_Click;
var
  i: Smallint;
  tempNode: Node;
begin
  tvwScenery.Nodes.Add(mnuScenList.Tag, tvwChild, Unassigned, tvwScenery.SelectedItem.Text);
  Assign(file1, appPath + '\lists\' + mnuScenList.Tag + '.txt');
  Rewrite(file1);
  tempNode := tvwScenery.Nodes.Item(mnuScenList.Tag).Child;
  for i := 1 to tvwScenery.Nodes(mnuScenList.Tag).Children do
  begin
    Write(file1, #9, tempNode.Text);
    tempNode := tempNode.Next;
  end;
  CloseFile(file1);
end;

procedure TfrmSoldatMapEditor.mnuScenRemove_Click;
var
  i: Smallint;
  tempNode: Node;
begin
  tvwScenery.Nodes.Remove((tvwScenery.SelectedItem.Index));
  Assign(file1, appPath + '\lists\' + mnuScenList.Tag + '.txt');
  Rewrite(file1);
  tempNode := tvwScenery.Nodes.Item(mnuScenList.Tag).Child;
  for i := 1 to tvwScenery.Nodes(mnuScenList.Tag).Children do
  begin
    Write(file1, #9, tempNode.Text);
    tempNode := tempNode.Next;
  end;
  CloseFile(file1);
end;

procedure TfrmSoldatMapEditor.tvwScenery_NodeClick(Node: MSComctlLib.Node);
var
  i: Smallint;
  isInList: Boolean;
  token: Longint;
  tempNode: Node;
  label
  ErrorHandler;
  begin
    //ON ERROR
    //if there is no parent
    if (tvwScenery.SelectedItem.FirstSibling = 'In Use') then
      begin
        Exit;
      end;
      if (length(Dir(frmSoldatMapEditor.soldatDir + 'Scenery-gfx\' + tvwScenery.SelectedItem.Text)) = 0) then
        begin
          frmScenery.picScenery.Picture := LoadPicture(appPath + '\' + gfxDir + '\notfound.bmp');
          Exit;
        end;
        if (tvwScenery.SelectedItem.Parent.Key = 'In Use') then
          begin
            currentScenery := tvwScenery.SelectedItem.Text;
            token := InitGDIPlus;
            frmScenery.picScenery.Picture := LoadPictureGDIPlus(frmSoldatMapEditor.soldatDir + 'Scenery-gfx\' + currentScenery, Unassigned, Unassigned, RGB(0, 255, 0));
            FreeGDIPlus(token);
            tempNode := tvwScenery.Nodes.Item('In Use').Child;
            for i := 1 to (tvwScenery.Nodes.Item('In Use').Children) do
            begin
              if (currentScenery = tempNode.Text) then
                begin
                  frmSoldatMapEditor.setCurrentScenery(i);
                  frmScenery.lstScenery.ListIndex := i - 1;
                end;
                tempNode := tempNode.Next;
              end;
            end
          else
          begin
            if (length(Dir(frmSoldatMapEditor.soldatDir + 'Scenery-gfx\' + tvwScenery.SelectedItem.Text)) <> 0) then
              begin
                currentScenery := tvwScenery.SelectedItem.Text;
                token := InitGDIPlus;
                frmScenery.picScenery.Picture := LoadPictureGDIPlus(frmSoldatMapEditor.soldatDir + 'Scenery-gfx\' + currentScenery, Unassigned, Unassigned, RGB(0, 255, 0));
                FreeGDIPlus(token);
                //check if already in list
                tempNode := tvwScenery.Nodes.Item('In Use').Child;
                for i := 1 to (tvwScenery.Nodes.Item('In Use').Children) do
                begin
                  if (currentScenery = tempNode.Text) then
                    begin
                      isInList := true;
                      frmSoldatMapEditor.setCurrentScenery(i);
                    end;
                    tempNode := tempNode.Next;
                  end;
                  if not isInList then
                    begin
                      frmSoldatMapEditor.setCurrentTexture(currentScenery);
                    end;
                  end;
                  frmScenery.lstScenery.ListIndex := -1;
                end;
                Exit;
                ErrorHandler:
                  Application.MessageBox(pchar('Error clicking scenery tree' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
              end;

function TfrmSoldatMapEditor.confirmExists(var FileName: widestring): Boolean;
var
  tempNode: Node;
  i: Smallint;
begin
  tempNode := tvwScenery.Nodes.Item('Master List').Child;
  for i := 1 to (tvwScenery.Nodes.Item('Master List').Children) do
  begin
    if (LowerCase(FileName) = LowerCase(tempNode.Text)) then
      begin
        result := true;
      end;
      tempNode := tempNode.Next;
    end;
  end;

procedure TfrmSoldatMapEditor.txtZoom_KeyPress(var KeyAscii: Smallint);
begin
  if (KeyAscii = 13) then
    begin
      KeyAscii := 0;
      picTitle.SetFocus;
    end;
  end;

procedure TfrmSoldatMapEditor.txtZoom_LostFocus;
var
  zoomInput: Single;
begin
  //check if valid value was input
  if (txtZoom.Text = '') then
    begin
      txtZoom.Text := Floor(zoomFactor * 1000 + 0.5) / 10 + '%';
    end
  else
    if IsNumeric(txtZoom.Text) then
      begin
        zoomInput := txtZoom.Text;
      end
    else
      if IsNumeric(Copy(txtZoom.Text, 1, length(txtZoom.Text) - 1)) and (RightStr(txtZoom.Text, 1) = '%') then
        begin
          zoomInput := Copy(txtZoom.Text, 1, length(txtZoom.Text) - 1);
        end
      else
      begin
        txtZoom.Text := Floor(zoomFactor * 1000 + 0.5) / 10 + '%';
      end;
      if ((zoomInput / 100) >= MIN_ZOOM) or ((zoomInput / 100) <= MAX_ZOOM) then
        begin
          Zoom(((zoomInput / 100) / zoomFactor));
          txtZoom.Text := Floor(zoomFactor * 1000 + 0.5) / 10 + '%';
        end
      else
      begin
        txtZoom.Text := Floor(zoomFactor * 1000 + 0.5) / 10 + '%';
      end;
    end;

function TfrmSoldatMapEditor.getZoomDir(var zoomDir: Single): Single;
var
  zoomVal: Single;
  i: Smallint;
begin
  result := zoomDir;
  zoomVal := MIN_ZOOM;
  for i := 1 to 8 do
  begin
    if (zoomDir > 1) //zooming in then
      begin
        if ((zoomFactor) > zoomVal) and ((zoomFactor) < (zoomVal * 2)) then
          begin
            result := (zoomVal * 2) / zoomFactor;
            Break;
          end;
        end
      else
        if (zoomDir < 1) //zooming out then
          begin
            if ((zoomFactor) < zoomVal) and ((zoomFactor) > (zoomVal * 0.5)) then
              begin
                result := (zoomVal * 0.5) / zoomFactor;
                Break;
              end;
            end;
            zoomVal := zoomVal * 2;
          end;
        end;

procedure TfrmSoldatMapEditor.Zoom(var zoomDir: Single);
var
  i: Smallint;
  j: Smallint;
  zoomVal: Single;
begin
  if (zoomFactor * zoomDir < MIN_ZOOM) or (zoomFactor * zoomDir > MAX_ZOOM) then
    begin
      Exit;
    end;
    Scenery[0].screenTr.X := Scenery[0].screenTr.X / zoomFactor + scrollCoords[2].X;
    Scenery[0].screenTr.Y := Scenery[0].screenTr.Y / zoomFactor + scrollCoords[2].Y;
    zoomFactor := zoomFactor * zoomDir;
    if (zoomDir > 1) then
      begin
        //zoom to middle
        scrollCoords[2].X := scrollCoords[2].X + self.ScaleWidth / zoomFactor / (2 / (zoomDir - 1));
        scrollCoords[2].Y := scrollCoords[2].Y + self.ScaleHeight / zoomFactor / (2 / (zoomDir - 1));
      end
    else
      if (zoomDir < 1) then
        begin
          scrollCoords[2].X := scrollCoords[2].X - self.ScaleWidth / zoomFactor / (2 / (1 - zoomDir));
          scrollCoords[2].Y := scrollCoords[2].Y - self.ScaleHeight / zoomFactor / (2 / (1 - zoomDir));
        end;
        for i := 1 to polyCount do
        begin
          for j := 1 to 3 do
          begin
            Polys[i].vertex[j].X := (PolyCoords[i].vertex[j].X - scrollCoords[2].X) * zoomFactor;
            Polys[i].vertex[j].Y := (PolyCoords[i].vertex[j].Y - scrollCoords[2].Y) * zoomFactor;
          end;
        end;
        for i := 1 to sceneryCount do
        begin
          Scenery[i].screenTr.X := (Scenery[i].Translation.X - scrollCoords[2].X) * zoomFactor;
          Scenery[i].screenTr.Y := (Scenery[i].Translation.Y - scrollCoords[2].Y) * zoomFactor;
        end;
        if (numVerts > 0) then
          begin
            for j := 1 to 3 do
            begin
              Polys[polyCount + 1].vertex[j].X := (PolyCoords[polyCount + 1].vertex[j].X - scrollCoords[2].X) * zoomFactor;
              Polys[polyCount + 1].vertex[j].Y := (PolyCoords[polyCount + 1].vertex[j].Y - scrollCoords[2].Y) * zoomFactor;
            end;
          end;
          for i := 1 to 4 do
          begin
            bgPolys[i].X := (bgPolyCoords[i].X - scrollCoords[2].X) * zoomFactor;
            bgPolys[i].Y := (bgPolyCoords[i].Y - scrollCoords[2].Y) * zoomFactor;
          end;
          Scenery[0].screenTr.X := (Scenery[0].screenTr.X - scrollCoords[2].X) * zoomFactor;
          Scenery[0].screenTr.Y := (Scenery[0].screenTr.Y - scrollCoords[2].Y) * zoomFactor;
          selectedCoords[1].X := 0;
          selectedCoords[1].Y := 0;
          selectedCoords[2].X := 0;
          selectedCoords[2].Y := 0;
          txtZoom.Text := Floor(zoomFactor * 1000 + 0.5) / 10 + '%';
          Render;
          if circleOn then
            begin
              Render;
            end;
          end;

procedure TfrmSoldatMapEditor.zoomScroll(var zoomDir: Single; X: Smallint; Y: Smallint);
var
  i: Smallint;
  j: Smallint;
begin
  if (zoomFactor * zoomDir < MIN_ZOOM) and (zoomFactor > MIN_ZOOM) then
    begin
      zoomDir := MIN_ZOOM / zoomFactor;
    end
  else
    if (zoomFactor * zoomDir > MAX_ZOOM) and (zoomFactor < MAX_ZOOM) then
      begin
        zoomDir := MAX_ZOOM / zoomFactor;
      end;
      if (zoomFactor * zoomDir < MIN_ZOOM) or (zoomFactor * zoomDir > MAX_ZOOM) then
        begin
          Exit;
        end;
        Scenery[0].screenTr.X := Scenery[0].screenTr.X / zoomFactor + scrollCoords[2].X;
        Scenery[0].screenTr.Y := Scenery[0].screenTr.Y / zoomFactor + scrollCoords[2].Y;
        selectedCoords[1].X := selectedCoords[1].X / zoomFactor + scrollCoords[2].X;
        selectedCoords[1].Y := selectedCoords[1].Y / zoomFactor + scrollCoords[2].Y;
        zoomFactor := (zoomFactor * zoomDir);
        if (zoomDir > 1) then
          begin
            scrollCoords[2].X := scrollCoords[2].X + X / zoomFactor / ((2 / (zoomDir - 1)) / 2);
            scrollCoords[2].Y := scrollCoords[2].Y + Y / zoomFactor / ((2 / (zoomDir - 1)) / 2);
          end
        else
          if (zoomDir < 1) then
            begin
              scrollCoords[2].X := scrollCoords[2].X - self.ScaleWidth / zoomFactor / (2 / (1 - zoomDir));
              scrollCoords[2].Y := scrollCoords[2].Y - self.ScaleHeight / zoomFactor / (2 / (1 - zoomDir));
            end;
            for i := 1 to polyCount do
            begin
              for j := 1 to 3 do
              begin
                Polys[i].vertex[j].X := (PolyCoords[i].vertex[j].X - scrollCoords[2].X) * zoomFactor;
                Polys[i].vertex[j].Y := (PolyCoords[i].vertex[j].Y - scrollCoords[2].Y) * zoomFactor;
              end;
            end;
            for i := 1 to sceneryCount do
            begin
              Scenery[i].screenTr.X := (Scenery[i].Translation.X - scrollCoords[2].X) * zoomFactor;
              Scenery[i].screenTr.Y := (Scenery[i].Translation.Y - scrollCoords[2].Y) * zoomFactor;
            end;
            if (numVerts > 0) then
              begin
                for j := 1 to 3 do
                begin
                  Polys[polyCount + 1].vertex[j].X := (PolyCoords[polyCount + 1].vertex[j].X - scrollCoords[2].X) * zoomFactor;
                  Polys[polyCount + 1].vertex[j].Y := (PolyCoords[polyCount + 1].vertex[j].Y - scrollCoords[2].Y) * zoomFactor;
                end;
              end;
              for i := 1 to 4 do
              begin
                bgPolys[i].X := (bgPolyCoords[i].X - scrollCoords[2].X) * zoomFactor;
                bgPolys[i].Y := (bgPolyCoords[i].Y - scrollCoords[2].Y) * zoomFactor;
              end;
              Scenery[0].screenTr.X := (Scenery[0].screenTr.X - scrollCoords[2].X) * zoomFactor;
              Scenery[0].screenTr.Y := (Scenery[0].screenTr.Y - scrollCoords[2].Y) * zoomFactor;
              selectedCoords[1].X := (selectedCoords[1].X - scrollCoords[2].X) * zoomFactor;
              selectedCoords[1].Y := (selectedCoords[1].Y - scrollCoords[2].Y) * zoomFactor;
              txtZoom.Text := Floor(zoomFactor * 1000 + 0.5) / 10 + '%';
              Render;
            end;

function TfrmSoldatMapEditor.pointInPoly(X: Single; Y: Single; i: Smallint): Boolean;
var
  xDist: Single;
  yDist: Single;
  xDiff: Single;
  yDiff: Single;
  length: Single;
  D: Single;
begin
  result := true;
  xDist := X - Polys[i].vertex[1].X;
  yDist := Y - Polys[i].vertex[1].Y;
  xDiff := Polys[i].vertex[2].X - Polys[i].vertex[1].X;
  yDiff := Polys[i].vertex[1].Y - Polys[i].vertex[2].Y;
  if (xDiff = 0) and (yDiff = 0) then
    begin
      length := 1;
    end
  else
  begin
    length := Sqr(sqr(xDiff) + sqr(yDiff));
  end;
  D := (yDiff / length) * xDist + (xDiff / length) * yDist;
  if (D < 0) then
    begin
      result := false;
    end;
    xDist := X - Polys[i].vertex[2].X;
    yDist := Y - Polys[i].vertex[2].Y;
    xDiff := Polys[i].vertex[3].X - Polys[i].vertex[2].X;
    yDiff := Polys[i].vertex[2].Y - Polys[i].vertex[3].Y;
    if (xDiff = 0) and (yDiff = 0) then
      begin
        length := 1;
      end
    else
    begin
      length := Sqr(sqr(xDiff) + sqr(yDiff));
    end;
    D := (yDiff / length) * xDist + (xDiff / length) * yDist;
    if (D < 0) then
      begin
        result := false;
      end;
      xDist := X - Polys[i].vertex[3].X;
      yDist := Y - Polys[i].vertex[3].Y;
      xDiff := Polys[i].vertex[1].X - Polys[i].vertex[3].X;
      yDiff := Polys[i].vertex[3].Y - Polys[i].vertex[1].Y;
      if (xDiff = 0) and (yDiff = 0) then
        begin
          length := 1;
        end
      else
      begin
        length := Sqr(sqr(xDiff) + sqr(yDiff));
      end;
      D := (yDiff / length) * xDist + (xDiff / length) * yDist;
      if (D < 0) then
        begin
          result := false;
        end;
      end;

function TfrmSoldatMapEditor.isCW(i: Smallint): Boolean;
var
  xVal: Single;
  yVal: Single;
begin
  xVal := Midpoint(Polys[i].vertex[1].X, Midpoint(Polys[i].vertex[2].X, Polys[i].vertex[3].X));
  yVal := Midpoint(Polys[i].vertex[1].Y, Midpoint(Polys[i].vertex[2].Y, Polys[i].vertex[3].Y));
  result := pointInPoly(xVal, yVal, i);
end;

function TfrmSoldatMapEditor.Midpoint(p1: Single; p2: Single): Single;
begin
  if (p1 < p2) then
    begin
      result := p1 + (p2 - p1) / 2;
    end
  else
  begin
    result := p2 + (p1 - p2) / 2;
  end;
end;

procedure TfrmSoldatMapEditor.setDispOptions(var layerNum: Smallint; var value: Boolean);
begin
  if (layerNum = 0) then
    begin
      showBG := value;
    end
  else
    if (layerNum = 1) then
      begin
        showPolys := value;
      end
    else
      if (layerNum = 2) then
        begin
          showTexture := value;
        end
      else
        if (layerNum = 3) then
          begin
            showWireframe := value;
          end
        else
          if (layerNum = 4) then
            begin
              showPoints := value;
            end
          else
            if (layerNum = 5) then
              begin
                showScenery := value;
              end
            else
              if (layerNum = 6) then
                begin
                  showObjects := value;
                end
              else
                if (layerNum = 7) then
                  begin
                    showWaypoints := value;
                  end
                else
                  if (layerNum = 8) then
                    begin
                      showGrid := value;
                      mnuGrid.Checked := value;
                    end
                  else
                    if (layerNum = 9) then
                      begin
                        showLights := value;
                        setLightsMode(showLights);
                      end
                    else
                      if (layerNum = 10) then
                        begin
                          showSketch := value;
                        end;
                        Render;
                      end;

procedure TfrmSoldatMapEditor.setLightsMode(var lightsOn: Boolean);
var
  i: Smallint;
  j: Smallint;
begin
  if not lightsOn then
    begin
      for i := 1 to polyCount do
      begin
        for j := 1 to 3 do
        begin
          Polys[i].vertex[j].Color := ARGB(getAlpha(Polys[i].vertex[j].Color), RGB(vertexList[i].colour[j].blue, vertexList[i].colour[j].green, vertexList[i].colour[j].red));
        end;
      end;
    end
  else
  begin
    applyLights;
  end;
end;

procedure TfrmSoldatMapEditor.setColourMode(clrVal: Byte);
begin
  colourMode := clrVal;
end;

procedure TfrmSoldatMapEditor.setCurrentTool(Index: Smallint);
var
  i: Smallint;
begin
  currentTool := Index;
  currentFunction := Index;
  if (currentTool = TOOL_CREATE) and mnuQuad.Checked then
    begin
      currentFunction := TOOL_QUAD;
    end
  else
    if (currentTool <> TOOL_SCENERY) then
      begin
        frmSoldatMapEditor.tvwScenery.Visible := false;
      end;
      circleOn := false;
      if (numVerts > 0) and (currentTool <> TOOL_CREATE) //abort poly creation then
        begin
          numVerts := 0;
        end
      else
        if (numCorners > 0) and (currentTool <> TOOL_SCENERY) then
          begin
            numCorners := 0;
          end
        else
          if (currentWaypoint > 0) and (currentTool <> TOOL_WAYPOINT) then
            begin
              currentWaypoint := 0;
            end;
            toolAction := false;
            if (currentTool = TOOL_PSELECT) and (numSelectedPolys > 0) then
              begin
                for i := 1 to numSelectedPolys do
                begin
                  vertexList[selectedPolys[i]].vertex[1] := 1;
                  vertexList[selectedPolys[i]].vertex[2] := 1;
                  vertexList[selectedPolys[i]].vertex[3] := 1;
                end;
                getRCenter;
              end
            else
              if (currentTool = TOOL_MOVE) then
                begin
                  if (numSelectedPolys = 0) and (numSelectedScenery = 1) then
                    begin
                      frmInfo.mnuProp_Click(1);
                    end
                  else
                  begin
                    frmInfo.mnuProp_Click(2);
                  end;
                end
              else
                if (currentTool = TOOL_TEXTURE) then
                  begin
                    frmInfo.mnuProp_Click(3);
                  end
                else
                  if (currentTool = TOOL_VCOLOUR) then
                    begin
                      circleOn := true;
                    end
                  else
                    if (currentTool = TOOL_DEPTHMAP) then
                      begin
                        circleOn := true;
                      end;
                      SetCursor(currentFunction + 1);
                      lblCurrentTool.Caption := frmSoldatMapEditor.ImageList.ListImages(currentFunction + 1).Tag;
                      if (currentTool = TOOL_CREATE) then
                        begin
                          lblCurrentTool.Caption := lblCurrentTool.Caption + ' (' + mnuPolyType(polyType).Caption + ')';
                        end
                      else
                        if (currentTool = TOOL_WAYPOINT) then
                          begin
                            for i := 0 to 4 do
                            begin
                              if mnuWayType(i).Checked then
                                begin
                                  lblCurrentTool.Caption := lblCurrentTool.Caption + ' (' + mnuWayType(i).Caption + ')';
                                end;
                              end;
                            end;
                            Render;
                          end;

function TfrmSoldatMapEditor.setTempTool(var toolNum: Byte): Byte;
begin
  result := currentTool;
  currentTool := toolNum;
end;

procedure TfrmSoldatMapEditor.setMapTexture(var texturePath: widestring);
begin
  mapTexture := D3DX.CreateTextureFromFileEx(D3DDevice, frmSoldatMapEditor.soldatDir + 'textures\' + texturePath, D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_TRIANGLE, D3DX_FILTER_TRIANGLE, ColourKey, imageInfo, 0);
  textureFile := texturePath;
  xTexture := imageInfo.Width;
  yTexture := imageInfo.Height;
  frmInfo.lblDimensions.Caption := 'Dimensions: ' + xTexture + ' x ' + yTexture;
  frmInfo.txtQuadX(0).Text := 0;
  frmInfo.txtQuadY(0).Text := 0;
  frmInfo.txtQuadX(1).Text := xTexture;
  frmInfo.txtQuadY(1).Text := yTexture;
  Render;
end;

//set polyclr when rgb modified
procedure TfrmSoldatMapEditor.setPolyColour(var Index: Smallint; var value: Byte);
begin
  if (Index = 0) then
    begin
      polyClr.red := value;
    end
  else
    if (Index = 1) then
      begin
        polyClr.green := value;
      end
    else
      if (Index = 2) then
        begin
          polyClr.blue := value;
        end
      else
        if (Index = 3) then
          begin
            opacity := value / 100;
          end;
          if (numVerts > 0) and ((currentFunction = TOOL_CREATE) or (currentFunction = TOOL_QUAD)) then
            begin
              Polys[polyCount + 1].vertex[numVerts + 1].Color := ARGB(255 * opacity, RGB(polyClr.blue, polyClr.green, polyClr.red));
            end;
            Scenery[0].alpha := opacity * 255;
            Scenery[0].Color := ARGB(opacity * 255, RGB(polyClr.blue, polyClr.green, polyClr.red));
          end;

          //set polyclr when palette clicked
procedure TfrmSoldatMapEditor.setPaletteColour(var red: Byte; var green: Byte; var blue: Byte);
begin
  polyClr.red := red;
  polyClr.green := green;
  polyClr.blue := blue;
  if (numVerts > 0) and ((currentFunction = TOOL_CREATE) or (currentFunction = TOOL_QUAD)) then
    begin
      Polys[polyCount + 1].vertex[numVerts + 1].Color := ARGB(255 * opacity, RGB(polyClr.blue, polyClr.green, polyClr.red));
    end;
    Scenery[0].alpha := opacity * 255;
    Scenery[0].Color := ARGB(Scenery[0].alpha, RGB(polyClr.blue, polyClr.green, polyClr.red));
  end;

procedure TfrmSoldatMapEditor.setBlendMode(var Index: Smallint);
begin
  blendMode := Index;
end;

function TfrmSoldatMapEditor.getColour: Longint;
begin
  result := RGB(polyClr.red, polyClr.green, polyClr.blue);
end;

procedure TfrmSoldatMapEditor.getOptions;
var
  i: Smallint;
begin
  frmMap.txtDesc := mapTitle;
  frmMap.txtJet := Options.StartJet;
  frmMap.cboGrenades.ListIndex := Options.GrenadePacks;
  frmMap.cboMedikits.ListIndex := Options.Medikits;
  frmMap.cboSteps.ListIndex := Options.Steps;
  frmMap.cboWeather.ListIndex := Options.Weather;
  frmMap.picBackClr(0).BackColor := RGB(bgColours[1].red, bgColours[1].green, bgColours[1].blue);
  frmMap.picBackClr(1).BackColor := RGB(bgColours[2].red, bgColours[2].green, bgColours[2].blue);
  for i := 0 to frmMap.cboTexture.ListCount - 1 do
  begin
    if (frmMap.cboTexture.List(i) = textureFile) then
      begin
        frmMap.cboTexture.ListIndex := i;
      end;
    end;
  end;

procedure TfrmSoldatMapEditor.setOptions;
begin
  Options.GrenadePacks := frmMap.cboGrenades.ListIndex;
  Options.Medikits := frmMap.cboMedikits.ListIndex;
  Options.StartJet := frmMap.txtJet.Text;
  Options.Steps := frmMap.cboSteps.ListIndex;
  Options.Weather := frmMap.cboWeather.ListIndex;
  Options.BackgroundColor := ARGB(255, RGB(bgColours[1].blue, bgColours[1].green, bgColours[1].red));
  Options.BackgroundColor := ARGB(255, RGB(bgColours[2].blue, bgColours[2].green, bgColours[2].red));
  mapTitle := frmMap.txtDesc.Text;
end;

procedure TfrmSoldatMapEditor.Form_OLEDragDrop(var Data: DataObject; var Effect: Longint; var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
var
  Result: integer;
  temp: widestring;
begin
  temp := Data.Files.Item(1);
  if (RightStr(temp, 1) = '"') then
    begin
      temp := LeftStr(temp, length(temp) - 1);
      temp := RightStr(temp, length(temp) - 1);
    end;
    if (LowerCase(RightStr(temp, 4)) = '.pms') then
      begin
        if prompt then
          begin
            Result := Application.MessageBox(pchar('Save changes to ' + currentFileName + '?'), pchar(''), vbYesNoCancel) {HelpFile:None, Context:None};
            Application.ProcessMessages;
            if (Result = vbCancel) then
              begin
                Exit;
              end
            else
              if (Result = vbYes) then
                begin
                  mnuSave_Click;
                  if prompt then
                    begin
                      Exit;
                    end;
                  end;
                end;
                Application.ProcessMessages;
                recentFiles(Data.Files.Item(1));
                LoadFile(Data.Files.Item(1));
              end;
            end;

procedure TfrmSoldatMapEditor.Form_Paint;
begin
  Render;
end;

procedure TfrmSoldatMapEditor.Terminate; //You are on the way to destruction.
var
  Result: integer;
  label
  ErrorHandler;
  begin
    //ON ERROR
    if prompt then
      begin
        Result := Application.MessageBox(pchar('Save changes to ' + currentFileName + '?'), pchar(''), vbYesNoCancel) {HelpFile:None, Context:None};
        Application.ProcessMessages;
        if (Result = vbCancel) then
          begin
            Exit;
          end
        else
          if (Result = vbYes) then
            begin
              mnuSave_Click;
              if prompt then
                begin
                  Exit;
                end;
              end;
            end;
            Application.ProcessMessages;
            saveSettings;
            mapTexture := nil;
            particleTexture := nil;
            patternTexture := nil;
            sketchTexture := nil;
            objectsTexture := nil;
            lineTexture := nil;
            pathTexture := nil;
            rCenterTexture := nil;
            setlength(SceneryTextures, 0);
            SceneryTextures[0].Texture := nil;
            DIDevice.Unacquire;
            if (hEvent <> 0) then
              begin
                DX.DestroyEvent(hEvent);
              end;
              D3DDevice := nil;
              DIDevice := nil;
              DI := nil;
              D3D := nil;
              DX := nil;
              Unload(self);
              Application.Terminate;
              Exit;
              ErrorHandler:
                Application.MessageBox(pchar('Error terminating' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
            end;

procedure TfrmSoldatMapEditor.Form_Resize;
begin
  picHelp.Left := frmSoldatMapEditor.ScaleWidth - 80;
  picMinimize.Left := frmSoldatMapEditor.ScaleWidth - 48;
  picMaximize.Left := frmSoldatMapEditor.ScaleWidth - 32;
  picExit.Left := frmSoldatMapEditor.ScaleWidth - 16;
  picProgress.Left := frmSoldatMapEditor.ScaleWidth - 136;
end;

procedure TfrmSoldatMapEditor.MouseHelper_MouseWheel(var ctrl: olevariant; var Direction: MBMouseHelper.mbDirectionConstants; var Button: Longint; var Shift: Longint; var Cancel: Boolean);
var
  zoomVal: Single;
begin
  if (Direction = mbBackward) then
    begin
      zoomScroll(0.8, mouseCoords.X, mouseCoords.Y);
    end
  else
    if (Direction = mbForward) then
      begin
        zoomScroll(1.25, mouseCoords.X, mouseCoords.Y);
      end;
    end;

procedure TfrmSoldatMapEditor.setPreferences;
begin
  inc := (gridSpacing / gridDivisions);
  tvwScenery.Height := formHeight - 41 - 20;
  resetDevice;
  Render;
end;

function TfrmSoldatMapEditor.setBGColour(var Index: Smallint): Longint;
begin
  frmColour.InitClr(bgColours[Index].red, bgColours[Index].green, bgColours[Index].blue);
  frmColour.Show(1);
  bgColours[Index].red := frmColour.red;
  bgColours[Index].green := frmColour.green;
  bgColours[Index].blue := frmColour.blue;
  bgPolys[1].Color := RGB(bgColours[1].blue, bgColours[1].green, bgColours[1].red);
  bgPolys[2].Color := RGB(bgColours[2].blue, bgColours[2].green, bgColours[2].red);
  bgPolys[3].Color := RGB(bgColours[1].blue, bgColours[1].green, bgColours[1].red);
  bgPolys[4].Color := RGB(bgColours[2].blue, bgColours[2].green, bgColours[2].red);
  result := RGB(bgColours[Index].red, bgColours[Index].green, bgColours[Index].blue);
  Render;
end;

procedure TfrmSoldatMapEditor.setLightColour;
var
  i: Smallint;
  Index: Smallint;
begin
  for i := 1 to lightCount do
  begin
    if (Lights[i].selected = 1) then
      begin
        Index := i;
        Break;
      end;
    end;
    frmColour.InitClr(Lights[Index].colour.red, Lights[Index].colour.green, Lights[Index].colour.blue);
    frmColour.Show(1);
    for i := 1 to lightCount do
    begin
      if (Lights[i].selected = 1) then
        begin
          Lights[i].colour.red := frmColour.red;
          Lights[i].colour.green := frmColour.green;
          Lights[i].colour.blue := frmColour.blue;
        end;
      end;
      frmInfo.picLight.BackColor := RGB(frmColour.red, frmColour.green, frmColour.blue);
      applyLights;
    end;

procedure TfrmSoldatMapEditor.setRadius(var R: Smallint);
var
  i: Smallint;
begin
  clrRadius := R;
  Colliders[0].radius := R;
  if (numSelColliders > 0) then
    begin
      for i := 1 to colliderCount do
      begin
        if Colliders[i].active then
          begin
            Colliders[i].radius := R;
          end;
        end;
        Render;
      end;
    end;

function TfrmSoldatMapEditor.setWayType(var Index: Smallint; var tehValue: Boolean): Boolean;
var
  i: Smallint;
begin
  if (numSelWaypoints = 0) then
    begin
      result := false;
      Exit;
    end;
    for i := 1 to waypointCount do
    begin
      if Waypoints[i].selected then
        begin
          Waypoints[i].wayType[Index] := tehValue;
          if (Index = 0) then
            begin
              Waypoints[i].wayType[1] := false;
            end
          else
            if (Index = 1) then
              begin
                Waypoints[i].wayType[0] := false;
              end
            else
              if (Index = 2) then
                begin
                  Waypoints[i].wayType[3] := false;
                end
              else
                if (Index = 3) then
                  begin
                    Waypoints[i].wayType[2] := false;
                  end;
                end;
              end;
              result := true;
              Render;
            end;

procedure TfrmSoldatMapEditor.setPathNum(var tehValue: Byte);
var
  i: Smallint;
begin
  for i := 1 to waypointCount do
  begin
    if Waypoints[i].selected then
      begin
        Waypoints[i].pathNum := tehValue;
      end;
    end;
    Render;
  end;

function TfrmSoldatMapEditor.setSpecial(var tehValue: Byte): Boolean;
var
  i: Smallint;
begin
  if (numSelWaypoints = 0) then
    begin
      result := false;
      Exit;
    end;
    for i := 1 to waypointCount do
    begin
      if Waypoints[i].selected then
        begin
          Waypoints[i].special := tehValue;
        end;
      end;
      result := true;
    end;

procedure TfrmSoldatMapEditor.setShowPaths;
begin
  Render;
end;

procedure TfrmSoldatMapEditor.ClearUnused;
var
  i: Smallint;
  j: Smallint;
  doesExist: Boolean;
  offset: Smallint;
  numDeleted: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    offset := 1;
    for i := 1 to sceneryElements do
    begin
      for j := 1 to sceneryCount do //check if exists
      begin
        if (Scenery[j].Style = i) then
          begin
            doesExist := true;
            Break;
          end;
        end; //check if duplicate
        for j := 0 to offset - 2 do
        begin
          if (frmScenery.lstScenery.List(j) = frmScenery.lstScenery.List(offset - 1)) then
            begin
              doesExist := false;
              Break;
            end;
          end;
          SceneryTextures[offset] := SceneryTextures[i];
          if doesExist //if does not exist, will get overwritten next time then
            begin
              offset := offset + 1;
            end
          else
          begin
            numDeleted := numDeleted + 1;
            frmScenery.lstScenery.RemoveItem(offset - 1);
          end;
          for j := 1 to sceneryCount do
          begin
            if (Scenery[j].Style = i) then
              begin
                Scenery[j].Style := Scenery[j].Style - numDeleted;
              end;
            end;
            doesExist := false;
          end;
          if (numDeleted > 0) then
            begin
              Scenery[0].Style := 0;
              sceneryElements := sceneryElements - numDeleted;
              setlength(SceneryTextures, sceneryElements);
              tvwScenery.Nodes.Remove('In Use');
              tvwScenery.Nodes.Add('Master List', tvwFirst, 'In Use', 'In Use');
              for i := 0 to frmScenery.lstScenery.ListCount - 1 do
              begin
                tvwScenery.Nodes.Add('In Use', tvwChild, frmScenery.lstScenery.List(i), frmScenery.lstScenery.List(i));
              end;
            end;
            numUndo := 0;
            Exit;
            ErrorHandler:
              Application.MessageBox(pchar('Error clearing unused scenery' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
          end;

procedure TfrmSoldatMapEditor.saveSettings;
var
  X: Smallint;
  Y: Smallint;
  i: Smallint;
  KeyCode: Byte;
  iniString: widestring;
  currentColour: Longint;
  sNull: widestring;
begin
  sNull := Chr(0);
  //preferences
  iniString := 'Dir=' + soldatDir + sNull + 'Uncompiled=' + uncompDir + sNull + 'Prefabs=' + prefabDir + sNull + 'GridSpacing=' + gridSpacing + sNull + 'GridDiv=' + gridDivisions + sNull + 'GridClr1=' + RGBtoHex(gridClr) + sNull + 'GridClr2=' + RGBtoHex(gridClr2) + sNull + 'GridAlpha1=' + gridOp1 + sNull + 'GridAlpha2=' + gridOp2 + sNull + 'PolySrc=' + polyBlendSrc + sNull + 'PolyDest=' + polyBlendDest + sNull + 'WireSrc=' + wireBlendSrc + sNull + 'WireDest=' + wireBlendDest + sNull + 'PointClr=' + RGBtoHex(pointClr) + sNull + 'SelectionClr=' + RGBtoHex(selectionClr) + sNull + 'BackClr=' + RGBtoHex(backClr) + sNull + 'MaxUndo=' + max_undo + sNull + 'SceneryVerts=' + sceneryVerts + sNull + 'Topmost=' + topmost + sNull + sNull;
  saveSection('Preferences', iniString);
  //display
  iniString := 'Background=' + showBG + sNull + 'Polys=' + showPolys + sNull + 'Texture=' + showTexture + sNull + 'Wireframe=' + showWireframe + sNull + 'Points=' + showPoints + sNull + 'Scenery=' + showScenery + sNull + 'Objects=' + showObjects + sNull + 'Waypoints=' + showWaypoints + sNull + 'Grid=' + showGrid + sNull + 'Lights=' + showLights + sNull + 'Sketch=' + showSketch + sNull + sNull;
  saveSection('Display', iniString);
  //tool settings
  currentColour := RGB(polyClr.blue, polyClr.green, polyClr.red);
  iniString := 'CurrentTool=' + currentTool + sNull + 'SnapVertices=' + ohSnap + sNull + 'SnapToGrid=' + snapToGrid + sNull + 'FixedTexture=' + fixedTexture + sNull + 'Opacity=' + (opacity * 100) + sNull + 'ColourRadius=' + clrRadius + sNull + 'CurrentColour=' + RGBtoHex(currentColour) + sNull + 'ColourMode=' + colourMode + sNull + 'BlendMode=' + blendMode + sNull + 'SnapRadius=' + snapRadius + sNull + 'RotateScenery=' + frmScenery.rotateScenery + sNull + 'ScaleScenery=' + frmScenery.scaleScenery + sNull + 'TextureWidth=' + xTexture + sNull + 'TextureHeight=' + yTexture + sNull + 'Texture=' + textureFile + sNull + 'CustomX=' + mnuCustomX.Checked + sNull + 'CustomY=' + mnuCustomY.Checked + sNull + sNull;
  saveSection('ToolSettings', iniString);
  //hotkeys
  iniString := 'Move=' + frmTools.getHotKey(0) + sNull + 'Create=' + frmTools.getHotKey(1) + sNull + 'VertexSelection=' + frmTools.getHotKey(2) + sNull + 'PolySelection=' + frmTools.getHotKey(3) + sNull + 'VertexColour=' + frmTools.getHotKey(4) + sNull + 'PolyColour=' + frmTools.getHotKey(5) + sNull + 'Texture=' + frmTools.getHotKey(6) + sNull + 'Scenery=' + frmTools.getHotKey(7) + sNull + 'Waypoints=' + frmTools.getHotKey(8) + sNull + 'Objects=' + frmTools.getHotKey(9) + sNull + 'ColourPicker=' + frmTools.getHotKey(10) + sNull + 'Sketch=' + frmTools.getHotKey(11) + sNull + 'Lights=' + frmTools.getHotKey(12) + sNull + 'Depthmap=' + frmTools.getHotKey(13) + sNull + sNull;
  saveSection('HotKeys', iniString);
  //waypoint keys
  iniString := 'Left=' + frmWaypoints.getWayptKey(0) + sNull + 'Right=' + frmWaypoints.getWayptKey(1) + sNull + 'Up=' + frmWaypoints.getWayptKey(2) + sNull + 'Down=' + frmWaypoints.getWayptKey(3) + sNull + 'Fly=' + frmWaypoints.getWayptKey(4) + sNull + sNull;
  saveSection('WaypointKeys', iniString);
  //layer keys
  iniString := 'Background=' + frmDisplay.getLayerKey(0) + sNull + 'Polys=' + frmDisplay.getLayerKey(1) + sNull + 'Texture=' + frmDisplay.getLayerKey(2) + sNull + 'Wireframe=' + frmDisplay.getLayerKey(3) + sNull + 'Points=' + frmDisplay.getLayerKey(4) + sNull + 'Scenery=' + frmDisplay.getLayerKey(5) + sNull + 'Objects=' + frmDisplay.getLayerKey(6) + sNull + 'Waypoints=' + frmDisplay.getLayerKey(7) + sNull + sNull;
  saveSection('LayerKeys', iniString);
  //palette
  frmPalette.savePalette(appPath + '\palettes\current.txt');
  //workspace
  iniString := 'WindowState=' + self.WindowState + sNull + 'Width=' + formWidth + sNull + 'Height=' + formHeight + sNull + 'Left=' + formLeft + sNull + 'Top=' + formTop + sNull + sNull;
  saveSection('Main', iniString, appPath + '\workspace\current.ini');
  saveWindow('Tools', frmTools, false);
  saveWindow('Display', frmDisplay, frmDisplay.collapsed);
  saveWindow('Properties', frmInfo, frmInfo.collapsed);
  saveWindow('Palette', frmPalette, frmPalette.collapsed);
  saveWindow('Scenery', frmScenery, frmScenery.collapsed);
  saveWindow('Waypoints', frmWaypoints, frmWaypoints.collapsed);
  saveWindow('Texture', frmTexture, frmTexture.collapsed);
  //recent files
  iniString := '01=' + mnuRecent(0).Caption + sNull + '02=' + mnuRecent(1).Caption + sNull + '03=' + mnuRecent(2).Caption + sNull + '04=' + mnuRecent(3).Caption + sNull + '05=' + mnuRecent(4).Caption + sNull + '06=' + mnuRecent(5).Caption + sNull + '07=' + mnuRecent(6).Caption + sNull + '08=' + mnuRecent(7).Caption + sNull + '09=' + mnuRecent(8).Caption + sNull + '10=' + mnuRecent(9).Caption + sNull + sNull;
  saveSection('RecentFiles', iniString);
  //gfx dir
  iniString := 'Dir=' + gfxDir + sNull + sNull;
  saveSection('gfx', iniString);
end;

procedure TfrmSoldatMapEditor.saveWindow(var sectionName: widestring; var window: TForm; var collapsed: Boolean; var FileName: widestring{ = 'current.ini'});
var
  leftVal: Smallint;
  topVal: Smallint;
  iniString: widestring;
  sNull: widestring;
begin
  sNull := Chr(0);
  leftVal := window.Left / Screen.TwipsPerPixelX;
  topVal := window.Top / Screen.TwipsPerPixelY;
  iniString := 'Visible=' + window.Visible + sNull + 'Left=' + leftVal + sNull + 'Top=' + topVal + sNull + 'Collapsed=' + collapsed + sNull + sNull;
  saveSection(sectionName, iniString, appPath + '\workspace\' + FileName);
end;

function TfrmSoldatMapEditor.SetIdePath: olevariant;
begin
  appPath := appPath + '\pwinstall';
  result := true;
end;

procedure TfrmSoldatMapEditor.loadINI;
var
  i: Smallint;
  numRecent: Smallint;
  errVal: widestring;
  label
  ErrorHandler;
  begin
    //ON ERROR
    appPath := App.Path;
    assert(SetIdePath); //workaround for debugging with ide
    errVal := '1';
    soldatDir := loadString('Preferences', 'Dir', Unassigned, 1024);
    uncompDir := loadString('Preferences', 'Uncompiled', Unassigned, 1024);
    prefabDir := loadString('Preferences', 'Prefabs', Unassigned, 1024);
    gridSpacing := loadInt('Preferences', 'GridSpacing');
    gridDivisions := loadInt('Preferences', 'GridDiv');
    gridClr := HexToLong(loadString('Preferences', 'GridClr1'));
    gridClr2 := HexToLong(loadString('Preferences', 'GridClr2'));
    gridOp1 := loadInt('Preferences', 'GridAlpha1');
    gridOp2 := loadInt('Preferences', 'GridAlpha2');
    polyBlendSrc := loadInt('Preferences', 'PolySrc');
    polyBlendDest := loadInt('Preferences', 'PolyDest');
    wireBlendSrc := loadInt('Preferences', 'WireSrc');
    wireBlendDest := loadInt('Preferences', 'WireDest');
    pointClr := HexToLong(loadString('Preferences', 'PointClr'));
    selectionClr := HexToLong(loadString('Preferences', 'SelectionClr'));
    backClr := HexToLong(loadString('Preferences', 'BackClr'));
    max_undo := loadInt('Preferences', 'MaxUndo');
    sceneryVerts := loadString('Preferences', 'SceneryVerts');
    topmost := loadString('Preferences', 'Topmost');
    errVal := '2';
    showBG := loadString('Display', 'Background');
    showPolys := loadString('Display', 'Polys');
    showTexture := loadString('Display', 'Texture');
    showWireframe := loadString('Display', 'Wireframe');
    showPoints := loadString('Display', 'Points');
    showScenery := loadString('Display', 'Scenery');
    showObjects := loadString('Display', 'Objects');
    showWaypoints := loadString('Display', 'Waypoints');
    showGrid := loadString('Display', 'Grid');
    showLights := loadString('Display', 'Lights');
    showSketch := loadString('Display', 'Sketch');
    errVal := '3';
    currentTool := loadInt('ToolSettings', 'CurrentTool');
    ohSnap := loadString('ToolSettings', 'SnapVertices');
    snapToGrid := loadString('ToolSettings', 'SnapToGrid');
    fixedTexture := loadString('ToolSettings', 'FixedTexture');
    opacity := loadInt('ToolSettings', 'Opacity') / 100;
    clrRadius := loadInt('ToolSettings', 'ColourRadius');
    polyClr := getRGB(HexToLong(loadString('ToolSettings', 'CurrentColour')));
    colourMode := loadInt('ToolSettings', 'ColourMode');
    blendMode := loadInt('ToolSettings', 'BlendMode');
    snapRadius := loadInt('ToolSettings', 'SnapRadius');
    frmScenery.rotateScenery := loadString('ToolSettings', 'RotateScenery');
    frmScenery.scaleScenery := loadString('ToolSettings', 'ScaleScenery');
    xTexture := loadInt('ToolSettings', 'TextureWidth');
    yTexture := loadInt('ToolSettings', 'TextureHeight');
    textureFile := loadString('ToolSettings', 'Texture', Unassigned, 1024);
    mnuCustomX.Checked := loadString('ToolSettings', 'CustomX');
    mnuCustomY.Checked := loadString('ToolSettings', 'CustomY');
    errVal := '4';
    frmTools.setHotKey(0, loadInt('HotKeys', 'Move'));
    frmTools.setHotKey(1, loadInt('HotKeys', 'Create'));
    frmTools.setHotKey(2, loadInt('HotKeys', 'VertexSelection'));
    frmTools.setHotKey(3, loadInt('HotKeys', 'PolySelection'));
    frmTools.setHotKey(4, loadInt('HotKeys', 'VertexColour'));
    frmTools.setHotKey(5, loadInt('HotKeys', 'PolyColour'));
    frmTools.setHotKey(6, loadInt('HotKeys', 'Texture'));
    frmTools.setHotKey(7, loadInt('HotKeys', 'Scenery'));
    frmTools.setHotKey(8, loadInt('HotKeys', 'Waypoints'));
    frmTools.setHotKey(9, loadInt('HotKeys', 'Objects'));
    frmTools.setHotKey(10, loadInt('HotKeys', 'ColourPicker'));
    frmTools.setHotKey(11, loadInt('HotKeys', 'Sketch'));
    frmTools.setHotKey(12, loadInt('HotKeys', 'Lights'));
    frmTools.setHotKey(13, loadInt('HotKeys', 'DepthMap'));
    errVal := '5';
    frmWaypoints.setWayptKey(0, loadInt('WaypointKeys', 'Left'));
    frmWaypoints.setWayptKey(1, loadInt('WaypointKeys', 'Right'));
    frmWaypoints.setWayptKey(2, loadInt('WaypointKeys', 'Up'));
    frmWaypoints.setWayptKey(3, loadInt('WaypointKeys', 'Down'));
    frmWaypoints.setWayptKey(4, loadInt('WaypointKeys', 'Fly'));
    errVal := '6';
    frmDisplay.setLayerKey(0, loadInt('LayerKeys', 'Background'));
    frmDisplay.setLayerKey(1, loadInt('LayerKeys', 'Polys'));
    frmDisplay.setLayerKey(2, loadInt('LayerKeys', 'Texture'));
    frmDisplay.setLayerKey(3, loadInt('LayerKeys', 'Wireframe'));
    frmDisplay.setLayerKey(4, loadInt('LayerKeys', 'Points'));
    frmDisplay.setLayerKey(5, loadInt('LayerKeys', 'Scenery'));
    frmDisplay.setLayerKey(6, loadInt('LayerKeys', 'Objects'));
    frmDisplay.setLayerKey(7, loadInt('LayerKeys', 'Waypoints'));
    errVal := '7';
    mnuRecent(0).Caption := loadString('RecentFiles', '01', Unassigned, 1024);
    mnuRecent(1).Caption := loadString('RecentFiles', '02', Unassigned, 1024);
    mnuRecent(2).Caption := loadString('RecentFiles', '03', Unassigned, 1024);
    mnuRecent(3).Caption := loadString('RecentFiles', '04', Unassigned, 1024);
    mnuRecent(4).Caption := loadString('RecentFiles', '05', Unassigned, 1024);
    mnuRecent(5).Caption := loadString('RecentFiles', '06', Unassigned, 1024);
    mnuRecent(6).Caption := loadString('RecentFiles', '07', Unassigned, 1024);
    mnuRecent(7).Caption := loadString('RecentFiles', '08', Unassigned, 1024);
    mnuRecent(8).Caption := loadString('RecentFiles', '09', Unassigned, 1024);
    mnuRecent(9).Caption := loadString('RecentFiles', '10', Unassigned, 1024);
    errVal := '8';
    PolyTypeClrs[1] := VarAsType('&H' + (loadString('PolyTypeColours', 'OnlyBullets')), varInteger);
    PolyTypeClrs[2] := VarAsType('&H' + (loadString('PolyTypeColours', 'OnlyPlayer')), varInteger);
    PolyTypeClrs[3] := VarAsType('&H' + (loadString('PolyTypeColours', 'DoesntCollide')), varInteger);
    PolyTypeClrs[4] := VarAsType('&H' + (loadString('PolyTypeColours', 'Ice')), varInteger);
    PolyTypeClrs[5] := VarAsType('&H' + (loadString('PolyTypeColours', 'Deadly')), varInteger);
    PolyTypeClrs[6] := VarAsType('&H' + (loadString('PolyTypeColours', 'BloodyDeadly')), varInteger);
    PolyTypeClrs[7] := VarAsType('&H' + (loadString('PolyTypeColours', 'Hurts')), varInteger);
    PolyTypeClrs[8] := VarAsType('&H' + (loadString('PolyTypeColours', 'Regenerates')), varInteger);
    PolyTypeClrs[9] := VarAsType('&H' + (loadString('PolyTypeColours', 'Lava')), varInteger);
    PolyTypeClrs[10] := VarAsType('&H' + (loadString('PolyTypeColours', 'TeamBullets')), varInteger);
    PolyTypeClrs[11] := VarAsType('&H' + (loadString('PolyTypeColours', 'TeamPlayers')), varInteger);
    PolyTypeClrs[12] := PolyTypeClrs[10];
    PolyTypeClrs[13] := PolyTypeClrs[11];
    PolyTypeClrs[14] := PolyTypeClrs[10];
    PolyTypeClrs[15] := PolyTypeClrs[11];
    PolyTypeClrs[16] := PolyTypeClrs[10];
    PolyTypeClrs[17] := PolyTypeClrs[11];
    PolyTypeClrs[18] := VarAsType('&H' + (loadString('PolyTypeColours', 'Bouncy')), varInteger);
    PolyTypeClrs[19] := VarAsType('&H' + (loadString('PolyTypeColours', 'Explosive')), varInteger);
    PolyTypeClrs[20] := VarAsType('&H' + (loadString('PolyTypeColours', 'HurtFlaggers')), varInteger);
    PolyTypeClrs[21] := VarAsType('&H' + (loadString('PolyTypeColours', 'OnlyFlagger')), varInteger);
    PolyTypeClrs[22] := VarAsType('&H' + (loadString('PolyTypeColours', 'NonFlagger')), varInteger);
    PolyTypeClrs[23] := VarAsType('&H' + (loadString('PolyTypeColours', 'FlagCollides')), varInteger);
    PolyTypeClrs[24] := VarAsType('&H' + (loadString('PolyTypeColours', 'Back')), varInteger);
    PolyTypeClrs[25] := VarAsType('&H' + (loadString('PolyTypeColours', 'BackTransition')), varInteger);
    errVal := '9';
    gfxDir := loadString('gfx', 'Dir', Unassigned, 1024);
    if (gfxDir = '') then
      begin
        gfxDir := 'gfx';
      end;
      errVal := '10';
      for i := 1 to 9 do
      begin
        if (mnuRecent(i).Caption = '') then
          begin
            numRecent := numRecent + 1;
            mnuRecent(i).Visible := false;
          end
        else
        begin
          mnuRecent(i).Visible := true;
        end;
      end;
      if (numRecent = 9) and (mnuRecent(0).Caption = '') then
        begin
          mnuRecentFiles.Enabled := false;
        end;
        Exit;
        ErrorHandler:
          Application.MessageBox(pchar('Error loading ini file' + vbNewLine + Error + vbNewLine + errVal), pchar(''), MB_OK) {HelpFile:None, Context:None};
      end;

function TfrmSoldatMapEditor.getNextValue(var sectionString: widestring; var eIndex: Smallint): widestring;
var
  nIndex: Smallint;
begin
  eIndex := PosEx('=', sectionString, eIndex) + 1;
  nIndex := PosEx(vbNullChar, sectionString, eIndex);
  result := Copy(sectionString, eIndex, nIndex);
end;

procedure TfrmSoldatMapEditor.loadWorkspace(var FileName: widestring{ = 'current.ini'});
label
ErrorHandler;
begin
  //ON ERROR
  self.WindowState := loadInt('Main', 'WindowState', appPath + '\workspace\' + FileName);
  self.formWidth := loadInt('Main', 'Width', appPath + '\workspace\' + FileName);
  self.formHeight := loadInt('Main', 'Height', appPath + '\workspace\' + FileName);
  self.formLeft := loadInt('Main', 'Left', appPath + '\workspace\' + FileName);
  self.formTop := loadInt('Main', 'Top', appPath + '\workspace\' + FileName);
  if (self.WindowState = vbNormal) then
    begin
      self.Width := formWidth * Screen.TwipsPerPixelX;
      self.Height := formHeight * Screen.TwipsPerPixelY;
      self.Left := formLeft * Screen.TwipsPerPixelX;
      self.Top := formTop * Screen.TwipsPerPixelY;
    end;
    tvwScenery.Height := formHeight - 41 - 20;
    mnuTools.Checked := loadString('Tools', 'Visible', appPath + '\workspace\' + FileName);
    frmTools.xPos := loadInt('Tools', 'Left', appPath + '\workspace\' + FileName);
    frmTools.yPos := loadInt('Tools', 'Top', appPath + '\workspace\' + FileName);
    frmTools.collapsed := loadString('Tools', 'Collapsed', appPath + '\workspace\' + FileName);
    mnuDisplay.Checked := loadString('Display', 'Visible', appPath + '\workspace\' + FileName);
    frmDisplay.xPos := loadInt('Display', 'Left', appPath + '\workspace\' + FileName);
    frmDisplay.yPos := loadInt('Display', 'Top', appPath + '\workspace\' + FileName);
    frmDisplay.collapsed := loadString('Display', 'Collapsed', appPath + '\workspace\' + FileName);
    mnuInfo.Checked := loadString('Properties', 'Visible', appPath + '\workspace\' + FileName);
    frmInfo.xPos := loadInt('Properties', 'Left', appPath + '\workspace\' + FileName);
    frmInfo.yPos := loadInt('Properties', 'Top', appPath + '\workspace\' + FileName);
    frmInfo.collapsed := loadString('Properties', 'Collapsed', appPath + '\workspace\' + FileName);
    mnuPalette.Checked := loadString('Palette', 'Visible', appPath + '\workspace\' + FileName);
    frmPalette.xPos := loadInt('Palette', 'Left', appPath + '\workspace\' + FileName);
    frmPalette.yPos := loadInt('Palette', 'Top', appPath + '\workspace\' + FileName);
    frmPalette.collapsed := loadString('Palette', 'Collapsed', appPath + '\workspace\' + FileName);
    mnuScenery.Checked := loadString('Scenery', 'Visible', appPath + '\workspace\' + FileName);
    frmScenery.xPos := loadInt('Scenery', 'Left', appPath + '\workspace\' + FileName);
    frmScenery.yPos := loadInt('Scenery', 'Top', appPath + '\workspace\' + FileName);
    frmScenery.collapsed := loadString('Scenery', 'Collapsed', appPath + '\workspace\' + FileName);
    mnuWaypoints.Checked := loadString('Waypoints', 'Visible', appPath + '\workspace\' + FileName);
    frmWaypoints.xPos := loadInt('Waypoints', 'Left', appPath + '\workspace\' + FileName);
    frmWaypoints.yPos := loadInt('Waypoints', 'Top', appPath + '\workspace\' + FileName);
    frmWaypoints.collapsed := loadString('Waypoints', 'Collapsed', appPath + '\workspace\' + FileName);
    mnuTexture.Checked := loadString('Texture', 'Visible', appPath + '\workspace\' + FileName);
    frmTexture.xPos := loadInt('Texture', 'Left', appPath + '\workspace\' + FileName);
    frmTexture.yPos := loadInt('Texture', 'Top', appPath + '\workspace\' + FileName);
    frmTexture.collapsed := loadString('Texture', 'Collapsed', appPath + '\workspace\' + FileName);
    Exit;
    ErrorHandler:
      Application.MessageBox(pchar('Error loading workspace' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
  end;

procedure TfrmSoldatMapEditor.loadColours;
label
ErrorHandler;
begin
  //ON ERROR
  bgClr := VarAsType('&H' + loadString('GUIColours', 'Background', appPath + '\' + gfxDir + '\colours.ini'), varInteger);
  lblBackClr := VarAsType('&H' + loadString('GUIColours', 'LabelBack', appPath + '\' + gfxDir + '\colours.ini'), varInteger);
  lblTextClr := VarAsType('&H' + loadString('GUIColours', 'LabelText', appPath + '\' + gfxDir + '\colours.ini'), varInteger);
  txtBackClr := VarAsType('&H' + loadString('GUIColours', 'TextBoxBack', appPath + '\' + gfxDir + '\colours.ini'), varInteger);
  txtTextClr := VarAsType('&H' + loadString('GUIColours', 'TextBoxText', appPath + '\' + gfxDir + '\colours.ini'), varInteger);
  frameClr := VarAsType('&H' + loadString('GUIColours', 'Frame', appPath + '\' + gfxDir + '\colours.ini'), varInteger);
  font1 := loadString('GUIColours', 'font1', appPath + '\' + gfxDir + '\colours.ini', 40);
  font2 := loadString('GUIColours', 'font2', appPath + '\' + gfxDir + '\colours.ini', 40);
  if (font1 = '') then
    begin
      font1 := appPath + '\Lucida Console';
    end;
    if (font2 = '') then
      begin
        font2 := appPath + '\Bank Gothic Light BT';
      end;
      Exit;
      ErrorHandler:
        Application.MessageBox(pchar('Error loading colours' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
    end;

procedure TfrmSoldatMapEditor.mnuExit_Click;
begin
  Terminate;
end;

procedure TfrmSoldatMapEditor.mnuNew_Click;
var
  Result: integer;
begin
  if prompt then
    begin
      Result := Application.MessageBox(pchar('Save changes to ' + currentFileName + '?'), pchar(''), vbYesNoCancel) {HelpFile:None, Context:None};
      Application.ProcessMessages;
      if (Result = vbCancel) then
        begin
          Exit;
        end
      else
        if (Result = vbYes) then
          begin
            mnuSave_Click;
            if prompt then
              begin
                Exit;
              end;
            end;
          end;
          newMap;
        end;

procedure TfrmSoldatMapEditor.mnuOpen_Click;
var
  Result: integer;
  label
  ErrorHandler;
  begin
    //ON ERROR
    if prompt then
      begin
        Result := Application.MessageBox(pchar('Save changes to ' + currentFileName + '?'), pchar(''), vbYesNoCancel) {HelpFile:None, Context:None};
        Application.ProcessMessages;
        if (Result = vbCancel) then
          begin
            Exit;
          end
        else
          if (Result = vbYes) then
            begin
              mnuSave_Click;
              if prompt then
                begin
                  Exit;
                end;
              end;
            end;
            Application.ProcessMessages;
            frmSoldatMapEditor.commonDialog.Filter := 'Map File (*.pms)|*.pms';
            commonDialog.InitDir := uncompDir;
            commonDialog.FileName := uncompDir + currentFileName;
            frmSoldatMapEditor.commonDialog.DialogTitle := 'Load Map';
            commonDialog.ShowOpen;
            if (commonDialog.FileName <> '') then
              begin
                prompt := false;
                recentFiles(commonDialog.FileName);
                polyCount := 0;
                numSelectedPolys := 0;
                setlength(selectedPolys, 0);
                setlength(vertexList, 0);
                setlength(Polys, 0);
                selectedCoords[1].X := 0;
                selectedCoords[1].Y := 0;
                selectedCoords[2].X := 0;
                selectedCoords[2].Y := 0;
                LoadFile(commonDialog.FileName);
              end;
              RegainFocus;
              Exit;
              ErrorHandler:
                if (Error <> 'Cancel was selected.') then
                begin
                  Application.MessageBox(pchar('Error opening file' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
                end;
                RegainFocus;
              end;

procedure TfrmSoldatMapEditor.mnuOpenCompiled_Click;
var
  Result: integer;
  label
  ErrorHandler;
  begin
    //ON ERROR
    if prompt then
      begin
        Result := Application.MessageBox(pchar('Save changes to ' + currentFileName + '?'), pchar(''), vbYesNoCancel) {HelpFile:None, Context:None};
        Application.ProcessMessages;
        if (Result = vbCancel) then
          begin
            Exit;
          end
        else
          if (Result = vbYes) then
            begin
              mnuSave_Click;
              if prompt then
                begin
                  Exit;
                end;
              end;
            end;
            Application.ProcessMessages;
            frmSoldatMapEditor.commonDialog.Filter := 'Map File (*.pms)|*.pms';
            commonDialog.InitDir := soldatDir + 'Maps\';
            commonDialog.FileName := soldatDir + 'Maps\' + currentFileName;
            frmSoldatMapEditor.commonDialog.DialogTitle := 'Load Map';
            commonDialog.ShowOpen;
            if (commonDialog.FileName <> '') then
              begin
                prompt := false;
                recentFiles(commonDialog.FileName);
                polyCount := 0;
                numSelectedPolys := 0;
                setlength(selectedPolys, 0);
                setlength(vertexList, 0);
                setlength(Polys, 0);
                selectedCoords[1].X := 0;
                selectedCoords[1].Y := 0;
                selectedCoords[2].X := 0;
                selectedCoords[2].Y := 0;
                LoadFile(commonDialog.FileName);
              end;
              RegainFocus;
              Exit;
              ErrorHandler:
                if (Error <> 'Cancel was selected.') then
                begin
                  Application.MessageBox(pchar('Error opening compiled map' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
                end;
                RegainFocus;
              end;

procedure TfrmSoldatMapEditor.mnuSave_Click;
var
  i: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    frmSoldatMapEditor.commonDialog.Filter := 'Map File (*.pms)|*.pms';
    frmSoldatMapEditor.commonDialog.DialogTitle := 'Save Map';
    commonDialog.FileName := uncompDir + currentFileName;
    commonDialog.InitDir := uncompDir;
    if (lblFileName.Caption = 'Untitled.pms') then
      begin
        commonDialog.ShowSave;
        if (commonDialog.FileName <> '') then
          begin
            recentFiles(commonDialog.FileName);
            Application.ProcessMessages;
            SaveFile(commonDialog.FileName);
            prompt := false;
          end;
        end
      else
      begin
        SaveFile(commonDialog.FileName);
        prompt := false;
      end;
      RegainFocus;
      Exit;
      ErrorHandler:
        if (Error <> 'Cancel was selected.') then
        begin
          Application.MessageBox(pchar('Error saving file' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
        end;
        RegainFocus;
      end;

procedure TfrmSoldatMapEditor.mnuSaveAs_Click;
var
  i: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    frmSoldatMapEditor.commonDialog.Filter := 'Map File (*.pms)|*.pms';
    commonDialog.InitDir := appPath + '\Maps\';
    commonDialog.FileName := appPath + '\Maps\' + currentFileName;
    frmSoldatMapEditor.commonDialog.DialogTitle := 'Save Map';
    commonDialog.ShowSave;
    if (commonDialog.FileName <> '') then
      begin
        recentFiles(commonDialog.FileName);
        Application.ProcessMessages;
        SaveFile(commonDialog.FileName);
        prompt := false;
      end;
      RegainFocus;
      Exit;
      ErrorHandler:
        if (Error <> 'Cancel was selected.') then
        begin
          Application.MessageBox(pchar('Error saving as' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
        end;
        RegainFocus;
      end;

procedure TfrmSoldatMapEditor.mnuCompile_Click;
var
  i: Smallint;
  length: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    frmSoldatMapEditor.commonDialog.Filter := 'Map File (*.pms)|*.pms';
    commonDialog.InitDir := frmSoldatMapEditor.soldatDir + 'Maps\';
    commonDialog.FileName := frmSoldatMapEditor.soldatDir + 'Maps\' + currentFileName;
    frmSoldatMapEditor.commonDialog.DialogTitle := 'Compile to pms';
    if (lblFileName.Caption = 'Untitled.pms') then
      begin
        commonDialog.ShowSave;
        Application.ProcessMessages;
        if (commonDialog.FileName <> '') then
          begin
            SaveAndCompile(commonDialog.FileName);
            prompt := false;
            for i := 1 to length(commonDialog.FileName) do
            begin
              if (Copy(commonDialog.FileName, i, 1) = '\') then
                begin
                  length := i + 1;
                end;
              end;
              lastCompiled := Copy(commonDialog.FileName, length, length(commonDialog.FileName) - length - 3);
            end;
          end
        else
        begin
          SaveAndCompile(commonDialog.FileName);
          prompt := false;
          for i := 1 to length(commonDialog.FileName) do
          begin
            if (Copy(commonDialog.FileName, i, 1) = '\') then
              begin
                length := i + 1;
              end;
            end;
            lastCompiled := Copy(commonDialog.FileName, length, length(commonDialog.FileName) - length - 3);
          end;
          RegainFocus;
          Exit;
          ErrorHandler:
            if (Error <> 'Cancel was selected.') then
            begin
              Application.MessageBox(pchar('Error compiling map' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
            end;
            RegainFocus;
          end;

procedure TfrmSoldatMapEditor.mnuCompileAs_Click;
var
  i: Smallint;
  length: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    frmSoldatMapEditor.commonDialog.Filter := 'Map File (*.pms)|*.pms';
    commonDialog.InitDir := frmSoldatMapEditor.soldatDir + 'Maps\';
    commonDialog.FileName := frmSoldatMapEditor.soldatDir + 'Maps\' + currentFileName;
    frmSoldatMapEditor.commonDialog.DialogTitle := 'Compile to pms';
    commonDialog.ShowSave;
    if (commonDialog.FileName <> '') then
      begin
        Application.ProcessMessages;
        SaveAndCompile(commonDialog.FileName);
        prompt := false;
        for i := 1 to length(commonDialog.FileName) do
        begin
          if (Copy(commonDialog.FileName, i, 1) = '\') then
            begin
              length := i + 1;
            end;
          end;
          lastCompiled := Copy(commonDialog.FileName, length, length(commonDialog.FileName) - length - 3);
        end;
        RegainFocus;
        Exit;
        ErrorHandler:
          if (Error <> 'Cancel was selected.') then
          begin
            Application.MessageBox(pchar('Error compiling map' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
          end;
          RegainFocus;
        end;

function TfrmSoldatMapEditor.recentFiles(var FileName: widestring): Boolean;
var
  i: Smallint;
  inRecent: Boolean;
  Index: Smallint;
begin
  for i := 0 to 9 do
  begin
    if (mnuRecent(i).Caption = FileName) then
      begin
        inRecent := true;
        Index := i;
      end;
    end;
    if not inRecent then
      begin
        updateRecent(FileName);
      end
    else
    begin
      for i := Index downto 1 do
      begin
        mnuRecent(i).Caption := mnuRecent(i - 1).Caption;
      end;
      mnuRecent(0).Caption := FileName;
    end;
  end;

procedure TfrmSoldatMapEditor.mnuExport_Click;
label
ErrorHandler;
begin
  //ON ERROR
  frmSoldatMapEditor.commonDialog.Filter := 'Prefab (*.pfb)|*.pfb';
  commonDialog.InitDir := prefabDir;
  commonDialog.FileName := 'Untitled.pfb';
  frmSoldatMapEditor.commonDialog.DialogTitle := 'Save Prefab';
  commonDialog.ShowSave;
  if (commonDialog.FileName <> '') then
    begin
      savePrefab(commonDialog.FileName);
    end;
    RegainFocus;
    Exit;
    ErrorHandler:
      if (Error <> 'Cancel was selected.') then
      begin
        Application.MessageBox(pchar('Error exporting' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
      end;
      RegainFocus;
    end;

procedure TfrmSoldatMapEditor.mnuImport_Click;
label
ErrorHandler;
begin
  //ON ERROR
  commonDialog.Filter := 'Prefab (*.pfb)|*.pfb';
  commonDialog.InitDir := prefabDir;
  commonDialog.FileName := '';
  commonDialog.DialogTitle := 'Import';
  commonDialog.ShowOpen;
  if (commonDialog.FileName <> '') then
    begin
      loadPrefab(commonDialog.FileName);
    end;
    RegainFocus;
    Exit;
    ErrorHandler:
      if (Error <> 'Cancel was selected.') then
      begin
        Application.MessageBox(pchar('Error importing' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
      end;
      RegainFocus;
    end;

procedure TfrmSoldatMapEditor.savePrefab(var FileName: widestring);
var
  i: Smallint;
  j: Smallint;
  Polygon: TPolygon;
  elementName: array[0..50] of Byte;
  elementString: widestring;
  numSelCon: Smallint;
  offset: Smallint;
  tempConnection: TConnection;
  alpha: Byte;
  label
  ErrorHandler;
  begin
    //ON ERROR
    Assign(file1, FileName);
    Reset(file1);
    Write(file1, numSelectedPolys);
    for i := 1 to numSelectedPolys do
    begin
      Polygon := Polys[selectedPolys[i]];
      for j := 1 to 3 do
      begin
        Polygon.vertex[j].X := PolyCoords[selectedPolys[i]].vertex[j].X;
        Polygon.vertex[j].Y := PolyCoords[selectedPolys[i]].vertex[j].Y;
        vertexList[selectedPolys[i]].vertex[j] := 1;
        alpha := getAlpha(Polys[selectedPolys[i]].vertex[j].Color);
        Polygon.vertex[j].Color := ARGB(alpha, RGB(vertexList[selectedPolys[i]].colour[j].blue, vertexList[selectedPolys[i]].colour[j].green, vertexList[selectedPolys[i]].colour[j].red));
      end;
      Write(file1, Polygon);
      Write(file1, vertexList[selectedPolys[i]].vertex[1]);
      Write(file1, vertexList[selectedPolys[i]].vertex[2]);
      Write(file1, vertexList[selectedPolys[i]].vertex[3]);
      Write(file1, vertexList[selectedPolys[i]].polyType);
    end;
    Write(file1, numSelectedScenery);
    for i := 1 to sceneryCount do
    begin
      if (Scenery[i].selected = 1) then
        begin
          Write(file1, Scenery[i]);
          elementString := frmScenery.lstScenery.List(Scenery[i].Style - 1);
          elementName[0] := length(elementString);
          for j := 1 to elementName[0] do
          begin
            elementName[j] := Asc(Copy(elementString, j, 1));
          end;
          Write(file1, elementName);
        end;
      end;
      Write(file1, numSelColliders);
      for i := 1 to colliderCount do
      begin
        if (Colliders[i].active = 1) then
          begin
            Write(file1, Colliders[i]);
          end;
        end;
        Write(file1, numSelSpawns);
        for i := 1 to spawnPoints do
        begin
          if (Spawns[i].active = 1) then
            begin
              Write(file1, Spawns[i]);
            end;
          end;
          offset := 0;
          Write(file1, numSelWaypoints);
          for i := 1 to waypointCount do
          begin
            if Waypoints[i].selected then
              begin
                offset := offset + 1;
                Waypoints[i].tempIndex := offset;
                Write(file1, Waypoints[i]);
              end;
            end;
            numSelCon := 0;
            for i := 1 to conCount do
            begin
              if Waypoints[Connections[i].point1].selected and Waypoints[Connections[i].point2].selected then
                begin
                  numSelCon := numSelCon + 1;
                end;
              end;
              Write(file1, numSelCon);
              for i := 1 to conCount do
              begin
                if Waypoints[Connections[i].point1].selected and Waypoints[Connections[i].point2].selected then
                  begin
                    tempConnection.point1 := Waypoints[Connections[i].point1].tempIndex;
                    tempConnection.point2 := Waypoints[Connections[i].point2].tempIndex;
                    Write(file1, tempConnection);
                  end;
                end;
                for i := 1 to waypointCount do
                begin
                  Waypoints[i].tempIndex := i;
                end;
                CloseFile(file1);
                Exit;
                ErrorHandler:
                  Application.MessageBox(pchar(Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
              end;

procedure TfrmSoldatMapEditor.loadPrefab(var FileName: widestring);
var
  newPolys: Smallint;
  newScenery: Smallint;
  newElements: Smallint;
  elementName: array[0..50] of Byte;
  elementString: widestring;
  newColliders: Smallint;
  newSpawnPoints: Smallint;
  newWaypoints: Smallint;
  newConnections: Smallint;
  i: Smallint;
  j: Smallint;
  tehValue: Smallint;
  tempClr: TColour;
  label
  ErrorHandler;
  begin
    //ON ERROR
    mnuDeselect_Click;
    Assign(file1, FileName);
    Reset(file1);
    Read(file1, newPolys);
    if (newPolys > 0) then
      begin
        setlength(Polys, polyCount + newPolys);
        setlength(PolyCoords, polyCount + newPolys);
        setlength(vertexList, polyCount + newPolys);
        numSelectedPolys := newPolys;
        setlength(selectedPolys, newPolys);
        for i := 1 to newPolys do
        begin
          tehValue := polyCount + i;
          Read(file1, Polys(tehValue));
          Read(file1, vertexList(tehValue).vertex(1));
          Read(file1, vertexList(tehValue).vertex(2));
          Read(file1, vertexList(tehValue).vertex(3));
          Read(file1, vertexList(tehValue).polyType);
          for j := 1 to 3 do
          begin
            PolyCoords[tehValue].vertex[j].X := Polys[tehValue].vertex[j].X;
            PolyCoords[tehValue].vertex[j].Y := Polys[tehValue].vertex[j].Y;
            Polys[tehValue].vertex[j].X := (PolyCoords[tehValue].vertex[j].X - scrollCoords[2].X) * zoomFactor;
            Polys[tehValue].vertex[j].Y := (PolyCoords[tehValue].vertex[j].Y - scrollCoords[2].Y) * zoomFactor;
            tempClr := getRGB(Polys[tehValue].vertex[j].Color);
            vertexList[tehValue].colour[j].red := tempClr.red;
            vertexList[tehValue].colour[j].green := tempClr.green;
            vertexList[tehValue].colour[j].blue := tempClr.blue;
          end;
          selectedPolys[i] := tehValue;
        end;
        polyCount := polyCount + newPolys;
      end;
      Read(file1, newScenery);
      if (newScenery > 0) then
        begin
          if not showScenery then
            begin
              showScenery := true;
              frmDisplay.setLayer(5, showScenery);
            end;
            numSelectedScenery := newScenery;
            setlength(Scenery, sceneryCount + newScenery);
            if (newScenery > 0) then
              begin
                for i := 1 to newScenery do
                begin
                  tehValue := sceneryCount + i;
                  Read(file1, Scenery(tehValue));
                  Scenery[tehValue].screenTr.X := (Scenery[tehValue].Translation.X - scrollCoords[2].X) * zoomFactor;
                  Scenery[tehValue].screenTr.Y := (Scenery[tehValue].Translation.Y - scrollCoords[2].Y) * zoomFactor;
                  Scenery[tehValue].Style := 0;
                  Read(file1, elementName);
                  //get scenery name
                  elementString := '';
                  for j := 1 to elementName[0] do
                  begin
                    elementString := elementString + Chr(elementName[j]);
                  end; //find scenery in list
                  for j := 1 to sceneryElements do
                  begin
                    if (frmScenery.lstScenery.List(j - 1) = elementString) then
                      begin
                        Scenery[tehValue].Style := j;
                      end;
                    end; //scenery not in list, so load it
                    if (Scenery[tehValue].Style = 0) then
                      begin
                        CreateSceneryTexture(elementString);
                        Scenery[tehValue].Style := sceneryElements;
                      end;
                    end;
                  end;
                end;
                sceneryCount := sceneryCount + newScenery;
                Read(file1, newColliders);
                if (newColliders > 0) then
                  begin
                    showObjects := true;
                    numSelColliders := newColliders;
                    setlength(Colliders, colliderCount + newColliders);
                    for i := 1 to newColliders do
                    begin
                      Read(file1, Colliders(colliderCount + i));
                    end;
                    colliderCount := colliderCount + newColliders;
                  end;
                  Read(file1, newSpawnPoints);
                  if (newSpawnPoints > 0) then
                    begin
                      showObjects := true;
                      numSelSpawns := newSpawnPoints;
                      setlength(Spawns, spawnPoints + newSpawnPoints);
                      for i := 1 to newSpawnPoints do
                      begin
                        Read(file1, Spawns(spawnPoints + i));
                      end;
                      spawnPoints := spawnPoints + newSpawnPoints;
                    end;
                    Read(file1, newWaypoints);
                    if (newWaypoints > 0) then
                      begin
                        showWaypoints := true;
                        numSelWaypoints := newWaypoints;
                        setlength(Waypoints, waypointCount + newWaypoints);
                        for i := 1 to newWaypoints do
                        begin
                          Read(file1, Waypoints(waypointCount + i));
                        end;
                        Read(file1, newConnections);
                        if (newConnections > 0) then
                          begin
                            setlength(Connections, conCount + newConnections);
                            for i := 1 to newConnections do
                            begin
                              Read(file1, Connections(conCount + i));
                              Connections[conCount + i].point1 := Connections[conCount + i].point1 + waypointCount;
                              Connections[conCount + i].point2 := Connections[conCount + i].point2 + waypointCount;
                            end;
                            conCount := conCount + newConnections;
                          end;
                          waypointCount := waypointCount + newWaypoints;
                          for i := 1 to waypointCount do
                          begin
                            Waypoints[i].tempIndex := i;
                          end;
                        end;
                        frmDisplay.setLayer(6, showObjects);
                        CloseFile(file1);
                        setMapData;
                        getInfo;
                        getRCenter;
                        Exit;
                        ErrorHandler:
                          Application.MessageBox(pchar(Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
                      end;

procedure TfrmSoldatMapEditor.mnuRunSoldat_Click;
begin
  SetGameMode(lastCompiled);
  SetMapList(lastCompiled);
  RunSoldat;
end;

procedure TfrmSoldatMapEditor.SetMapList(var FileName: widestring);
begin
  Assign(file1, soldatDir + 'mapslist.txt');
  Rewrite(file1);
  Write(file1, #9, FileName);
  CloseFile(file1);
end;

procedure TfrmSoldatMapEditor.mnuUndo_Click;
begin
  loadUndo(false);
end;

procedure TfrmSoldatMapEditor.mnuRedo_Click;
begin
  loadUndo(true);
end;

procedure TfrmSoldatMapEditor.mnuDuplicate_Click;
var
  i: Smallint;
  j: Smallint;
  offset: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    if selectionChanged then
      begin
        SaveUndo;
        selectionChanged := false;
      end;
      if (numSelectedPolys > 0) then
        begin
          polyCount := polyCount + numSelectedPolys;
          setlength(Polys, polyCount);
          setlength(PolyCoords, polyCount);
          setlength(vertexList, polyCount);
          for i := 1 to numSelectedPolys do
          begin
            PolyCoords[polyCount - numSelectedPolys + i] := PolyCoords[selectedPolys[i]];
            PolyCoords[polyCount - numSelectedPolys + i].vertex[1].X := PolyCoords[selectedPolys[i]].vertex[1].X + 32;
            PolyCoords[polyCount - numSelectedPolys + i].vertex[2].X := PolyCoords[selectedPolys[i]].vertex[2].X + 32;
            PolyCoords[polyCount - numSelectedPolys + i].vertex[3].X := PolyCoords[selectedPolys[i]].vertex[3].X + 32;
            Polys[polyCount - numSelectedPolys + i] := Polys[selectedPolys[i]];
            Polys[polyCount - numSelectedPolys + i].vertex[1].X := (PolyCoords[polyCount - numSelectedPolys + i].vertex[1].X - scrollCoords[2].X) * zoomFactor;
            Polys[polyCount - numSelectedPolys + i].vertex[2].X := (PolyCoords[polyCount - numSelectedPolys + i].vertex[2].X - scrollCoords[2].X) * zoomFactor;
            Polys[polyCount - numSelectedPolys + i].vertex[3].X := (PolyCoords[polyCount - numSelectedPolys + i].vertex[3].X - scrollCoords[2].X) * zoomFactor;
            vertexList[polyCount - numSelectedPolys + i].polyType := vertexList[selectedPolys[i]].polyType;
            vertexList[polyCount - numSelectedPolys + i].colour[1] := vertexList[selectedPolys[i]].colour[1];
            vertexList[polyCount - numSelectedPolys + i].colour[2] := vertexList[selectedPolys[i]].colour[2];
            vertexList[polyCount - numSelectedPolys + i].colour[3] := vertexList[selectedPolys[i]].colour[3];
            for j := 1 to 3 do
            begin
              vertexList[selectedPolys[i]].vertex[j] := 0;
              vertexList[polyCount - numSelectedPolys + i].vertex[j] := 1;
            end;
            selectedPolys[i] := polyCount - numSelectedPolys + i;
          end;
        end;
        offset := 0;
        if (numSelectedScenery > 0) then
          begin
            setlength(Scenery, sceneryCount + numSelectedScenery);
            for i := 1 to sceneryCount do
            begin
              if (Scenery[i].selected = 1) then
                begin
                  offset := offset + 1;
                  Scenery[sceneryCount + offset] := Scenery[i];
                  Scenery[sceneryCount + offset].Translation.X := Scenery[sceneryCount + offset].Translation.X + 32;
                  Scenery[sceneryCount + offset].screenTr.X := Scenery[sceneryCount + offset].screenTr.X + 32 * zoomFactor;
                  Scenery[i].selected := 0;
                end;
              end;
              sceneryCount := sceneryCount + numSelectedScenery;
            end;
            if (numSelectedScenery > 0) or (numSelectedPolys > 0) then
              begin
                rCenter.X := rCenter.X + 32;
                selRect[0].X := selRect[0].X + 32;
                selRect[1].X := selRect[1].X + 32;
                selRect[2].X := selRect[2].X + 32;
                selRect[3].X := selRect[3].X + 32;
              end;
              offset := 0;
              for i := 1 to spawnPoints do
              begin
                if (Spawns[i].active = 1) then
                  begin
                    offset := offset + 1;
                    setlength(Spawns, spawnPoints + offset);
                    Spawns[spawnPoints + offset] := Spawns[i];
                    Spawns[spawnPoints + offset].X := Spawns[spawnPoints + offset].X + 32;
                    Spawns[i].active := 0;
                  end;
                end;
                spawnPoints := spawnPoints + offset;
                offset := 0;
                for i := 1 to colliderCount do
                begin
                  if (Colliders[i].active = 1) then
                    begin
                      offset := offset + 1;
                      setlength(Colliders, colliderCount + offset);
                      Colliders[colliderCount + offset] := Colliders[i];
                      Colliders[colliderCount + offset].X := Colliders[colliderCount + offset].X + 32;
                      Colliders[i].active := 0;
                    end;
                  end;
                  colliderCount := colliderCount + offset;
                  if (numSelWaypoints > 0) then
                    begin
                      offset := 0;
                      for i := 1 to waypointCount do
                      begin
                        if Waypoints[i].selected then
                          begin
                            offset := offset + 1;
                            setlength(Waypoints, waypointCount + offset);
                            Waypoints[waypointCount + offset] := Waypoints[i];
                            Waypoints[waypointCount + offset].X := Waypoints[waypointCount + offset].X + 32;
                            Waypoints[waypointCount + offset].tempIndex := 0;
                            Waypoints[i].tempIndex := waypointCount + offset;
                          end;
                        end;
                        waypointCount := waypointCount + offset;
                        offset := 0;
                        for i := 1 to conCount do
                        begin
                          if Waypoints[Connections[i].point1].selected and Waypoints[Connections[i].point2].selected then
                            begin
                              offset := offset + 1;
                              setlength(Connections, conCount + offset);
                              Connections[conCount + offset].point1 := Waypoints[Connections[i].point1].tempIndex;
                              Connections[conCount + offset].point2 := Waypoints[Connections[i].point2].tempIndex;
                            end;
                          end;
                          conCount := conCount + offset;
                          for i := 1 to waypointCount do
                          begin
                            if (Waypoints[i].tempIndex > 0) then
                              begin
                                Waypoints[i].selected := false;
                              end;
                              Waypoints[i].tempIndex := i;
                            end;
                          end;
                          setMapData;
                          getRCenter;
                          SaveUndo;
                          Render;
                          getInfo;
                          prompt := true;
                          Exit;
                          ErrorHandler:
                            Application.MessageBox(pchar('Duplicate error' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
                        end;

procedure TfrmSoldatMapEditor.mnuClear_Click;
begin
  deletePolys;
end;

procedure TfrmSoldatMapEditor.mnuSelectAll_Click;
var
  i: Smallint;
  j: Smallint;
begin
  if showPolys or showWireframe or showPoints then
    begin
      setlength(selectedPolys, polyCount);
      for i := 1 to polyCount do
      begin
        selectedPolys[i] := i;
        for j := 1 to 3 do
        begin
          vertexList[i].vertex[j] := 1;
        end;
      end;
      numSelectedPolys := polyCount;
    end;
    if showScenery or showWireframe or showPoints then
      begin
        numSelectedScenery := 0;
        for i := 1 to sceneryCount do
        begin
          if ((Scenery[i].level = 0) and sslBack) or ((Scenery[i].level = 1) and sslMid) or ((Scenery[i].level = 2) and sslFront) then
            begin
              Scenery[i].selected := 1;
              numSelectedScenery := numSelectedScenery + 1;
            end;
          end;
        end;
        if showObjects then
          begin
            for i := 1 to spawnPoints do
            begin
              Spawns[i].active := 1;
            end;
            numSelSpawns := spawnPoints;
            for i := 1 to colliderCount do
            begin
              Colliders[i].active := 1;
            end;
            numSelColliders := colliderCount;
          end;
          if showLights then
            begin
              for i := 1 to lightCount do
              begin
                Lights[i].selected := 1;
              end;
              numSelLights := lightCount;
            end;
            if showWaypoints then
              begin
                for i := 1 to waypointCount do
                begin
                  Waypoints[i].selected := true;
                end;
                numSelWaypoints := waypointCount;
              end;
              getRCenter;
              getInfo;
              Render;
            end;

procedure TfrmSoldatMapEditor.mnuDeselect_Click;
var
  i: Smallint;
  j: Smallint;
begin
  numSelectedPolys := 0;
  setlength(selectedPolys, 0);
  numSelectedScenery := 0;
  numSelSpawns := 0;
  numSelColliders := 0;
  numSelWaypoints := 0;
  for i := 1 to polyCount do
  begin
    for j := 1 to 3 do
    begin
      vertexList[i].vertex[j] := 0;
    end;
  end;
  for i := 1 to sceneryCount do
  begin
    Scenery[i].selected := 0;
  end;
  for i := 1 to colliderCount do
  begin
    Colliders[i].active := 0;
  end;
  for i := 1 to spawnPoints do
  begin
    Spawns[i].active := 0;
  end;
  for i := 1 to waypointCount do
  begin
    Waypoints[i].selected := false;
  end;
  Render;
  getInfo;
end;

procedure TfrmSoldatMapEditor.mnuSelColour_Click;
var
  i: Smallint;
  j: Smallint;
  addPoly: Byte;
  clrVal: TColour;
begin
  numSelectedPolys := 0;
  setlength(selectedPolys, 0);
  for i := 1 to polyCount do
  begin
    for j := 1 to 3 do
    begin
      vertexList[i].vertex[j] := 0;
      clrVal := getRGB(Polys[i].vertex[j].Color);
      if (clrVal.red = polyClr.red) and (clrVal.green = polyClr.green) and (clrVal.blue = polyClr.blue) then
        begin
          addPoly := 1;
          vertexList[i].vertex[j] := 1;
        end;
      end;
      if (addPoly = 1) then
        begin
          numSelectedPolys := numSelectedPolys + 1;
          setlength(selectedPolys, numSelectedPolys);
          selectedPolys[numSelectedPolys] := i;
        end;
        addPoly := 0;
      end;
      Render;
    end;

procedure TfrmSoldatMapEditor.mnuBringToFront_Click;
var
  i: Smallint;
  j: Smallint;
  tempTri: TTriangle;
  tempPoly: TPolygon;
  tempScenery: TScenery;
  tempVertex: TVertexData;
  offset: Smallint;
begin
  if selectionChanged then
    begin
      SaveUndo;
      selectionChanged := false;
    end;
    if (numSelectedPolys > 0) then
      begin
        offset := polyCount;
        for i := polyCount downto 1 do
        begin
          if ((vertexList[i].vertex[1] + vertexList[i].vertex[2] + vertexList[i].vertex[3]) > 0) //if selected then
            begin
              tempPoly := Polys[i];
              tempTri := PolyCoords[i];
              tempVertex := vertexList[i];
              for j := i to (offset - 1) do
              begin
                Polys[j] := Polys[j + 1];
                PolyCoords[j] := PolyCoords[j + 1];
                vertexList[j] := vertexList[j + 1];
              end;
              Polys[offset] := tempPoly;
              PolyCoords[offset] := tempTri;
              vertexList[offset] := tempVertex;
              selectedPolys[polyCount - offset + 1] := offset;
              offset := offset - 1;
            end;
          end;
        end;
        if (numSelectedScenery > 0) then
          begin
            offset := sceneryCount;
            for i := sceneryCount downto 1 do
            begin
              if Scenery[i].selected //if selected then
                begin
                  tempScenery := Scenery[i];
                  for j := i to (offset - 1) do
                  begin
                    Scenery[j] := Scenery[j + 1];
                  end;
                  Scenery[offset] := tempScenery;
                  offset := offset - 1;
                end;
              end;
            end;
            prompt := true;
            SaveUndo;
            Render;
            getInfo;
          end;

procedure TfrmSoldatMapEditor.mnuSendToBack_Click;
var
  i, j, offset: Smallint;
  tempTri: TTriangle;
  tempPoly: TPolygon;
  tempScenery: TScenery;
  tempVertex: TVertexData;
begin
  if selectionChanged then
  begin
    SaveUndo;
    selectionChanged := false;
  end;

  if numSelectedPolys > 0 then
  begin
    offset := 1;
    for i := 1 to polyCount do
    begin
      if (vertexList[i].vertex[1] + vertexList[i].vertex[2] + vertexList[i].vertex[3]) > 0 then  // if selected
      begin
        tempPoly := Polys[i];
        tempTri := PolyCoords[i];
        tempVertex := vertexList[i];

        for j := i downto offset + 1 do
        begin
          Polys[j] := Polys[j - 1];
          PolyCoords[j] := PolyCoords[j - 1];
          vertexList[j] := vertexList[j - 1];
        end;

        Polys[offset] := tempPoly;
        PolyCoords[offset] := tempTri;
        vertexList[offset] := tempVertex;
        selectedPolys[offset] := offset;
        offset := offset + 1;
      end;
    end;
  end;

  if numSelectedScenery > 0 then
  begin
    offset := 1;

    for i := 1 to sceneryCount do
    begin
      if Scenery[i].selected = 1 then  // if selected
      begin
        tempScenery := Scenery[i];

        for j := i downto offset + 1 do
        begin
          Scenery[j] := Scenery[j - 1];
        end;

        Scenery[offset] := tempScenery;
        offset := offset + 1;
      end;
    end;
  end;

  prompt := true;

  SaveUndo;
  Render;
  getInfo;
end;

procedure TfrmSoldatMapEditor.mnuBringForward_Click;
var
  i, offset: Smallint;
  tempTri: TTriangle;
  tempPoly: TPolygon;
  tempScenery: TScenery;
  tempVertex: TVertexData;
begin
  if selectionChanged then
  begin
    SaveUndo;
    selectionChanged := false;
  end;

  if numSelectedPolys > 0 then
  begin
    offset := polyCount;

    for i := (polyCount - 1) downto 1 do
    begin
      if (vertexList[i].vertex[1] + vertexList[i].vertex[2] + vertexList[i].vertex[3]) > 0) then  // if selected begin
        if (vertexList[i + 1].vertex[1] + vertexList[i + 1].vertex[2] + vertexList[i + 1].vertex[3]) > 0 then
        begin
          selectedPolys[polyCount - offset + 1] := i + 1;
          offset := offset - 1;
        end
        else
        begin
          tempPoly := Polys[i];
          tempTri := PolyCoords[i];
          tempVertex := vertexList[i];
          Polys[i] := Polys[i + 1];
          PolyCoords[i] := PolyCoords[i + 1];
          vertexList[i] := vertexList[i + 1];
          Polys[i + 1] := tempPoly;
          PolyCoords[i + 1] := tempTri;
          vertexList[i + 1] := tempVertex;
          selectedPolys[polyCount - offset + 1] := i + 1;
          offset := offset - 1;
        end;
      end;
    end;
  end;

  if numSelectedScenery > 0 then
  begin
    offset := sceneryCount;
    for i := (sceneryCount - 1) downto 1 do
    begin
      if Scenery[i].selected = 1 then //if selected
      begin
        if Scenery[i + 1].selected = 1 then
        begin
          offset := offset - 1;
        end
        else
        begin
          tempScenery := Scenery[i];
          Scenery[i] := Scenery[i + 1];
          Scenery[i + 1] := tempScenery;
          offset := offset - 1;
        end;
      end;
    end;
  end;

  prompt := true;

  SaveUndo;
  Render;
  getInfo;
end;

procedure TfrmSoldatMapEditor.mnuSendBackward_Click;
var
  i, offset: Smallint;
  tempTri: TTriangle;
  tempPoly: TPolygon;
  tempVertex: TVertexData;
  tempScenery: TScenery;
begin
  if selectionChanged then
  begin
    SaveUndo;
    selectionChanged := false;
  end;

  if numSelectedPolys > 0 then
  begin
    offset := 1;
    for i := 2 to polyCount do
    begin
      if (vertexList[i].vertex[1] + vertexList[i].vertex[2] + vertexList[i].vertex[3]) > 0 then  // if selected
      begin
        if (vertexList[i - 1].vertex[1] + vertexList[i - 1].vertex[2] + vertexList[i - 1].vertex[3]) > 0 then
        begin
          selectedPolys[offset] := i - 1;
          offset := offset + 1;
        end
        else
        begin
          tempPoly := Polys[i];
          tempTri := PolyCoords[i];
          tempVertex := vertexList[i];
          Polys[i] := Polys[i - 1];
          PolyCoords[i] := PolyCoords[i - 1];
          vertexList[i] := vertexList[i - 1];
          Polys[i - 1] := tempPoly;
          PolyCoords[i - 1] := tempTri;
          vertexList[i - 1] := tempVertex;
          selectedPolys[offset] := i - 1;
          offset := offset + 1;
        end;
      end;
    end;
  end;

  if numSelectedScenery > 0 then
  begin
    offset := 1;

    for i := 2 to sceneryCount do
    begin
      if Scenery[i].selected = 1 then  // if selected
      begin
        if Scenery[i - 1].selected = 1 then
        begin
          offset := offset + 1;
        end
        else
        begin
          tempScenery := Scenery[i];
          Scenery[i] := Scenery[i - 1];
          Scenery[i - 1] := tempScenery;
          offset := offset + 1;
        end;
      end;
    end;
  end;

  prompt := true;

  SaveUndo;
  Render;
  getInfo;
end;

procedure TfrmSoldatMapEditor.mnuFixTexture_Click;
var
  PolyNum, i, j: Smallint;
begin
  if selectionChanged then
  begin
    SaveUndo;
    selectionChanged := false;
  end;

  if numSelectedPolys > 0 then
  begin
    for i := 1 to numSelectedPolys do
    begin
      PolyNum := selectedPolys[i];

      for j := 1 to 3 do
      begin
        if vertexList[PolyNum].vertex[j] = 1 then
        begin
          Polys[PolyNum].vertex[j].tu := PolyCoords[PolyNum].vertex[j].X / xTexture;
          Polys[PolyNum].vertex[j].tv := PolyCoords[PolyNum].vertex[j].Y / yTexture;
        end;
      end;
    end;

    prompt := true;
  end;

  SaveUndo;
  Render;
  getInfo;
end;

procedure TfrmSoldatMapEditor.mnuUntexture_Click;
var
  i, j: Smallint;
begin
  if selectionChanged then
  begin
    SaveUndo;
    selectionChanged := false;
  end;

  if numSelectedPolys > 0 then
  begin
    for i := 1 to numSelectedPolys do
    begin
      for j := 1 to 3 do
      begin
        if vertexList[selectedPolys[i]].vertex[j] = 1 then
        begin
          Polys[selectedPolys[i]].vertex[j].tu := 1;
          Polys[selectedPolys[i]].vertex[j].tv := 1;
        end;
      end;
    end;

    prompt := true;
  end;

  SaveUndo;
  Render;
  getInfo;
end;

procedure TfrmSoldatMapEditor.mnuVisible_Click;
var
  i, j: Smallint;
label
  ErrorHandler;
begin
  //ON ERROR
  if selectionChanged then
  begin
    SaveUndo;
    selectionChanged := false;
  end;

  for i := 1 to numSelectedPolys do
  begin
    for j := 1 to 3 do
    begin
      if Polys[selectedPolys[i]].vertex[j].z < 0 then
      begin
        Polys[selectedPolys[i]].vertex[j].rhw := 1;
        Polys[selectedPolys[i]].vertex[j].z := 1;
      end
      else
      begin
        Polys[selectedPolys[i]].vertex[j].rhw := -10;
        Polys[selectedPolys[i]].vertex[j].z := -1;
      end;
    end;
  end;

  prompt := true;

  SaveUndo;
  Render;
  Exit;

ErrorHandler:
  Application.MessageBox(pchar(Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
end;

procedure TfrmSoldatMapEditor.mnuAverage_Click;
begin
  AverageVertices;
end;

procedure TfrmSoldatMapEditor.mnuApplyLight_Click;
var
  i, j: Smallint;
  tehClr: TColour;
begin
  if lightCount = 0 then
  begin
    Exit;
  end;

  if numSelectedPolys > 0 then
  begin
    for i := 1 to numSelectedPolys do
    begin
      for j := 1 to 3 do
      begin
        // apply poly colour to base color
        tehClr := getRGB(Polys[selectedPolys[i]].vertex[j].Color);
        vertexList[selectedPolys[i]].colour[j].red := tehClr.red;
        vertexList[selectedPolys[i]].colour[j].green := tehClr.green;
        vertexList[selectedPolys[i]].colour[j].blue := tehClr.blue;
      end;
    end;
  end
  else
  begin
    for i := 1 to polyCount do
    begin
      for j := 1 to 3 do
      begin
        // apply poly colour to base color
        tehClr := getRGB(Polys[i].vertex[j].Color);
        vertexList[i].colour[j].red := tehClr.red;
        vertexList[i].colour[j].green := tehClr.green;
        vertexList[i].colour[j].blue := tehClr.blue;
      end;
    end;
  end;

  setlength(Lights, 0);
  lightCount := 0;

  Render;
end;

procedure TfrmSoldatMapEditor.mnuSplit_Click;
var
  i, j, newPolys: Smallint;
  left, right, alpha1, alpha2: Byte;
  clr1, clr2: TColour;
begin
  if numSelectedPolys < 1 then
  begin
    Exit;
  end;

  if selectionChanged then
  begin
    SaveUndo;
    selectionChanged := false;
  end;

  for i := 1 to numSelectedPolys do
  begin
    for j := 1 to 3 do
    begin
      if vertexList[selectedPolys[i]].vertex[j] = 1 then
      begin
        if j = 1 then
        begin
          left := 2;
          right := 3;
        end
        else if j = 2 then
        begin
          left := 3;
          right := 1;
        end
        else if j = 3 then
        begin
          left := 1;
          right := 2;
        end;

        polyCount := polyCount + 1;
        newPolys := newPolys + 1;
        setlength(Polys, polyCount);
        setlength(PolyCoords, polyCount);
        setlength(vertexList, polyCount);
        setlength(selectedPolys, numSelectedPolys + newPolys);
        selectedPolys[numSelectedPolys + newPolys] := polyCount;
        vertexList[polyCount].vertex[j] := 1;
        PolyCoords[polyCount].vertex[j] := PolyCoords[selectedPolys[i]].vertex[j];
        PolyCoords[polyCount].vertex[left] := PolyCoords[selectedPolys[i]].vertex[left];
        PolyCoords[polyCount].vertex[right].X := Midpoint(
          PolyCoords[selectedPolys[i]].vertex[left].X,
          PolyCoords[selectedPolys[i]].vertex[right].X);
        PolyCoords[polyCount].vertex[right].Y := Midpoint(
          PolyCoords[selectedPolys[i]].vertex[left].Y,
          PolyCoords[selectedPolys[i]].vertex[right].Y);
        PolyCoords[selectedPolys[i]].vertex[left] := PolyCoords[polyCount].vertex[right];
        Polys[polyCount].vertex[j] := Polys[selectedPolys[i]].vertex[j];
        Polys[polyCount].vertex[left] := Polys[selectedPolys[i]].vertex[left];
        Polys[polyCount].Perp.vertex(1).z := 2;
        Polys[polyCount].Perp.vertex(2).z := 2;
        Polys[polyCount].Perp.vertex(3).z := 2;

        //coords
        Polys[polyCount].vertex[right] := Polys[selectedPolys[i]].vertex[right];
        Polys[polyCount].vertex[right].X := (PolyCoords[polyCount].vertex[right].X - scrollCoords[2].X) * zoomFactor;
        Polys[polyCount].vertex[right].Y := (PolyCoords[polyCount].vertex[right].Y - scrollCoords[2].Y) * zoomFactor;

        //texture coords
        Polys[polyCount].vertex[right].tu := Midpoint(Polys[selectedPolys[i]].vertex[right].tu, Polys[polyCount].vertex[left].tu);
        Polys[polyCount].vertex[right].tv := Midpoint(Polys[selectedPolys[i]].vertex[right].tv, Polys[polyCount].vertex[left].tv);
        vertexList[polyCount].colour[j] := vertexList[selectedPolys[i]].colour[j];
        vertexList[polyCount].colour[left] := vertexList[selectedPolys[i]].colour[left];

        //colors
        clr1 := vertexList[selectedPolys[i]].colour[right];
        clr2 := vertexList[polyCount].colour[left];
        vertexList[polyCount].colour[right].red := clr1.red * 0.5 + clr2.red * 0.5;
        vertexList[polyCount].colour[right].green := clr1.green * 0.5 + clr2.green * 0.5;
        vertexList[polyCount].colour[right].blue := clr1.blue * 0.5 + clr2.blue * 0.5;
        vertexList[selectedPolys[i]].colour[left] := vertexList[polyCount].colour[right];
        clr1 := getRGB(Polys[selectedPolys[i]].vertex[right].Color);
        clr2 := getRGB(Polys[polyCount].vertex[left].Color);
        alpha1 := getAlpha(Polys[selectedPolys[i]].vertex[right].Color);
        alpha2 := getAlpha(Polys[polyCount].vertex[left].Color);
        Polys[polyCount].vertex[right].Color := ARGB((alpha1 * 0.5 + alpha2 * 0.5),
          RGB((clr1.blue * 0.5 + clr2.blue * 0.5),
            (clr1.green * 0.5 + clr2.green * 0.5),
            (clr1.red * 0.5 + clr2.red * 0.5)));
        Polys[selectedPolys[i]].vertex[left] := Polys[polyCount].vertex[right];
        vertexList[polyCount].polyType := vertexList[selectedPolys[i]].polyType;
      end;
    end;
  end;

  numSelectedPolys := numSelectedPolys + newPolys;

  SaveUndo;
  Render;
  getInfo;

  frmInfo.lblCount(0).Caption := polyCount;
  frmInfo.lblCount(6).Caption := getMapDimensions;
end;

procedure TfrmSoldatMapEditor.mnuJoinVertices_Click;
var
  firstVertex, i, j: Smallint;
begin
  if selectionChanged then
  begin
    SaveUndo;
    selectionChanged := false;
  end;

  if numSelectedPolys > 0 then
  begin
    for j := 1 to 3 do
    begin
      if vertexList[selectedPolys[1]].vertex[4 - j] = 1 then
      begin
        firstVertex := 4 - j;
      end;
    end;

    for i := 2 to numSelectedPolys do
    begin
      for j := 1 to 3 do
      begin
        if vertexList[selectedPolys[i]].vertex[j] = 1 then
        begin
          PolyCoords[selectedPolys[i]].vertex[j].X := PolyCoords[selectedPolys[1]].vertex[firstVertex].X;
          PolyCoords[selectedPolys[i]].vertex[j].Y := PolyCoords[selectedPolys[1]].vertex[firstVertex].Y;
          Polys[selectedPolys[i]].vertex[j].X := Polys[selectedPolys[1]].vertex[firstVertex].X;
          Polys[selectedPolys[i]].vertex[j].Y := Polys[selectedPolys[1]].vertex[firstVertex].Y;
        end;
      end;
    end;
    prompt := true;
  end;

  SaveUndo;
  Render;
  getInfo;
end;

procedure TfrmSoldatMapEditor.mnuCreate_Click;
var
  i, j, numSelVerts: Smallint;
  temp: D3DVECTOR2;
  tempVertex: TCustomVertex;
  tempClr: TColour;
begin
  if (numSelectedPolys < 1) or (numSelectedPolys > 3) then
  begin
    Exit;
  end;

  if selectionChanged then
  begin
    SaveUndo;
    selectionChanged := false;
  end;

  setlength(Polys, polyCount + 1);
  setlength(PolyCoords, polyCount + 1);
  setlength(vertexList, polyCount + 1);

  for i := 1 to numSelectedPolys do
  begin
    for j := 1 to 3 do
    begin
      if vertexList[selectedPolys[i]].vertex[j] = 1 then
      begin
        numSelVerts := numSelVerts + 1;
        Polys[polyCount + 1].vertex[numSelVerts] := Polys[selectedPolys[i]].vertex[j];
        PolyCoords[polyCount + 1].vertex[numSelVerts] := PolyCoords[selectedPolys[i]].vertex[j];
        vertexList[polyCount + 1].colour[numSelVerts] := vertexList[selectedPolys[i]].colour[j];
        vertexList[polyCount + 1].polyType := vertexList[selectedPolys[i]].polyType;
      end;

      if numSelVerts = 3 then
      begin
        Break;
      end;
    end;

    if numSelVerts = 3 then
    begin
      Break;
    end;
  end;

  if numSelVerts > 2 then
  begin
    polyCount := polyCount + 1;
  end;

  if not isCW(polyCount) then  // switch to make cw
  begin
    temp := PolyCoords[polyCount].vertex[3];
    PolyCoords[polyCount].vertex[3] := PolyCoords[polyCount].vertex[2];
    PolyCoords[polyCount].vertex[2] := temp;
    tempVertex := Polys[polyCount].vertex[3];
    Polys[polyCount].vertex[3] := Polys[polyCount].vertex[2];
    Polys[polyCount].vertex[2] := tempVertex;
    tempClr := vertexList[polyCount].colour[3];
    vertexList[polyCount].colour[3] := vertexList[polyCount].colour[2];
    vertexList[polyCount].colour[2] := tempClr;
  end;

  Polys[polyCount].Perp.vertex(1).z := 2;
  Polys[polyCount].Perp.vertex(2).z := 2;
  Polys[polyCount].Perp.vertex(3).z := 2;
  frmInfo.lblCount(0).Caption := polyCount;
  frmInfo.lblCount(6).Caption := getMapDimensions;

  SaveUndo;
  Render;
end;

procedure TfrmSoldatMapEditor.mnuSever_Click;
var
  i, offset, numConnections: Smallint;
begin
  if selectionChanged then
  begin
    SaveUndo;
    selectionChanged := false;
  end;

  numConnections := conCount;
  if numSelWaypoints > 1 then
  begin
    offset := 1;
    for i := 1 to conCount do
    begin
      Connections[offset] := Connections[i];
      if Waypoints[Connections[i].point1].selected and Waypoints[Connections[i].point2].selected then
        begin
          numConnections := numConnections - 1;
          Waypoints[Connections[i].point1].numConnections := Waypoints[Connections[i].point1].numConnections - 1;
        end
      else
      begin
        offset := offset + 1;
      end;
    end;
  end
  else if numSelWaypoints = 1 then
  begin
    offset := 1;
    for i := 1 to conCount do
    begin
      Connections[offset] := Connections[i];
      if Waypoints[Connections[i].point1].selected or Waypoints[Connections[i].point2].selected then
        begin
          numConnections := numConnections - 1;
          Waypoints[Connections[i].point1].numConnections := Waypoints[Connections[i].point1].numConnections - 1;
        end
      else
      begin
        offset := offset + 1;
      end;
    end;
  end;

  conCount := numConnections;
  setlength(Connections, conCount);
  SaveUndo;
  Render;
end;

procedure TfrmSoldatMapEditor.mnuRefreshBG_Click;
var
  i, j, bgSize, xOffset, yOffset: Smallint;
begin
  maxX := 0;
  maxY := 0;
  minX := 0;
  minY := 0;

  if polyCount > 0 then
  begin
    for i := 1 to polyCount do
    begin
      for j := 1 to 3 do
      begin
        if PolyCoords[i].vertex[j].X > maxX then
        begin
          maxX := PolyCoords[i].vertex[j].X;
        end;
        if PolyCoords[i].vertex[j].X < minX then
        begin
          minX := PolyCoords[i].vertex[j].X;
        end;
        if PolyCoords[i].vertex[j].Y > maxY then
        begin
          maxY := PolyCoords[i].vertex[j].Y;
        end;
        if PolyCoords[i].vertex[j].Y < minY then
        begin
          minY := PolyCoords[i].vertex[j].Y;
        end;
      end;
    end;
  end;

  xOffset := Floor(Midpoint(maxX, minX));
  yOffset := Floor(Midpoint(maxY, minY));
  if (maxX - minX) > (maxY - minY) then
  begin
    bgSize := maxX - xOffset;
  end
  else
  begin
    bgSize := maxY - xOffset;
  end;

  bgPolyCoords[1].X := xOffset - (bgSize + 640);
  bgPolyCoords[1].Y := yOffset - (bgSize + 640);
  bgPolyCoords[2].X := xOffset - (bgSize + 640);
  bgPolyCoords[2].Y := yOffset + (bgSize + 640);
  bgPolyCoords[3].X := xOffset + (bgSize + 640);
  bgPolyCoords[3].Y := yOffset - (bgSize + 640);
  bgPolyCoords[4].X := xOffset + (bgSize + 640);
  bgPolyCoords[4].Y := yOffset + (bgSize + 640);

  for i := 1 to 4 do
  begin
    bgPolys[i].X := (bgPolyCoords[i].X - scrollCoords[2].X) * zoomFactor;
    bgPolys[i].Y := (bgPolyCoords[i].Y - scrollCoords[2].Y) * zoomFactor;
  end;

  frmInfo.lblCount(6).Caption := getMapDimensions;
  Render;
end;

procedure TfrmSoldatMapEditor.mnuPreferences_Click;
begin
  frmPreferences.Show(1);
  PolyTypeClrs[0] := frmSoldatMapEditor.selectionClr;
end;

procedure TfrmSoldatMapEditor.mnuMap_Click;
begin
  frmMap.Show(1);
  ctrlDown := false;
  setCurrentTool(currentTool);
end;

procedure TfrmSoldatMapEditor.mnuZoomIn_Click;
begin
  Zoom(2);
end;

procedure TfrmSoldatMapEditor.mnuZoomOut_Click;
begin
  Zoom(0.5);
end;

procedure TfrmSoldatMapEditor.mnuGrid_Click;
begin
  mnuGrid.Checked := not mnuGrid.Checked;
  showGrid := mnuGrid.Checked;
  frmDisplay.setLayer(8, mnuGrid.Checked);
  Render;
end;

procedure TfrmSoldatMapEditor.mnuSnapToGrid_Click;
begin
  mnuSnapToGrid.Checked := not mnuSnapToGrid.Checked;
  snapToGrid := mnuSnapToGrid.Checked;
end;

procedure TfrmSoldatMapEditor.mnuRefresh_Click;
begin
  resetDevice;
end;

procedure TfrmSoldatMapEditor.mnuTools_Click;
begin
  mnuTools.Checked := not mnuTools.Checked;
  frmTools.Visible := mnuTools.Checked;
end;

procedure TfrmSoldatMapEditor.mnuDisplay_Click;
begin
  mnuDisplay.Checked := not mnuDisplay.Checked;
  frmDisplay.Visible := mnuDisplay.Checked;
end;

procedure TfrmSoldatMapEditor.mnuPalette_Click;
begin
  mnuPalette.Checked := not mnuPalette.Checked;
  frmPalette.Visible := mnuPalette.Checked;
end;

procedure TfrmSoldatMapEditor.mnuWaypoints_Click;
begin
  mnuWaypoints.Checked := not mnuWaypoints.Checked;
  frmWaypoints.Visible := mnuWaypoints.Checked;
end;

procedure TfrmSoldatMapEditor.mnuScenery_Click;
begin
  mnuScenery.Checked := not mnuScenery.Checked;
  frmScenery.Visible := mnuScenery.Checked;
end;

procedure TfrmSoldatMapEditor.mnuinfo_Click;
begin
  mnuInfo.Checked := not mnuInfo.Checked;
  frmInfo.Visible := mnuInfo.Checked;
end;

procedure TfrmSoldatMapEditor.mnuTexture_Click;
begin
  mnuTexture.Checked := not mnuTexture.Checked;
  frmTexture.Visible := mnuTexture.Checked;
end;

procedure TfrmSoldatMapEditor.mnuBlendWireframe_Click;
begin
  mnuBlendWireframe.Checked := not mnuBlendWireframe.Checked;
  clrWireframe := mnuBlendWireframe.Checked;
end;

procedure TfrmSoldatMapEditor.mnuBlendPolys_Click;
begin
  mnuBlendPolys.Checked := not mnuBlendPolys.Checked;
  clrPolys := mnuBlendPolys.Checked;
end;

procedure TfrmSoldatMapEditor.mnuFixedTexture_Click;
begin
  mnuFixedTexture.Checked := not mnuFixedTexture.Checked;
  fixedTexture := mnuFixedTexture.Checked;
end;

procedure TfrmSoldatMapEditor.mnuSnapToVerts_Click;
begin
  mnuSnapToVerts.Checked := not mnuSnapToVerts.Checked;
  ohSnap := mnuSnapToVerts.Checked;
end;

procedure TfrmSoldatMapEditor.mnuLoadSpace_Click;
label
  ErrorHandler;
begin
  //ON ERROR
  frmSoldatMapEditor.commonDialog.Filter := 'Ini File (*.ini)|*.ini';
  commonDialog.InitDir := appPath + '\Workspace\';
  commonDialog.FileName := '';
  frmSoldatMapEditor.commonDialog.DialogTitle := 'Load Workspace';
  commonDialog.ShowOpen;

  if commonDialog.FileName <> '' then
    begin
      if length(Dir(appPath + '\Workspace\' + commonDialog.FileTitle)) <> 0 then
      begin
        loadWorkspace(commonDialog.FileTitle);
        frmTools.setForm;
        frmDisplay.setForm;
        frmInfo.setForm;
        frmPalette.setForm;
        frmScenery.setForm;
        frmTexture.setForm;
        frmWaypoints.setForm;
      end;
    end;

    RegainFocus;
    Exit;

    ErrorHandler:
      RegainFocus;
  end;

procedure TfrmSoldatMapEditor.mnuSaveSpace_Click;
var
  iniString, sNull: widestring;
label
  ErrorHandler;
begin
  // ON ERROR
  sNull := Chr(0);
  frmSoldatMapEditor.commonDialog.Filter := 'Ini File (*.ini)|*.ini';
  commonDialog.InitDir := appPath + '\Workspace\';
  commonDialog.FileName := '';
  frmSoldatMapEditor.commonDialog.DialogTitle := 'Save Workspace';
  commonDialog.ShowSave;

  if commonDialog.FileName <> '' then
  begin
    iniString := 'WindowState=' + self.WindowState + sNull +
      'Width=' + formWidth + sNull + 'Height=' + formHeight + sNull +
      'Left=' + formLeft + sNull + 'Top=' + formTop + sNull + sNull;
    saveSection('Main', iniString, appPath + '\workspace\' + commonDialog.FileTitle);
    saveWindow('Tools', frmTools, false, commonDialog.FileTitle);
    saveWindow('Display', frmDisplay, frmDisplay.collapsed, commonDialog.FileTitle);
    saveWindow('Properties', frmInfo, frmInfo.collapsed, commonDialog.FileTitle);
    saveWindow('Palette', frmPalette, frmPalette.collapsed, commonDialog.FileTitle);
    saveWindow('Scenery', frmScenery, frmScenery.collapsed, commonDialog.FileTitle);
    saveWindow('Waypoints', frmWaypoints, frmWaypoints.collapsed, commonDialog.FileTitle);
    saveWindow('Texture', frmTexture, frmTexture.collapsed, commonDialog.FileTitle);
  end;

  RegainFocus;
  Exit;

  ErrorHandler:
    RegainFocus;
end;

procedure TfrmSoldatMapEditor.mnuResetWindows_Click;
begin
  if (self.WindowState = vbNormal) then
    begin
      formWidth := Screen.Width / Screen.TwipsPerPixelX - (64 + 208 + 208);
      formHeight := formWidth * 3 / 4;
      formLeft := Screen.Width / Screen.TwipsPerPixelX / 2 - formWidth / 2 - 1;
      formTop := Screen.Height / Screen.TwipsPerPixelY / 2 - formHeight / 2 - 1;
      tvwScenery.Height := formHeight - 41 - 20;
      self.Width := formWidth * Screen.TwipsPerPixelX;
      self.Height := formHeight * Screen.TwipsPerPixelY;
      self.Left := Screen.Width / 2 - self.Width / 2 - Screen.TwipsPerPixelX;
      self.Top := Screen.Height / 2 - self.Height / 2 - Screen.TwipsPerPixelY;
      frmTools.left := self.Left - frmTools.Width + Screen.TwipsPerPixelX;
      frmTools.Top := self.Top + 41 * Screen.TwipsPerPixelY;
      frmPalette.left := self.Left + self.Width - Screen.TwipsPerPixelX;
      frmPalette.Top := self.Top + 41 * Screen.TwipsPerPixelY;
      frmDisplay.left := frmPalette.left;
      frmDisplay.Top := frmPalette.Top + frmPalette.Height - Screen.TwipsPerPixelY;
      frmScenery.left := self.Left + self.Width - Screen.TwipsPerPixelX;
      frmScenery.Top := frmDisplay.Top + frmDisplay.Height - Screen.TwipsPerPixelY;
      frmInfo.left := self.Left - frmInfo.Width + Screen.TwipsPerPixelX;
      frmInfo.Top := frmTools.Top + frmTools.Height - Screen.TwipsPerPixelY;
      frmWaypoints.left := self.Left - frmWaypoints.Width + Screen.TwipsPerPixelX;
      frmWaypoints.Top := frmInfo.Top + frmInfo.Height - Screen.TwipsPerPixelY;
      frmTexture.Top := frmPalette.Top;
      frmTexture.left := frmPalette.left - frmTexture.Width + Screen.TwipsPerPixelX;
      resetDevice;
    end
  else
  begin
    frmTools.left := self.Left;
    frmTools.Top := self.Top + 41 * Screen.TwipsPerPixelY;
    frmPalette.left := self.Left + self.Width - frmPalette.Width;
    frmPalette.Top := self.Top + 41 * Screen.TwipsPerPixelY;
    frmDisplay.left := frmPalette.left;
    frmDisplay.Top := frmPalette.Top + frmPalette.Height - Screen.TwipsPerPixelY;
    frmWaypoints.left := self.Left;
    frmWaypoints.Top := self.Top + self.Height - frmWaypoints.Height - 19 * Screen.TwipsPerPixelY;
    frmScenery.left := self.Left + self.Width - frmScenery.Width;
    frmScenery.Top := frmDisplay.Top + frmDisplay.Height - Screen.TwipsPerPixelY;
    frmInfo.left := self.Left;
    frmInfo.Top := frmWaypoints.Top - frmInfo.Height + Screen.TwipsPerPixelY;
    frmTexture.Top := frmPalette.Top;
    frmTexture.left := frmPalette.left - frmTexture.Width + Screen.TwipsPerPixelX;
  end;
end;

procedure TfrmSoldatMapEditor.mnuShowAll_Click;
begin
  mnuTools.Checked := true;
  frmTools.Visible := true;
  mnuPalette.Checked := true;
  frmPalette.Visible := true;
  mnuDisplay.Checked := true;
  frmDisplay.Visible := true;
  mnuScenery.Checked := true;
  frmScenery.Visible := true;
  mnuInfo.Checked := true;
  frmInfo.Visible := true;
  mnuTexture.Checked := true;
  frmTexture.Visible := true;
  mnuWaypoints.Checked := true;
  frmWaypoints.Visible := true;
end;

procedure TfrmSoldatMapEditor.mnuHideAll_Click;
begin
  mnuTools.Checked := false;
  frmTools.Visible := false;
  mnuPalette.Checked := false;
  frmPalette.Visible := false;
  mnuDisplay.Checked := false;
  frmDisplay.Visible := false;
  mnuScenery.Checked := false;
  frmScenery.Visible := false;
  mnuInfo.Checked := false;
  frmInfo.Visible := false;
  mnuTexture.Checked := false;
  frmTexture.Visible := false;
  mnuWaypoints.Checked := false;
  frmWaypoints.Visible := false;
end;

procedure TfrmSoldatMapEditor.mnuGostek_Click;
begin
  if mnuGostek.Checked then
    begin
      gostek.X := 0;
      gostek.Y := 0;
    end
  else
  begin
    mnuGostek.Checked := true;
    mnuSpawn(Spawns[0].Team).Checked := false;
    mnuCollider.Checked := false;
  end;
end;

procedure TfrmSoldatMapEditor.mnuCollider_Click;
begin
  mnuCollider.Checked := true;
  mnuSpawn(Spawns[0].Team).Checked := false;
  mnuGostek.Checked := false;
  Colliders[0].radius := clrRadius;
end;

procedure TfrmSoldatMapEditor.mnuSpawn_Click(var Index: Smallint);
begin
  mnuCollider.Checked := false;
  mnuSpawn(Spawns[0].Team).Checked := false;
  mnuSpawn(Index).Checked := true;
  mnuGostek.Checked := false;
  Spawns[0].Team := Index;
end;

procedure TfrmSoldatMapEditor.mnuPolyType_Click(var Index: Smallint);
begin
  mnuPolyType(polyType).Checked := false;
  mnuPolyType(Index).Checked := true;
  polyType := Index;
  lblCurrentTool.Caption := frmSoldatMapEditor.ImageList.ListImages(currentFunction + 1).Tag + ' (' + mnuPolyType(polyType).Caption + ')';
end;

procedure TfrmSoldatMapEditor.mnuQuad_Click;
begin
  mnuQuad.Checked := not mnuQuad.Checked;
  if mnuQuad.Checked then
    begin
      currentFunction := TOOL_QUAD;
      SetCursor(currentFunction + 1);
      lblCurrentTool.Caption := frmSoldatMapEditor.ImageList.ListImages(currentFunction + 1).Tag;
    end
  else
  begin
    currentFunction := TOOL_CREATE;
    SetCursor(currentFunction + 1);
    lblCurrentTool.Caption := frmSoldatMapEditor.ImageList.ListImages(currentFunction + 1).Tag;
  end;
  lblCurrentTool.Caption := frmSoldatMapEditor.ImageList.ListImages(currentFunction + 1).Tag + ' (' + mnuPolyType(polyType).Caption + ')';
end;

procedure TfrmSoldatMapEditor.mnuCustomX_Click;
begin
  mnuCustomX.Checked := not mnuCustomX.Checked;
end;

procedure TfrmSoldatMapEditor.mnuCustomY_Click;
begin
  mnuCustomY.Checked := not mnuCustomY.Checked;
end;

procedure TfrmSoldatMapEditor.mnuFitOnScreen_Click;
var
  Width: Smallint;
  Height: Smallint;
begin
  if (polyCount < 1) then
    begin
      Exit;
    end;
    mnuRefreshBG_Click;
    scrollCoords[2].X := -self.ScaleWidth / 2 - 1 + Midpoint(minX, maxX);
    scrollCoords[2].Y := -self.ScaleHeight / 2 - 25 + Midpoint(minY, maxY);
    zoomFactor := 1;
    Width := maxX - minX;
    Height := maxY - minY;
    if (Height / Width < (self.ScaleHeight - 88) / (self.ScaleWidth - 32)) then
      begin
        Zoom(((self.ScaleWidth - 32) / Width));
      end
    else
    begin
      Zoom(((self.ScaleHeight - 88) / Height));
    end;
  end;

procedure TfrmSoldatMapEditor.mnuActualPixels_Click;
begin
  zoomFactor := (self.ScaleWidth + 2) / 640;
  Zoom(1);
end;

procedure TfrmSoldatMapEditor.mnuScenTrans_Click(var Index: Smallint);
begin
  mnuScenTrans(Index).Checked := not mnuScenTrans(Index).Checked;
  if (Index = 0) //rotate then
    begin
      frmScenery.rotateScenery := mnuScenTrans(Index).Checked;
      mouseEvent2(frmScenery.picRotate, 0, 0, BUTTON_SMALL, frmScenery.rotateScenery, BUTTON_UP);
    end
  else
    if (Index = 1) then
      begin
        frmScenery.scaleScenery := mnuScenTrans(Index).Checked;
        mouseEvent2(frmScenery.picScale, 0, 0, BUTTON_SMALL, frmScenery.scaleScenery, BUTTON_UP);
      end;
    end;

procedure TfrmSoldatMapEditor.getInfo;
var
  i, j, scenNum: Smallint;
  label
  ErrorHandler;
  begin
    //ON ERROR
    frmInfo.noChange := true;
    frmWaypoints.noChange := true;
    for i := 1 to waypointCount do
    begin
      if Waypoints[i].selected then
        begin
          frmWaypoints.getPathNum(Waypoints[i].pathNum);
          for j := 0 to 4 do
          begin
            frmWaypoints.getWayType(j, Waypoints[i].wayType[j]);
          end;
          frmWaypoints.cboSpecial.ListIndex := Waypoints[i].special;
          frmWaypoints.lblNumCon := Waypoints[i].numConnections;
          Break;
        end;
      end;
      if (numSelectedPolys = 0) and (numSelectedScenery = 0) then
        begin
          if (numSelLights > 0) then
            begin
              for i := 1 to lightCount do
              begin
                if (Lights[i].selected = 1) then
                  begin
                    frmInfo.txtLightProp(0).Text := Lights[i].z;
                    frmInfo.txtLightProp(1).Text := Lights[i].range;
                    frmInfo.picLight.BackColor := RGB(Lights[i].colour.red, Lights[i].colour.green, Lights[i].colour.blue);
                    Break;
                  end;
                end;
                frmInfo.mnuProp_Click(4);
              end
            else
            begin
              frmInfo.mnuProp_Click(5);
            end;
            frmInfo.lblCoords := '';
            frmInfo.lblIndex := '';
            frmInfo.lblSelPolys := '';
            frmInfo.lblSelScenery := '';
            frmInfo.noChange := false;
            frmWaypoints.noChange := false;
            Exit;
          end;
          if (numSelectedPolys > 0) then
            begin
              frmInfo.cboPolyType.ListIndex := vertexList[selectedPolys[1]].polyType;
              frmInfo.txtBounciness.Enabled := false;
              for j := 1 to 3 do
              begin
                if (vertexList[selectedPolys[1]].vertex[j] = 1) then
                  begin
                    frmInfo.txtBounciness.Text := Floor((Polys[selectedPolys[1]].Perp.vertex(j).z - 1) * 100);
                    if (frmInfo.txtBounciness.Text < 0) then
                      begin
                        frmInfo.txtBounciness.Text := 0;
                      end;
                      if (frmInfo.cboPolyType.ListIndex = 18) then
                        begin
                          frmInfo.txtBounciness.Enabled := true;
                        end;
                        frmInfo.txtTexture(0).Text := Floor(Polys[selectedPolys[1]].vertex[j].tu * 10000 + 0.5) / 10000;
                        frmInfo.txtTexture(1).Text := Floor(Polys[selectedPolys[1]].vertex[j].tv * 10000 + 0.5) / 10000;
                        frmInfo.txtVertexAlpha.Text := Floor((getAlpha(Polys[selectedPolys[1]].vertex[j].Color) / 255 * 100) * 100 + 0.5) / 100;
                        frmInfo.lblCoords.Caption := Floor(PolyCoords[selectedPolys[1]].vertex[j].X * 100 + 0.5) / 100 + ', ' + Floor(PolyCoords[selectedPolys[1]].vertex[j].Y * 100) / 100;
                        Break;
                      end;
                    end;
                  end;
                  if (numSelectedScenery > 0) then
                    begin
                      for i := 1 to sceneryCount do
                      begin
                        if (Scenery[i].selected = 1) then
                          begin
                            scenNum := i;
                            frmInfo.txtScenProp(0).Text := Floor(Scenery[i].Scaling.X * 100 * 100 + 0.5) / 100;
                            frmInfo.txtScenProp(1).Text := Floor(Scenery[i].Scaling.Y * 100 * 100 + 0.5) / 100;
                            frmInfo.txtScenProp(2).Text := Floor(Scenery[i].alpha / 255 * 100 * 10 + 0.5) / 10;
                            frmInfo.txtScenProp(3).Text := Floor(Scenery[i].rotation * 180 / pi * 10 + 0.5) / 10;
                            frmInfo.cboLevel.ListIndex := Scenery[i].level;
                            if (numSelectedPolys = 0) then
                              begin
                                frmInfo.lblCoords.Caption := Floor(Scenery[i].Translation.X * 100 + 0.5) / 100 + ', ' + Floor(Scenery[i].Translation.Y * 100) / 100;
                              end;
                              Break;
                            end;
                          end;
                        end;
                        if (numSelectedPolys = 1) and (numSelectedScenery = 0) then
                          begin
                            frmInfo.lblIndex.Caption := selectedPolys[1];
                          end
                        else
                          if (numSelectedPolys = 0) and (numSelectedScenery = 1) then
                            begin
                              frmInfo.lblIndex.Caption := scenNum;
                            end
                          else
                          begin
                            frmInfo.lblIndex.Caption := '';
                          end;
                          if (currentTool = TOOL_MOVE) then
                            begin
                              if (numSelectedPolys = 0) and (numSelectedScenery = 1) then
                                begin
                                  frmInfo.mnuProp_Click(1);
                                end
                              else
                              begin
                                frmInfo.mnuProp_Click(2);
                              end;
                            end
                          else
                            if (numSelectedPolys > 0) and (numSelectedScenery = 0) then
                              begin
                                frmInfo.mnuProp_Click(0);
                              end
                            else
                              if (numSelectedPolys = 0) and (numSelectedScenery > 0) then
                                begin
                                  frmInfo.mnuProp_Click(1);
                                end;
                                frmInfo.txtScale(0).Text := Floor(scaleDiff.X * 1000 + 0.5) / 10;
                                frmInfo.txtScale(1).Text := Floor(scaleDiff.Y * 1000 + 0.5) / 10;
                                frmInfo.txtRotate.Text := rDiff;
                                if (numSelectedScenery = 1) and (numSelectedPolys = 0) then
                                  begin
                                    frmInfo.lblSelPolys := '';
                                    frmInfo.lblSelScenery := frmScenery.lstScenery.List(Scenery[scenNum].Style - 1);
                                  end
                                else
                                begin
                                  if (numSelectedPolys = 0) then
                                    begin
                                      frmInfo.lblSelPolys := '';
                                    end
                                  else
                                  begin
                                    frmInfo.lblSelPolys := 'Polys: ' + numSelectedPolys;
                                  end;
                                  if (numSelectedScenery = 0) then
                                    begin
                                      frmInfo.lblSelScenery := '';
                                    end
                                  else
                                  begin
                                    frmInfo.lblSelScenery := 'Scenery: ' + numSelectedScenery;
                                  end;
                                end;
                                if (numSelWaypoints = 0) then
                                  begin
                                    frmWaypoints.ClearWaypt;
                                  end;
                                  frmInfo.noChange := false;
                                  frmWaypoints.noChange := false;
                                  Exit;
                                  ErrorHandler:
                                    Application.MessageBox(pchar('getInfo() error' + vbNewLine + Error), pchar(''), MB_OK) {HelpFile:None, Context:None};
                                end;

//--------- apply scale/rotate
procedure TfrmSoldatMapEditor.applyPolyType(Index: Smallint);
var
  i: Smallint;
begin
  if selectionChanged then
  begin
    SaveUndo;
    selectionChanged := false;
  end;

  if numSelectedPolys > 0 then
  begin
    for i := 1 to numSelectedPolys do
    begin
      vertexList[selectedPolys[i]].polyType := Index;
    end;
  end;

  SaveUndo;
  Render;
end;

procedure TfrmSoldatMapEditor.applyTextureCoords(tehValue: Single; var Index: Smallint);
var
  i, j: Smallint;
begin
  if selectionChanged then
  begin
    SaveUndo;
    selectionChanged := false;
  end;

  if numSelectedPolys > 0 then
  begin
    for i := 1 to numSelectedPolys do
    begin
      for j := 1 to 3 do
      begin
        if vertexList[selectedPolys[i]].vertex[j] = 1 then
        begin
          if Index = 0 then
          begin
            Polys[selectedPolys[i]].vertex[j].tu := tehValue;
          end
          else
          begin
            Polys[selectedPolys[i]].vertex[j].tv := tehValue;
          end;
        end;
      end;
    end;
  end;

  SaveUndo;
  Render;
end;

procedure TfrmSoldatMapEditor.applyVertexAlpha(var tehValue: Single);
var
  i, j: Smallint;
begin
  if selectionChanged then
  begin
    SaveUndo;
    selectionChanged := false;
  end;

  if numSelectedPolys > 0 then
  begin
    for i := 1 to numSelectedPolys do
    begin
      for j := 1 to 3 do
      begin
        if vertexList[selectedPolys[i]].vertex[j] = 1 then
        begin
          Polys[selectedPolys[i]].vertex[j].Color :=
            ARGB(tehValue * 255, Polys[selectedPolys[i]].vertex[j].Color);
        end;
      end;
    end;
  end;

  SaveUndo;
  Render;
end;

procedure TfrmSoldatMapEditor.applyBounciness(var tehValue: Single);
var
  i, j: Smallint;
begin
  if selectionChanged then
  begin
    SaveUndo;
    selectionChanged := false;
  end;

  if numSelectedPolys > 0 then
  begin
    for i := 1 to numSelectedPolys do
    begin
      for j := 1 to 3 do
      begin
        Polys[selectedPolys[i]].Perp.vertex(j).z := tehValue;
      end;
    end;
  end;

  SaveUndo;
end;

procedure TfrmSoldatMapEditor.applySceneryProp(tehValue: Single; var Index: Smallint);
var
  i: Smallint;
  tempClr: TColour;
begin
  if selectionChanged then
  begin
    SaveUndo;
    selectionChanged := false;
  end;

  for i := 1 to sceneryCount do
  begin
    if Scenery[i].selected = 1 then
    begin
      if Index = 0 then //x scale
      begin
        Scenery[i].Scaling.X := tehValue;
      end
      else if Index = 1 then //y scale
      begin
        Scenery[i].Scaling.Y := tehValue;
      end
      else if Index = 2 then //alpha
      begin
        tempClr := getRGB(Scenery[i].Color);
        Scenery[i].alpha := tehValue;
        Scenery[i].Color := ARGB(tehValue, RGB(tempClr.blue, tempClr.green, tempClr.red));
      end
      else if Index = 3 then //rotation
      begin
        Scenery[i].rotation := tehValue;
      end
      else if Index = 4 then //level
      begin
        Scenery[i].level := tehValue;
      end;
    end;
  end;

  if (Index = 0) or (Index = 1) or (Index = 3) then
  begin
    getRCenter;
  end;

  SaveUndo;
  Render;
end;

procedure TfrmSoldatMapEditor.applyLightProp(tehValue: Single; var Index: Smallint);
var
  i: Smallint;
begin
  if selectionChanged then
  begin
    SaveUndo;
    selectionChanged := false;
  end;

  for i := 1 to lightCount do
  begin
    if Lights[i].selected = 1 then
    begin
      //z-coord
      if Index = 0 then
      begin
        Lights[i].z := tehValue;
      end
      else if Index = 1 then
      begin
        Lights[i].range := tehValue;
      end;
    end;
  end;

  SaveUndo;
  applyLights;
  Render;
end;

procedure TfrmSoldatMapEditor.picMenu_MouseDown(var Index: Smallint; var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
begin
  mouseEvent2(picMenu(Index), X, Y, BUTTON_MENU, 0, BUTTON_DOWN);
  PopupMenu(mnuMenu(Index), Unassigned, Index * MENU_WIDTH, 41);
  mouseEvent2(picMenu(Index), X, Y, BUTTON_MENU, 0, BUTTON_UP);
end;

procedure TfrmSoldatMapEditor.picMenu_MouseMove(var Index: Smallint; var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
begin
  mouseEvent2(picMenu(Index), X, Y, BUTTON_MENU, 0, BUTTON_MOVE);
end;

procedure TfrmSoldatMapEditor.picHelp_MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
begin
  mouseEvent2(picHelp, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN);
end;

procedure TfrmSoldatMapEditor.picHelp_MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
begin
  mouseEvent2(picHelp, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE);
end;

procedure TfrmSoldatMapEditor.picHelp_MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
begin
  RunHelp;
  mouseEvent2(picHelp, X, Y, BUTTON_SMALL, 0, BUTTON_UP);
end;

procedure TfrmSoldatMapEditor.SetColours;
var
  c: Control;
begin
  //ON ERROR
  frmSoldatMapEditor.picMenuBar.BackColor := bgClr;
  frmSoldatMapEditor.picStatus.BackColor := bgClr;
  txtZoom.BackColor := bgClr;
  txtZoom.ForeColor := lblTextClr;
  picProgress.BackColor := bgClr;
  lblFileName.BackColor := lblBackClr;
  lblFileName.ForeColor := lblTextClr;
  lblZoom.BackColor := lblBackClr;
  lblZoom.ForeColor := lblTextClr;
  lblCurrentTool.BackColor := lblBackClr;
  lblCurrentTool.ForeColor := lblTextClr;
  //FOREACH
end;

procedure TfrmSoldatMapEditor.picMaximize_MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
begin
  mouseEvent2(picMaximize, X, Y, BUTTON_SMALL, (self.WindowState = vbNormal), BUTTON_DOWN);
end;

procedure TfrmSoldatMapEditor.picMaximize_MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
begin
  mouseEvent2(picMaximize, X, Y, BUTTON_SMALL, (self.WindowState = vbNormal), BUTTON_MOVE);
end;

procedure TfrmSoldatMapEditor.picMaximize_MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
begin
  if self.WindowState = 2 then
  begin
    self.WindowState := 0;
  end
  else
  begin
    self.WindowState := 2;
  end;
  mouseEvent2(picMaximize, X, Y, BUTTON_SMALL, (self.WindowState = vbNormal), BUTTON_UP);
  resetDevice;
end;

procedure TfrmSoldatMapEditor.picMinimize_MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
begin
  mouseEvent2(picMinimize, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN);
end;

procedure TfrmSoldatMapEditor.picMinimize_MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
begin
  mouseEvent2(picMinimize, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE);
end;

procedure TfrmSoldatMapEditor.picMinimize_MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
begin
  mouseEvent2(picMinimize, X, Y, BUTTON_SMALL, 0, BUTTON_UP);
  if mnuDisplay.Checked then
  begin
    frmDisplay.Hide;
  end;
  if mnuWaypoints.Checked then
  begin
    frmWaypoints.Hide;
  end;
  if mnuTools.Checked then
  begin
    frmTools.Hide;
  end;
  if mnuPalette.Checked then
  begin
    frmPalette.Hide;
  end;
  if mnuScenery.Checked then
  begin
    frmScenery.Hide;
  end;
  if mnuInfo.Checked then
  begin
    frmInfo.Hide;
  end;
  if mnuTexture.Checked then
  begin
    frmTexture.Hide;
  end;
  self.Hide;
  frmTaskBar.WindowState := vbMinimized;
end;

procedure TfrmSoldatMapEditor.picExit_MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
begin
  mouseEvent2(picExit, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN);
end;

procedure TfrmSoldatMapEditor.picExit_MouseMove(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
begin
  mouseEvent2(picExit, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE);
end;

procedure TfrmSoldatMapEditor.picExit_MouseUp(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
begin
  mouseEvent2(picExit, X, Y, BUTTON_SMALL, 0, BUTTON_UP);
  Terminate;
end;

procedure TfrmSoldatMapEditor.picStatus_Click;
var
  hwnd1: Longint;
begin
  if self.WindowState = vbMaximized then
  begin
    hwnd1 := FindWindow('Shell_traywnd', '');
    SetWindowPos(hwnd1, 0, 0, 0, 0, 0, SWP_SHOWWINDOW);
  end;
end;

procedure TfrmSoldatMapEditor.picTitle_DblClick;
begin
  if self.WindowState = 2 then
  begin
    self.WindowState := 0;
    mouseEvent2(picMaximize, 0, 0, BUTTON_SMALL, (self.WindowState = vbNormal), BUTTON_UP);
  end
  else
  begin
    self.WindowState := 2;
    mouseEvent2(picMaximize, 0, 0, BUTTON_SMALL, (self.WindowState = vbNormal), BUTTON_UP);
  end;
  resetDevice;
end;

procedure TfrmSoldatMapEditor.picTitle_MouseDown(var Button: Smallint; var Shift: Smallint; var X: Single; var Y: Single);
begin
  if self.WindowState < 2 then
  begin
    ReleaseCapture;
    SendMessage(self.hWnd, WM_NCLBUTTONDOWN, 2, 0);
    formLeft := self.Left / Screen.TwipsPerPixelX;
    formTop := self.Top / Screen.TwipsPerPixelY;
  end;
end;

procedure TfrmSoldatMapEditor.AutoTexture;
var
  X, Y, Z: Single;
  vertIndex, i: Smallint;
begin
  if numSelectedPolys <= 0 then
  begin
    Exit;
  end;
  for i := 1 to 3 do
  begin
    if vertexList[selectedPolys[1]].vertex[i] > 0 then
    begin
      vertIndex := i;
    end;
  end;
  X := PolyCoords[selectedPolys[1]].vertex[vertIndex].X;
  Y := PolyCoords[selectedPolys[1]].vertex[vertIndex].Y;
  Z := Polys[selectedPolys[1]].vertex[vertIndex].z;
  numSelectedPolys := 0;
  setlength(selectedPolys, 0);
  SetTextureCoords(X, Y, z, 0, 0);
  Render;
end;

procedure TfrmSoldatMapEditor.SetTextureCoords(var X: Single; var Y: Single; var z: Single; var tu: Single; var tv: Single);
var
  i, j, k: Smallint;
begin
  for i := 0 to polyCount do
  begin
    for j := 1 to 3 do
    begin
      //if vertex is at these coords and not marked
      if (Floor(PolyCoords[i].vertex[j].X) = Floor(X)) and
         (Floor(PolyCoords[i].vertex[j].Y) = Floor(Y)) and
         (Floor(Polys[i].vertex[j].z) = Floor(z)) and
         (vertexList[i].vertex[j] < 10) then
        begin
          //set its tex coords to these tex coords
          Polys[i].vertex[j].tu := tu;
          Polys[i].vertex[j].tv := tv;
          //mark in vertex list
          vertexList[i].vertex[j] := 10;
          //find next vertex index
          k := j + 1;
          if k > 3 then
          begin
            k := 1;
          end;
          //check next vertex
          if vertexList[i].vertex[k] < 10 then
          begin
            //calculate new tex coords
            //call this routine again with new coords & tex coords
            SetTextureCoords(PolyCoords[i].vertex[k].X, PolyCoords[i].vertex[k].Y, Polys[i].vertex[k].z, 0, 0);
          end;
        end;
    end;
  end; // loop through all vertices to find vertices at this point, put into array
  // set their coords
  // set vertex list value to mark
  // for each vertex at this point, find adjacent verts
  // calc new coords, call this and set new coords?
  // send new coords to this routine?
  // call this routine on them
end;

end.

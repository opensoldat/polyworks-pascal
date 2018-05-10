unit modSME;

// DISCLAIMER!
// ==================================================================
// This source code has been automatically generated.
// It still requires extensive manual fixing, debugging and testing.
// IT IS NOT GUARANTEED TO COMPILE
// AND MUCH LESS TO BEHAVE EXACTLY LIKE THE ORIGINAL SOURCE CODE.
// Use it at your sole risk and discretion.
//

interface

  const
    pi : single = 3.14159265358979;  //mmm... pi
    BUTTON_WIDTH : smallint = 64; 
    BUTTON_HEIGHT : smallint = 24; 
    MENU_WIDTH : smallint = 64; 
    MENU_HEIGHT : smallint = 16; 
    BUTTON_SMALL : smallint = 0; 
    BUTTON_LARGE : smallint = 1; 
    BUTTON_MENU : smallint = 2; 
    BUTTON_TOOL : smallint = 3; 
    BUTTON_X : smallint = 48; 
    BUTTON_Y : smallint = 0; 
    MENU_X : smallint = 48; 
    MENU_Y : smallint = 96; 
    BUTTON_UP : smallint = 0; 
    BUTTON_MOVE : smallint = 1; 
    BUTTON_DOWN : smallint = 2; 
    WM_NCLBUTTONDOWN : smallint = $000000A1; 
    SWP_HIDEWINDOW : smallint = $00000080; 
    SWP_SHOWWINDOW : smallint = $00000040; 
    SWP_NOSIZE : smallint = $00000001; 
    SWP_NOMOVE : smallint = $00000002; 
    HWND_TOPMOST : smallint = -1; 
    HWND_NOTOPMOST : smallint = -2; 
    //file time
    OFS_MAXPATHNAME : smallint = 128; 
    OF_READWRITE : smallint = $00000002; 

  type
    OFSTRUCT = 
      packed record
        cBytes : byte; 
        fFixedDisk : byte; 
        nErrCode : smallint; 
        Reserved1 : smallint; 
        Reserved2 : smallint; 
        szPathName : array[0..OFS_MAXPATHNAME - 1] of byte;  //0-based
      end;

    FILETIME = 
      packed record
        dwLowDateTime : longint; 
        dwHighDateTime : longint; 
      end;

    SYSTEMTIME = 
      packed record
        wYear : smallint; 
        wMonth : smallint; 
        wDayOfWeek : smallint; 
        wDay : smallint; 
        wHour : smallint; 
        wMinute : smallint; 
        wSecond : smallint; 
        wMilliseconds : smallint; 
      end;

  procedure SelectAllText( var tb : TEdit );
  function GifToPng( src : widestring; dest : widestring ) : longint;
  function GifToBmp( src : widestring; dest : widestring ) : longint;
  //mouse event
  function mouseEvent( var pic : TPaintBox; xVal : smallint; yVal : smallint; var xSrc : smallint; var ySrc : smallint; var Width : smallint; var Height : smallint ) : boolean;
  //mouse event
  function mouseEvent2( var pic : TPaintBox; xVal : smallint; yVal : smallint; buttonType : byte; active : byte; action : byte; var exWidth : smallint{ = 0} ) : boolean;
  //browse
  function SelectFolder( var ownerForm : TForm ) : widestring;
  procedure snapForm( var currentForm : TForm; var otherForm : TForm );
  function GetSoldatDir : widestring;
  function getFileDate( var fileName : widestring ) : longint;
  procedure saveSection( var sectionName : widestring; var sectionData : widestring; var fileName : widestring{ = ''} );
  function loadString( var section : widestring; var Entry : widestring; var fileName : widestring{ = ''}; var length : smallint{ = 0} ) : widestring;
  function loadInt( var section : widestring; var Entry : widestring; var fileName : widestring{ = ''} ) : longint;
  function loadSection( var section : widestring; var lReturn : widestring; var length : smallint; var fileName : widestring{ = ''} ) : widestring;
  function RGBtoHex( var DecValue : longint ) : widestring;
  function HexToLong( var hexValue : widestring ) : longint;
  function RunSoldat : olevariant;
  function RunHelp : olevariant;
  function SetGameMode( var fileName : widestring ) : olevariant;
  function SetColours : olevariant;
  // Initialises GDI Plus
  function InitGDIPlus : longint;
  // Frees GDI Plus
  procedure FreeGDIPlus( var Token : longint );
  // Loads the picture (optionally resized)
  function LoadPictureGDIPlus( var PicFile : widestring; var Width : longint{ = -1}; var Height : longint{ = -1}; BackColor : longint = vbWhite ) : IPicture;

  //bitblt
  function BitBlt( hDestDC : longint; X : longint; Y : longint; nWidth : longint; nHeight : longint; hSrcDC : longint; xSrc : longint; ySrc : longint; dwRop : longint ) : longint; stdcall; external 'gdi32';
  //stretchblit
  function StretchBlt( hDC : longint; X : longint; Y : longint; nWidth : longint; nHeight : longint; hSrcDC : longint; xSrc : longint; ySrc : longint; nSrcWidth : longint; nSrcHeight : longint; dwRop : longint ) : longint; stdcall; external 'gdi32';
  //mouse over
  function SetCapture( hWnd : longint ) : longint; stdcall; external 'user32';
  function GetCapture : longint; stdcall; external 'user32';
  function ReleaseCapture : longint; stdcall; external 'user32';
  //dragging window
  function SendMessage( hWnd : longint; wMsg : longint; wParam : longint; var lParam ) : longint; stdcall; external 'user32' name 'SendMessageA';
  //taskbar
  function SetWindowPos( hWnd : longint; hWndInsertAfter : longint; X : longint; Y : longint; cx : longint; cy : longint; wFlags : longint ) : longint; stdcall; external 'user32';
  function FindWindow( lpClassName : pchar; lpWindowName : pchar ) : longint; stdcall; external 'user32' name 'FindWindowA';
  //get pixel
  function GetPixel( hDC : longint; X : longint; Y : longint ) : longint; stdcall; external 'gdi32';
  function GetFileTime( hFile : longint; var lpCreationTime : FILETIME; var lpLastAccessTime : FILETIME; var lpLastWriteTime : FILETIME ) : longint; stdcall; external 'kernel32';
  function OpenFile( lpFileName : pchar; var lpReOpenBuff : OFSTRUCT; wStyle : longint ) : longint; stdcall; external 'kernel32';
  function CloseHandle( hFile : longint ) : longint; stdcall; external 'kernel32';
  function FileTimeToDosDateTime( var lpFileTime : FILETIME; lpFatDate : longint; lpFatTime : longint ) : longint; stdcall; external 'kernel32';
  function FileTimeToLocalFileTime( var lpFileTime : FILETIME; var lpLocalFileTime : FILETIME ) : longint; stdcall; external 'kernel32';
  function FileTimeToSystemTime( var lpFileTime : FILETIME; var lpSystemTime : SYSTEMTIME ) : longint; stdcall; external 'kernel32';
  //key mapping
  function MapVirtualKey( wCode : longint; wMapType : longint ) : longint; stdcall; external 'user32' name 'MapVirtualKeyA';

implementation

  const
    BIF_RETURNONLYFSDIRS : smallint = $00000001; 
    BIF_DONTGOBELOWDOMAIN : smallint = $00000002; 
    BIF_STATUSTEXT : smallint = $00000004; 
    BIF_RETURNFSANCESTORS : smallint = $00000008; 
    BIF_BROWSEFORCOMPUTER : smallint = $00001000; 
    BIF_BROWSEFORPRINTER : smallint = $00002000; 
    MAX_PATH : smallint = 260; 
    //registry
    HKEY_CLASSES_ROOT : longint = $80000000; 
    HKEY_LOCAL_MACHINE : longint = $80000002; 
    STANDARD_RIGHTS_READ : longint = $00020000; 
    KEY_QUERY_VALUE : longint = $00000001; 
    KEY_ENUMERATE_SUB_KEYS : longint = $00000008; 
    KEY_NOTIFY : longint = $00000010; 
    SYNCHRONIZE : longint = $00100000; 
    KEY_READ : longint = ( ( STANDARD_RIGHTS_READ or KEY_QUERY_VALUE or KEY_ENUMERATE_SUB_KEYS or KEY_NOTIFY ) and ( not SYNCHRONIZE ) ); 
    //GDI and GDI+ constants
    PLANES : smallint = 14;  //Number of planes
    BITSPIXEL : smallint = 12;  //Number of bits per pixel
    PATCOPY : longint = $00F00021;  //(DWORD) dest = pattern
    PICTYPE_BITMAP : smallint = 1;  //Bitmap type
    InterpolationModeHighQualityBicubic : smallint = 7; 
    GDIP_WMF_PLACEABLEKEY : longint = $9AC6CDD7; 
    UnitPixel : smallint = 2; 

  type
    //browse
    BROWSEINFO = 
      packed record
        hOwner : longint; 
        pidlRoot : longint; 
        pszDisplayName : widestring; 
        lpszTitle : widestring; 
        ulFlags : longint; 
        lpfn : longint; 
        lParam : longint; 
        iImage : longint; 
      end;

    //gdi+
    GUID = 
      packed record
        Data1 : longint; 
        Data2 : smallint; 
        Data3 : smallint; 
        Data4 : array[0..7] of byte; 
      end;

    PICTDESC = 
      packed record
        Size : longint; 
        Type : longint; 
        hBmp : longint; 
        hpal : longint; 
        Reserved : longint; 
      end;

    GdiplusStartupInput = 
      packed record
        GdiplusVersion : longint; 
        DebugEventCallback : longint; 
        SuppressBackgroundThread : longint; 
        SuppressExternalCodecs : longint; 
      end;

    ImageCodecInfo = 
      packed record
        Clsid : GUID; 
        FormatID : GUID; 
        CodecNamePtr : longint; 
        DllNamePtr : longint; 
        FormatDescriptionPtr : longint; 
        FilenameExtensionPtr : longint; 
        MimeTypePtr : longint; 
        Flags : longint; 
        Version : longint; 
        SigCount : longint; 
        SigSize : longint; 
        SigPatternPtr : longint; 
        SigMaskPtr : longint; 
      end;

  var
    gfxDir : widestring; 
    appPath : widestring; 
    bgClr : longint; 
    lblBackClr : longint; 
    lblTextClr : longint; 
    txtBackClr : longint; 
    txtTextClr : longint; 
    frameClr : longint; 
    font1 : widestring; 
    font2 : widestring; 

  function SHGetPathFromIDList( pidl : longint; pszPath : pchar ) : longint; stdcall; external 'shell32' name 'SHGetPathFromIDListA';
  function SHBrowseForFolder( var lpBrowseInfo : BROWSEINFO ) : longint; stdcall; external 'shell32' name 'SHBrowseForFolderA';
  procedure CoTaskMemFree( pv : longint ); stdcall; external 'ole32';
  function RegOpenKeyEx( hKey : longint; lpSubKey : pchar; ulOptions : longint; samDesired : longint; var phkResult : longint ) : longint; stdcall; external 'advapi32.dll' name 'RegOpenKeyExA';
  function RegQueryValueEx( hKey : longint; lpValueName : pchar; lpReserved : longint; var lpType : longint; var lpData; var lpcbData : longint ) : longint; stdcall; external 'advapi32.dll' name 'RegQueryValueExA';
  function RegCloseKey( hKey : longint ) : longint; stdcall; external 'advapi32.dll';
  function lstrlenW( lpString : longint ) : longint; stdcall; external 'kernel32';
  //ini file
  function GetPrivateProfileInt( sSectionName : pchar; sKeyName : pchar; lDefault : longint; sFileName : pchar ) : longint; stdcall; external 'kernel32' name 'GetPrivateProfileIntA';
  function GetPrivateProfileSection( sSectionName : pchar; sReturnedString : pchar; lSize : longint; sFileName : pchar ) : longint; stdcall; external 'kernel32' name 'GetPrivateProfileSectionA';
  function GetPrivateProfileString( sSectionName : pchar; sKeyName : pchar; sDefault : pchar; sReturnedString : pchar; lSize : longint; sFileName : pchar ) : longint; stdcall; external 'kernel32' name 'GetPrivateProfileStringA';
  function WritePrivateProfileSection( sSectionName : pchar; sString : pchar; sFileName : pchar ) : longint; stdcall; external 'kernel32' name 'WritePrivateProfileSectionA';
  function WritePrivateProfileString( sSectionName : pchar; sKeyName : pchar; sString : pchar; sFileName : pchar ) : longint; stdcall; external 'kernel32' name 'WritePrivateProfileStringA';
  //ShellExecute
  function ShellExecute( hWnd : longint; lpOperation : pchar; lpFile : pchar; lpParameters : pchar; lpDirectory : pchar; nShowCmd : longint ) : longint; stdcall; external 'shell32.dll' name 'ShellExecuteA';
  //GDI Functions
  function CreateCompatibleDC( hDC : longint ) : longint; stdcall; external 'gdi32';
  function OleCreatePictureIndirect( var PicDesc : PICTDESC; var RefIID : GUID; fPictureOwnsHandle : longint; var IPic : IPicture ) : longint; stdcall; external 'olepro32.dll';
  function CreateCompatibleBitmap( hDC : longint; nWidth : longint; nHeight : longint ) : longint; stdcall; external 'gdi32';
  function GetDeviceCaps( hDC : longint; nIndex : longint ) : longint; stdcall; external 'gdi32';
  function PatBlt( hDC : longint; X : longint; Y : longint; nWidth : longint; nHeight : longint; dwRop : longint ) : longint; stdcall; external 'gdi32';
  function CreateBitmap( nWidth : longint; nHeight : longint; nPlanes : longint; nBitCount : longint; var lpBits ) : longint; stdcall; external 'gdi32';
  function SelectObject( hDC : longint; hObject : longint ) : longint; stdcall; external 'gdi32';
  function CreateSolidBrush( crColor : longint ) : longint; stdcall; external 'gdi32';
  function DeleteObject( hObject : longint ) : longint; stdcall; external 'gdi32';
  function DeleteDC( hDC : longint ) : longint; stdcall; external 'gdi32';
  //GDI+ functions
  function GdipLoadImageFromFile( fileName : longint; var GpImage : longint ) : longint; stdcall; external 'gdiplus.dll';
  function GdiplusStartup( var Token : longint; var gdipInput : GdiplusStartupInput; var GdiplusStartupOutput : longint ) : longint; stdcall; external 'gdiplus.dll';
  function GdipCreateFromHDC( hDC : longint; var GpGraphics : longint ) : longint; stdcall; external 'gdiplus.dll';
  function GdipDrawImageRectI( Graphics : longint; Img : longint; X : longint; Y : longint; Width : longint; Height : longint ) : longint; stdcall; external 'gdiplus.dll';
  function GdipDeleteGraphics( Graphics : longint ) : longint; stdcall; external 'gdiplus.dll';
  function GdipDisposeImage( image : longint ) : longint; stdcall; external 'gdiplus.dll';
  function GdipCreateBitmapFromHBITMAP( hBmp : longint; hpal : longint; var GpBitmap : longint ) : longint; stdcall; external 'gdiplus.dll';
  function GdipGetImageWidth( image : longint; var Width : longint ) : longint; stdcall; external 'gdiplus.dll';
  function GdipGetImageHeight( image : longint; var Height : longint ) : longint; stdcall; external 'gdiplus.dll';
  procedure GdiplusShutdown( Token : longint ); stdcall; external 'gdiplus.dll';
  //functions for gif loading
  function GdipSaveImageToFile( image : longint; fileName : longint; var clsidEncoder : GUID; var encoderParams ) : longint; stdcall; external 'gdiplus.dll';
  function GdipCreateBitmapFromFile( fileName : longint; var Bitmap : longint ) : longint; stdcall; external 'gdiplus.dll';
  function GdipCreateHBITMAPFromBitmap( Bitmap : longint; var hbmReturn : longint; background : longint ) : longint; stdcall; external 'gdiplus.dll';
  function GdipGetImageEncodersSize( var numEncoders : longint; var Size : longint ) : longint; stdcall; external 'gdiplus.dll';
  function GdipGetImageEncoders( numEncoders : longint; Size : longint; var Encoders ) : longint; stdcall; external 'gdiplus.dll';
  function lstrcpyW( var lpString1; var lpString2 ) : longint; stdcall; external 'kernel32';

  procedure SelectAllText( var tb : TEdit );
    begin
      tb.SelStart := 0;
      tb.SelLength := length( tb.Text );
    end;

  function GetEncoderClsid( var mimeType : widestring; var pClsid : GUID ) : boolean;
    var
      num : longint; 
      Size : longint; 
      pImageCodecInfo : array of ImageCodecInfo; 
      j : longint; 
      buffer : widestring; 
    begin
      GdipGetImageEncodersSize( num, Size );
      if ( Size = 0 )
        then
          begin
            result := false;
            exit;
          end;
      setlength( pImageCodecInfo, Size div length( pImageCodecInfo( 0 ) ) - 1 + 1 );
      GdipGetImageEncoders( num, Size, pImageCodecInfo[0] );
      for j := 0 to num - 1 do
        begin
          buffer := StringOfChar(#32, lstrlenW( pImageCodecInfo[j].MimeTypePtr ));
          lstrcpyW( StrPtr( buffer ), pImageCodecInfo[j].MimeTypePtr );
          if ( StrComp( buffer, mimeType, vbTextCompare ) = 0 )
            then
              begin
                pClsid := pImageCodecInfo[j].Clsid;
                setlength( pImageCodecInfo, 0 );
                result := true;
                exit;
              end;
        end;
      setlength( pImageCodecInfo, 0 );
      result := false;
    end;

  function SaveImageAsPNG( sFileName : olevariant; sDestFileName : widestring ) : boolean;
    var
      lBitmap : longint; 
      hBitmap : longint; 
      Results : longint; 
      tPicEncoder : GUID; 
    begin
      if ( GdipCreateBitmapFromFile( StrPtr( sFileName ), lBitmap ) = 0 )
        then
          begin
            if ( GdipCreateHBITMAPFromBitmap( lBitmap, hBitmap, 0 ) = 0 )
              then
                begin
                  if GetEncoderClsid( 'image/png', tPicEncoder )
                    then
                      begin
                        result := ( GdipSaveImageToFile( lBitmap, StrPtr( sDestFileName ), tPicEncoder, 0 ) = 0 );
                      end
                    else
                      begin
                        result := false;
                      end;
                  GdipDisposeImage( lBitmap );
                end;
          end;
    end;

  function GifToPng( src : widestring; dest : widestring ) : longint;
    var
      Token : longint; 
    begin
      Token := InitGDIPlus;
      if SaveImageAsPNG( src, dest )
        then
          begin
            result := -1;
          end
        else
          begin
            result := 5;
          end;
      FreeGDIPlus( Token );
    end;

  function GifToBmp( src : widestring; dest : widestring ) : longint;
    begin
      result := GifToPng( src, dest );
    end;

  function mouseEvent( var pic : TPaintBox; xVal : smallint; yVal : smallint; var xSrc : smallint; var ySrc : smallint; var Width : smallint; var Height : smallint ) : boolean;
    begin
      if ( xVal < 0 ) or ( xVal > Width ) or ( yVal < 0 ) or ( yVal > Height ) //the MOUSELEAVE pseudo-event
        then
          begin
            ReleaseCapture;
            BitBlt( pic.Canvas.Handle, 0, 0, Width, Height, frmSoldatMapEditor.picGfx.hDC, xSrc, ySrc, vbSrcCopy );
            pic.Refresh;
            result := true;
          end
        else
      if ( GetCapture <> pic.hWnd ) //the MOUSEENTER pseudo-event
        then
          begin
            SetCapture( pic.hWnd );
            BitBlt( pic.Canvas.Handle, 0, 0, Width, Height, frmSoldatMapEditor.picGfx.hDC, xSrc + Width, ySrc, vbSrcCopy );
            pic.Refresh;
            result := true;
          end;
    end;

  function mouseEvent2( var pic : TPaintBox; xVal : smallint; yVal : smallint; buttonType : byte; active : byte; action : byte; var exWidth : smallint ) : boolean;
    var
      xSrc : smallint; 
      ySrc : smallint; 
      Width : smallint; 
      Height : smallint; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      if ( buttonType = BUTTON_SMALL )
        then
          begin
            Width := 16;
            Height := 16;
            xSrc := 0;
            ySrc := Floor( pic.Tag ) * Height;
          end
        else
      if ( buttonType = BUTTON_LARGE )
        then
          begin
            Width := BUTTON_WIDTH;
            Height := BUTTON_HEIGHT;
            xSrc := BUTTON_X;
            ySrc := BUTTON_Y + Floor( pic.Tag ) * Height;
          end
        else
      if ( buttonType = BUTTON_MENU )
        then
          begin
            Width := MENU_WIDTH;
            Height := MENU_HEIGHT;
            xSrc := MENU_X;
            ySrc := MENU_Y + Floor( pic.Index ) * Height;
          end;
      active := active / 255;
      if ( exWidth = 0 )
        then
          begin
            exWidth := Width;
          end;
      if ( action = BUTTON_UP ) or ( action = BUTTON_DOWN )
        then
          begin
            result := true;
          end
        else
      if ( xVal < 0 ) or ( xVal > exWidth ) or ( yVal < 0 ) or ( yVal > Height ) //the MOUSELEAVE pseudo-event
        then
          begin
            ReleaseCapture;
            result := true;
            action := BUTTON_UP;
          end
        else
      if ( GetCapture <> pic.hWnd ) //the MOUSEENTER pseudo-event
        then
          begin
            SetCapture( pic.hWnd );
            result := true;
            action := BUTTON_MOVE;
          end;
      if ( result = true )
        then
          begin
            BitBlt( pic.Canvas.Handle, 0, 0, Width, Height, frmSoldatMapEditor.picButtonGfx.hDC, xSrc + Width * action, ySrc + active * Height, vbSrcCopy );
            pic.Refresh;
          end;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar(Error), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  function SelectFolder( var ownerForm : TForm ) : widestring;
    var
      bi : BROWSEINFO; 
      pidl : longint; 
      path : widestring; 
      pos : longint; 
    begin
      with bi do
        begin
          hOwner := ownerForm.hWnd;
          pidlRoot := 0;
          ulFlags := BIF_RETURNONLYFSDIRS;
        end;
      pidl := SHBrowseForFolder( bi );
      path := StringOfChar(#32, MAX_PATH);
      if SHGetPathFromIDList( pidl, path )
        then
          begin
            pos := PosEx(Unassigned, Chr( 0 ), path);
            result := LowerCase(LeftStr(path, pos - 1));
          end;
      CoTaskMemFree( pidl );
    end;

  procedure snapForm( var currentForm : TForm; var otherForm : TForm );
    begin
      //snap bottom to bottom
      if ( Abs( currentForm.Top + currentForm.Height - otherForm.Top - otherForm.Height ) <= 8 * Screen.TwipsPerPixelY )
        then
          begin
            if ( ( currentForm.Left + currentForm.Width + 8 * Screen.TwipsPerPixelX ) >= otherForm.Left ) and ( currentForm.Left <= ( otherForm.Left + otherForm.Width + 8 * Screen.TwipsPerPixelX ) )
              then
                begin
                  currentForm.Top := otherForm.Top + otherForm.Height - currentForm.Height;
                end;
            //snap bottom to top
          end
        else
      if ( Abs( currentForm.Top + currentForm.Height - otherForm.Top ) <= 8 * Screen.TwipsPerPixelY )
        then
          begin
            if ( ( currentForm.Left + currentForm.Width + 8 * Screen.TwipsPerPixelX ) >= otherForm.Left ) and ( currentForm.Left <= ( otherForm.Left + otherForm.Width + 8 * Screen.TwipsPerPixelX ) )
              then
                begin
                  currentForm.Top := otherForm.Top - currentForm.Height + Screen.TwipsPerPixelY;
                end;
          end;
      //snap right to right
      if ( Abs( currentForm.Left + currentForm.Width - otherForm.Left - otherForm.Width ) <= 8 * Screen.TwipsPerPixelX )
        then
          begin
            if ( ( currentForm.Top + currentForm.Height + 8 * Screen.TwipsPerPixelY ) >= otherForm.Top ) and ( currentForm.Top <= ( otherForm.Top + otherForm.Height + 8 * Screen.TwipsPerPixelY ) )
              then
                begin
                  currentForm.Left := otherForm.Left + otherForm.Width - currentForm.Width;
                end;
            //snap right to left
          end
        else
      if ( Abs( currentForm.Left + currentForm.Width - otherForm.Left ) <= 8 * Screen.TwipsPerPixelX )
        then
          begin
            if ( ( currentForm.Top + currentForm.Height + 8 * Screen.TwipsPerPixelY ) >= otherForm.Top ) and ( currentForm.Top <= ( otherForm.Top + otherForm.Height + 8 * Screen.TwipsPerPixelY ) )
              then
                begin
                  currentForm.Left := otherForm.Left - currentForm.Width + Screen.TwipsPerPixelX;
                end;
          end;
      //snap top to top
      if ( Abs( currentForm.Top - otherForm.Top ) <= 8 * Screen.TwipsPerPixelY )
        then
          begin
            if ( ( currentForm.Left + currentForm.Width + 8 * Screen.TwipsPerPixelX ) >= otherForm.Left ) and ( currentForm.Left <= ( otherForm.Left + otherForm.Width + 8 * Screen.TwipsPerPixelX ) )
              then
                begin
                  currentForm.Top := otherForm.Top;
                end;
            //snap top to bottom
          end
        else
      if ( Abs( currentForm.Top - otherForm.Top - otherForm.Height ) <= 8 * Screen.TwipsPerPixelY )
        then
          begin
            if ( ( currentForm.Left + currentForm.Width + 8 * Screen.TwipsPerPixelX ) >= otherForm.Left ) and ( currentForm.Left <= ( otherForm.Left + otherForm.Width + 8 * Screen.TwipsPerPixelX ) )
              then
                begin
                  currentForm.Top := otherForm.Top + otherForm.Height - Screen.TwipsPerPixelY;
                end;
          end;
      //snap left to left
      if ( Abs( currentForm.Left - otherForm.Left ) <= 8 * Screen.TwipsPerPixelX )
        then
          begin
            if ( ( currentForm.Top + currentForm.Height + 8 * Screen.TwipsPerPixelY ) >= otherForm.Top ) and ( currentForm.Top <= ( otherForm.Top + otherForm.Height + 8 * Screen.TwipsPerPixelY ) )
              then
                begin
                  currentForm.Left := otherForm.Left;
                end;
            //snap left to right
          end
        else
      if ( Abs( currentForm.Left - otherForm.Left - otherForm.Width ) <= 8 * Screen.TwipsPerPixelX )
        then
          begin
            if ( ( currentForm.Top + currentForm.Height + 8 * Screen.TwipsPerPixelY ) >= otherForm.Top ) and ( currentForm.Top <= ( otherForm.Top + otherForm.Height + 8 * Screen.TwipsPerPixelY ) )
              then
                begin
                  currentForm.Left := otherForm.Left + otherForm.Width - Screen.TwipsPerPixelX;
                end;
          end;
    end;

  function GetSoldatDir : widestring;
    var
      //HKEY_CLASSES_ROOT\Soldat\DefaultIcon
      hKey : longint; 
      sKey : widestring; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      sKey := 'Soldat\DefaultIcon';
      hKey := OpenRegKey( HKEY_CLASSES_ROOT, sKey );
      if ( hKey <> 0 )
        then
          begin
            result := GetRegValue( hKey, '' );
            RegCloseKey( hKey );
          end
        else
          begin
            //HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Soldat_is1\Inno Setup: App Path
            sKey := 'SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Soldat_is1';
            hKey := OpenRegKey( HKEY_LOCAL_MACHINE, sKey );
            if ( hKey <> 0 )
              then
                begin
                  result := GetRegValue( hKey, 'Inno Setup: App Path' );
                  RegCloseKey( hKey );
                end
              else
                begin
                  if ( Dir( 'C:\Soldat', vbDirectory ) = '' )
                    then
                      begin
                        Application.MessageBox( pchar('Could not locate the Soldat directory.' + vbNewLine + 'Please configure the Soldat path, otherwise PolyWorks will not work properly.' + vbNewLine + 'See: Edit -> Preferences'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
                      end
                    else
                      begin
                        result := 'C:\Soldat';
                      end;
                end;
          end;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar('Error getting soldat directory from registry' + vbNewLine + Error), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  function OpenRegKey( hKey : longint; lpSubKey : widestring ) : longint;
    var
      hSubKey : longint; 
    begin
      if ( RegOpenKeyEx( hKey, lpSubKey, 0, KEY_READ, hSubKey ) = 0 )
        then
          begin
            result := hSubKey;
          end;
    end;

  function GetRegValue( var hSubKey : longint; var sKeyName : widestring ) : widestring;
    var
      lpValue : widestring;  //name of the value to retrieve
      lpcbData : longint;  //length of the retrieved value
      Result : longint; 
    begin
      //if valid
      if ( hSubKey <> 0 )
        then
          begin
            lpValue := StringOfChar(#32, 260);
            lpcbData := length( lpValue );
            //find the passed value if present
            if ( RegQueryValueEx( hSubKey, sKeyName, 0, 0, lpValue, lpcbData ) = 0 )
              then
                begin
                  result := LeftStr(lpValue, lstrlenW( StrPtr( lpValue ) ));
                end;
          end;
    end;

  function getFileDate( var fileName : widestring ) : longint;
    var
      hFile : longint; 
      OFS : OFSTRUCT; 
      FT_CREATE : FILETIME; 
      FT_ACCESS : FILETIME; 
      FT_WRITE : FILETIME; 
      dosDate : smallint; 
      dosTime : smallint; 
      timeString : widestring; 
      localFT : FILETIME; 
      sysTime : SYSTEMTIME; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      hFile := OpenFile( frmSoldatMapEditor.soldatDir + 'Scenery-gfx\' + fileName, OFS, OF_READWRITE );
      GetFileTime( hFile, FT_CREATE, FT_ACCESS, FT_WRITE );
      CloseHandle( hFile );
      FileTimeToLocalFileTime( FT_WRITE, localFT );
      FT_WRITE := localFT;
      FileTimeToDosDateTime( FT_WRITE, VarPtr( dosDate ), VarPtr( dosTime ) );
      timeString := Hex( dosTime );
      if ( length( timeString ) < 4 )
        then
          begin
            timeString := StringOfChar( '0', 4 - length( timeString ) ) + timeString;
          end;
      result := VarAsType( '&H' + Hex( dosDate ) + timeString, varInteger );
      exit;
      ErrorHandler:
      Application.MessageBox( pchar('get file date' + vbNewLine + Error), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure saveSection( var sectionName : widestring; var sectionData : widestring; var fileName : widestring );
    var
      lReturn : longint; 
    begin
      if ( fileName = '' )
        then
          begin
            fileName := appPath + '\polyworks.ini';
          end;
      lReturn := WritePrivateProfileSection( sectionName, sectionData, fileName );
    end;

  function loadString( var section : widestring; var Entry : widestring; var fileName : widestring; var length : smallint ) : widestring;
    var
      sString : widestring; 
      lSize : longint; 
      lReturn : longint; 
    begin
      if ( fileName = '' )
        then
          begin
            fileName := appPath + '\polyworks.ini';
          end;
      if ( length = 0 )
        then
          begin
            length := 10;
          end;
      sString := StringOfChar( '*', length );
      lSize := length( sString );
      lReturn := GetPrivateProfileString( section, Entry, '', sString, lSize, fileName );
      result := LeftStr(sString, lReturn);
    end;

  function loadInt( var section : widestring; var Entry : widestring; var fileName : widestring ) : longint;
    var
      lReturn : longint; 
    begin
      if ( fileName = '' )
        then
          begin
            fileName := appPath + '\polyworks.ini';
          end;
      lReturn := GetPrivateProfileInt( section, Entry, -1, fileName );
      result := lReturn;
    end;

  function loadSection( var section : widestring; var lReturn : widestring; var length : smallint; var fileName : widestring ) : widestring;
    begin
      if ( fileName = '' )
        then
          begin
            fileName := appPath + '\polyworks.ini';
          end;
      GetPrivateProfileSection( section, lReturn, length, fileName );
      result := lReturn;
    end;

  function RGBtoHex( var DecValue : longint ) : widestring;
    var
      hexValue : widestring; 
    begin
      hexValue := Hex( Val( DecValue ) );
      if ( length( hexValue ) < 6 )
        then
          begin
            hexValue := StringOfChar( '0', 6 - length( hexValue ) ) + hexValue;
          end;
      result := hexValue;
    end;

  function HexToLong( var hexValue : widestring ) : longint;
    label
      ErrorHandler;
    begin
      //ON ERROR
      if ( length( hexValue ) > 8 )
        then
          begin
            hexValue := RightStr(hexValue, 8);
          end;
      result := StrToInt( '&H' + hexValue );
      exit;
      ErrorHandler:
      result := -1;
    end;

  function RunSoldat : olevariant;
    begin
      frmSoldatMapEditor.picMinimize_MouseUp( 1, 0, 0, 0 );
      ShellExecute( 0, vbNullString, frmSoldatMapEditor.soldatDir + 'Soldat.exe', '-start', vbNullString, vbNormalFocus );
    end;

  function RunHelp : olevariant;
    var
      iReturn : longint; 
    begin
      iReturn := ShellExecute( frmSoldatMapEditor.hWnd, 'Open', appPath + '\PolyWorks Help.html', vbNullString, vbNullString, vbNormalFocus ); //SW_ShowNormal)
    end;

  function SetGameMode( var fileName : widestring ) : olevariant;
    var
      lReturn : longint; 
      gameMode : smallint; 
    begin
      if ( LowerCase(LeftStr(fileName, 4)) = 'ctf_' )
        then
          begin
            gameMode := 3;
          end
        else
      if ( LowerCase(LeftStr(fileName, 4)) = 'inf_' )
        then
          begin
            gameMode := 5;
          end
        else
      if ( LowerCase(LeftStr(fileName, 4)) = 'htf_' )
        then
          begin
            gameMode := 6;
          end
        else
          begin
            gameMode := 0;
          end;
      lReturn := WritePrivateProfileString( 'GAME', 'GameStyle', gameMode, frmSoldatMapEditor.soldatDir + 'soldat.ini' );
    end;

  function SetColours : olevariant;
    begin
      frmSoldatMapEditor.picMenuBar.BackColor := bgClr;
      frmSoldatMapEditor.picStatus.BackColor := bgClr;
      frmPreferences.BackColor := bgClr;
      frmColour.BackColor := bgClr;
      frmDisplay.BackColor := bgClr;
      frmInfo.BackColor := bgClr;
      frmMap.BackColor := bgClr;
      frmScenery.BackColor := bgClr;
      frmTools.BackColor := bgClr;
      frmWaypoints.BackColor := bgClr;
    end;

  function InitGDIPlus : longint;
    var
      Token : longint; 
      gdipInit : GdiplusStartupInput; 
    begin
      gdipInit.GdiplusVersion := 1;
      GdiplusStartup( Token, gdipInit, 0 );
      result := Token;
    end;

  procedure FreeGDIPlus( var Token : longint );
    begin
      GdiplusShutdown( Token );
    end;

  function LoadPictureGDIPlus( var PicFile : widestring; var Width : longint; var Height : longint; BackColor : longint ) : IPicture;
    var
      hDC : longint; 
      hBitmap : longint; 
      Img : longint; 
      hBrush : longint; 
      Graphics : longint;  // Graphics Object Pointer
      IID_IDispatch : GUID; 
      pic : PICTDESC; 
      IPic : IPicture; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      //' Load the image
      if ( length( Dir( PicFile ) ) <> 0 )
        then
          begin
            if ( GdipLoadImageFromFile( StrPtr( PicFile ), Img ) <> 0 )
              then
                begin
                  exit;
                end;
          end;
      // Calculate picture's width and height if not specified
      if ( Width = -1 ) or ( Height = -1 )
        then
          begin
            GdipGetImageWidth( Img, Width );
            GdipGetImageHeight( Img, Height );
          end;
      // Initialise the hDC
      // Create a memory DC and select a bitmap into it, fill it in with the backcolor
      hDC := CreateCompatibleDC( 0 );
      hBitmap := CreateBitmap( Width, Height, GetDeviceCaps( hDC, PLANES ), GetDeviceCaps( hDC, BITSPIXEL ), 0 );
      hBitmap := SelectObject( hDC, hBitmap );
      hBrush := CreateSolidBrush( BackColor );
      hBrush := SelectObject( hDC, hBrush );
      PatBlt( hDC, 0, 0, Width, Height, PATCOPY );
      DeleteObject( SelectObject( hDC, hBrush ) );
      // Resize the picture
      GdipCreateFromHDC( hDC, Graphics );
      GdipDrawImageRectI( Graphics, Img, 0, 0, Width, Height );
      GdipDeleteGraphics( Graphics );
      GdipDisposeImage( Img );
      // Get the bitmap back
      hBitmap := SelectObject( hDC, hBitmap );
      DeleteDC( hDC );
      // Create the picture
      // Fill in OLE IDispatch Interface ID
      IID_IDispatch.Data1 := $00020400;
      IID_IDispatch.Data4[0] := $000000C0;
      IID_IDispatch.Data4[7] := $00000046;
      // Fill Pic with necessary parts
      pic.Size := sizeof( pic ); // Length of structure
      pic.Type := PICTYPE_BITMAP; // Type of Picture (bitmap)
      pic.hBmp := hBitmap; // Handle to bitmap
      // Create the picture
      OleCreatePictureIndirect( pic, IID_IDispatch, true, IPic );
      result := IPic;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar(Error + vbNewLine + 'Error loading picture'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

end.

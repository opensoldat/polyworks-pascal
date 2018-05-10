unit frmTools;

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
    Dialogs;

  type
    TfrmTools =
      class( TForm )
        frmTools : TForm;
        picHide : TPaintBox;
        picTitle : TPaintBox;
        picTools_6 : TPaintBox;
        picTools_5 : TPaintBox;
        picTools_4 : TPaintBox;
        picTools_3 : TPaintBox;
        picTools_2 : TPaintBox;
        picTools_1 : TPaintBox;
        picTools_0 : TPaintBox;
        picTools_7 : TPaintBox;
        picTools_8 : TPaintBox;
        picTools_9 : TPaintBox;
        picTools_10 : TPaintBox;
        picTools_11 : TPaintBox;
        picTools_12 : TPaintBox;
        picTools_13 : TPaintBox;
        private
          curTool : byte; 
          curButton : byte; 
          fxPos : smallint;
          fyPos : smallint;
          fcollapsed : boolean;
          hotKeys : array[0..13] of byte; 
          procedure Form_KeyUp( var KeyCode : smallint; var Shift : smallint );
          procedure Form_Load;
          procedure picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picTools_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picTools_MouseUp( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_Click;
          procedure picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
        public
          function getHotKey( Index : byte ) : byte;
          function setHotKey( var Index : smallint; value : byte ) : olevariant;
          procedure initTool( var value : byte );
          procedure setForm;
          procedure picTools_MouseDown( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure SetColours;
          property xPos : smallint read fxPos write fxPos; 
          property yPos : smallint read fyPos write fyPos; 
          property collapsed : boolean read fcollapsed write fcollapsed; 
      end;

implementation

  {$R *.DFM}

  function TfrmTools.getHotKey( Index : byte ) : byte;
    begin
      result := hotKeys[Index];
    end;

  function TfrmTools.setHotKey( var Index : smallint; value : byte ) : olevariant;
    begin
      if ( value > 0 )
        then
          begin
            hotKeys[Index] := value;
          end;
    end;

  procedure TfrmTools.initTool( var value : byte );
    begin
      curTool := value;
    end;

  procedure TfrmTools.Form_KeyUp( var KeyCode : smallint; var Shift : smallint );
    begin
      Application.MessageBox( pchar(KeyCode), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmTools.Form_Load;
    label
      ErrorHandler;
    begin
      //ON ERROR
      SetColours;
      setForm;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar(Error + vbNewLine + 'Error loading Tools form'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmTools.setForm;
    begin
      self.Left := xPos * Screen.TwipsPerPixelX;
      self.Top := yPos * Screen.TwipsPerPixelY;
    end;

  procedure TfrmTools.picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      ReleaseCapture;
      SendMessage( self.hWnd, WM_NCLBUTTONDOWN, 2, 0 );
      snapForm( self, frmPalette );
      snapForm( self, frmWaypoints );
      snapForm( self, frmDisplay );
      snapForm( self, frmScenery );
      snapForm( self, frmInfo );
      snapForm( self, frmTexture );
      snapForm( self, frmSoldatMapEditor );
      xPos := self.Left / Screen.TwipsPerPixelX;
      yPos := self.Top / Screen.TwipsPerPixelY;
    end;

  procedure TfrmTools.picTools_MouseDown( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    var
      i : smallint; 
    begin
      if ( curTool <> Index )
        then
          begin
            for i := 0 to 13 do
              begin
                BitBlt( picTools( i ).hDC, 0, 0, 32, 32, frmSoldatMapEditor.picGfx.hDC, 0, i * 32, vbSrcCopy );
                picTools( i ).Refresh;
              end;
            BitBlt( picTools( Index ).hDC, 0, 0, 32, 32, frmSoldatMapEditor.picGfx.hDC, 64, Index * 32, vbSrcCopy );
            picTools( Index ).Refresh;
          end;
      curTool := Index;
    end;

  procedure TfrmTools.picTools_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      if ( curTool <> Index )
        then
          begin
            mouseEvent( picTools( Index ), ( picTools( Index ).ScaleWidth - X ), ( picTools( Index ).ScaleHeight - Y ), 0, Index * 32, 32, 32 );
          end;
    end;

  procedure TfrmTools.picTools_MouseUp( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      frmSoldatMapEditor.setCurrentTool( curTool );
      frmSoldatMapEditor.MouseIcon := frmSoldatMapEditor.ImageList.ListImages( curTool + 1 ).Picture;
      frmSoldatMapEditor.RegainFocus;
    end;

  procedure TfrmTools.picHide_Click;
    begin
      self.Hide;
      frmSoldatMapEditor.mnuTools.Checked := false;
    end;

  procedure TfrmTools.picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN );
    end;

  procedure TfrmTools.picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE );
    end;

  procedure TfrmTools.picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_UP );
    end;

  procedure TfrmTools.SetColours;
    var
      i : smallint; 
    begin
      //ON ERROR
      picTitle.Picture := LoadPicture( appPath + '\' + gfxDir + '\titlebar_tools.bmp' );
      mouseEvent2( picHide, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      for i := 0 to 13 do
        begin
          BitBlt( picTools( i ).hDC, 0, 0, 32, 32, frmSoldatMapEditor.picGfx.hDC, 0, i * 32, vbSrcCopy );
          picTools( i ).Refresh;
          frmTools.picTools( i ).ToolTipText := frmTools.picTools( i ).Tag + ' (' + Chr( MapVirtualKey( hotKeys[i], 1 ) ) + ')';
        end;
      BitBlt( picTools( curTool ).hDC, 0, 0, 32, 32, frmSoldatMapEditor.picGfx.hDC, 64, curTool * 32, vbSrcCopy );
      picTools( curTool ).Refresh;
    end;

end.

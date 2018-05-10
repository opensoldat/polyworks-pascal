unit frmDisplay;

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

  const
    LAYER_BG : byte = 0; 
    LAYER_POLYS : byte = 1; 
    LAYER_TEXTURE : byte = 2; 
    LAYER_WIREFRAME : byte = 3; 
    LAYER_POINTS : byte = 4; 
    LAYER_SCENERY : byte = 5; 
    LAYER_OBJECTS : byte = 6; 
    LAYER_WAYPOINTS : byte = 7; 
    LAYER_GRID : byte = 8; 

  type
    TfrmDisplay =
      class( TForm )
        frmDisplay : TForm;
        lblLayer_4 : TLabel;
        lblLayer_3 : TLabel;
        lblLayer_2 : TLabel;
        lblLayer_1 : TLabel;
        lblLayer_0 : TLabel;
        lblLayer_8 : TLabel;
        lblLayer_6 : TLabel;
        lblLayer_5 : TLabel;
        lblLayer_7 : TLabel;
        lblLayer_9 : TLabel;
        lblLayer_10 : TLabel;
        picHide : TPaintBox;
        picLayer_7 : TPaintBox;
        picLayer_6 : TPaintBox;
        picLayer_4 : TPaintBox;
        picLayer_3 : TPaintBox;
        picLayer_2 : TPaintBox;
        picLayer_1 : TPaintBox;
        picLayer_0 : TPaintBox;
        picLayer_5 : TPaintBox;
        picLayer_8 : TPaintBox;
        picLayer_9 : TPaintBox;
        picLayer_10 : TPaintBox;
        picTitle : TPaintBox;
        private
          layers : array[0..10] of boolean; 
          layerKeys : array[0..7] of byte; 
          formHeight : smallint; 
          fcollapsed : boolean;
          fxPos : smallint;
          fyPos : smallint;
          procedure Form_GotFocus;
          procedure Form_Load;
          procedure lblLayer_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picLayer_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picTitle_DblClick;
          procedure picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_Click;
          procedure picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
        public
          function getLayerKey( Index : byte ) : byte;
          function setLayerKey( var Index : smallint; value : byte ) : olevariant;
          procedure setForm;
          procedure setLayer( var Index : smallint; var value : boolean );
          procedure picLayer_MouseDown( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picLayer_MouseUp( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure refreshButtons;
          procedure SetColours;
          property collapsed : boolean read fcollapsed write fcollapsed; 
          property xPos : smallint read fxPos write fxPos; 
          property yPos : smallint read fyPos write fyPos; 
      end;

implementation

  {$R *.DFM}

  function TfrmDisplay.getLayerKey( Index : byte ) : byte;
    begin
      result := layerKeys[Index];
    end;

  function TfrmDisplay.setLayerKey( var Index : smallint; value : byte ) : olevariant;
    begin
      if ( value > 0 )
        then
          begin
            layerKeys[Index] := value;
          end;
    end;

  procedure TfrmDisplay.Form_GotFocus;
    begin
      Beep;
    end;

  procedure TfrmDisplay.Form_Load;
    var
      i : smallint; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      self.SetColours;
      formHeight := self.ScaleHeight;
      setForm;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar(Error + vbNewLine + 'Error loading Display form'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmDisplay.setForm;
    begin
      self.Left := xPos * Screen.TwipsPerPixelX;
      self.Top := yPos * Screen.TwipsPerPixelY;
      if collapsed
        then
          begin
            self.Height := 19 * Screen.TwipsPerPixelY;
          end
        else
          begin
            self.Height := formHeight * Screen.TwipsPerPixelY;
          end;
    end;

  procedure TfrmDisplay.setLayer( var Index : smallint; var value : boolean );
    begin
      layers[Index] := value;
      mouseEvent2( picLayer( Index ), 0, 0, BUTTON_SMALL, layers[Index], BUTTON_UP );
    end;

  procedure TfrmDisplay.lblLayer_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      picLayer_MouseMove( Index, Button, 0, 0, 0 );
    end;

  procedure TfrmDisplay.picLayer_MouseDown( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picLayer( Index ), X, Y, BUTTON_SMALL, layers[Index], BUTTON_DOWN );
    end;

  procedure TfrmDisplay.picLayer_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picLayer( Index ), X, Y, BUTTON_SMALL, layers[Index], BUTTON_MOVE, lblLayer( Index ).Width + 16 );
    end;

  procedure TfrmDisplay.picLayer_MouseUp( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      layers[Index] := not layers[Index];
      frmSoldatMapEditor.setDispOptions( Index, layers[Index] );
      mouseEvent2( frmDisplay.picLayer( Index ), 0, 0, BUTTON_SMALL, layers[Index], BUTTON_UP );
    end;

  procedure TfrmDisplay.picTitle_DblClick;
    begin
      collapsed := not collapsed;
      if collapsed
        then
          begin
            self.Height := 19 * Screen.TwipsPerPixelY;
          end
        else
          begin
            self.Height := formHeight * Screen.TwipsPerPixelY;
          end;
    end;

  procedure TfrmDisplay.picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      ReleaseCapture;
      SendMessage( self.hWnd, WM_NCLBUTTONDOWN, 2, 0 );
      snapForm( self, frmPalette );
      snapForm( self, frmWaypoints );
      snapForm( self, frmTools );
      snapForm( self, frmScenery );
      snapForm( self, frmInfo );
      snapForm( self, frmTexture );
      snapForm( self, frmSoldatMapEditor );
      xPos := self.Left / Screen.TwipsPerPixelX;
      yPos := self.Top / Screen.TwipsPerPixelY;
    end;

  procedure TfrmDisplay.picHide_Click;
    begin
      self.Hide;
      frmSoldatMapEditor.mnuDisplay.Checked := false;
    end;

  procedure TfrmDisplay.picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN );
    end;

  procedure TfrmDisplay.picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE );
    end;

  procedure TfrmDisplay.picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_UP );
    end;

  procedure TfrmDisplay.refreshButtons;
    var
      i : smallint; 
    begin
      for i := 0 to 10 do
        begin
          mouseEvent2( picLayer( i ), 0, 0, BUTTON_SMALL, layers[i], BUTTON_UP );
        end;
    end;

  procedure TfrmDisplay.SetColours;
    var
      i : smallint; 
      c : Control; 
    begin
      //ON ERROR
      picTitle.Picture := LoadPicture( appPath + '\' + gfxDir + '\titlebar_display.bmp' );
      mouseEvent2( picHide, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      self.BackColor := bgClr;
      for i := 0 to 10 do
        begin
          lblLayer( i ).BackColor := lblBackClr;
          lblLayer( i ).ForeColor := lblTextClr;
        end;
      //FOREACH
    end;

end.

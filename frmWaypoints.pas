unit frmWaypoints;

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
    TfrmWaypoints =
      class( TForm )
        cboSpecial : TComboBox;
        frmWaypoints : TForm;
        lblNumCon : TLabel;
        lblPath_0 : TLabel;
        lblPath_1 : TLabel;
        lblShow_0 : TLabel;
        lblShow_1 : TLabel;
        lblShow_2 : TLabel;
        lblType_2 : TLabel;
        lblType_1 : TLabel;
        lblType_3 : TLabel;
        lblType_0 : TLabel;
        lblType_4 : TLabel;
        lblWaypoints : TLabel;
        picHide : TPaintBox;
        picPath_0 : TPaintBox;
        picPath_1 : TPaintBox;
        picShow_0 : TPaintBox;
        picShow_1 : TPaintBox;
        picShow_2 : TPaintBox;
        picTitle : TPaintBox;
        picType_0 : TPaintBox;
        picType_1 : TPaintBox;
        picType_2 : TPaintBox;
        picType_3 : TPaintBox;
        picType_4 : TPaintBox;
        private
          formHeight : smallint; 
          fcollapsed : boolean;
          fxPos : smallint;
          fyPos : smallint;
          wayptType : array[0..4] of boolean; 
          fwayptPath : byte;
          fshowPaths : byte;
          wayptKeys : array[0..4] of byte; 
          fnoChange : boolean;
          procedure Form_Load;
          procedure cboSpecial_Click;
          procedure lblPath_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure lblShow_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure lblType_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picTitle_DblClick;
          procedure picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_Click;
          procedure picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picPath_MouseDown( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picPath_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picPath_MouseUp( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picType_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picShow_MouseDown( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picShow_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
        public
          function getWayptKey( Index : byte ) : byte;
          function setWayptKey( var Index : smallint; value : byte ) : olevariant;
          procedure setForm;
          procedure getPathNum( var tehValue : byte );
          procedure getWayType( var Index : smallint; var tehValue : boolean );
          procedure ClearWaypt;
          procedure picType_MouseDown( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picType_MouseUp( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picShow_MouseUp( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure SetColours;
          property collapsed : boolean read fcollapsed write fcollapsed; 
          property xPos : smallint read fxPos write fxPos; 
          property yPos : smallint read fyPos write fyPos; 
          property wayptPath : byte read fwayptPath write fwayptPath; 
          property showPaths : byte read fshowPaths write fshowPaths; 
          property noChange : boolean read fnoChange write fnoChange; 
      end;

implementation

  {$R *.DFM}

  function TfrmWaypoints.getWayptKey( Index : byte ) : byte;
    begin
      result := wayptKeys[Index];
    end;

  function TfrmWaypoints.setWayptKey( var Index : smallint; value : byte ) : olevariant;
    begin
      if ( value > 0 )
        then
          begin
            wayptKeys[Index] := value;
          end;
    end;

  procedure TfrmWaypoints.Form_Load;
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
      Application.MessageBox( pchar(Error + vbNewLine + 'Error loading Waypoints form'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmWaypoints.setForm;
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

  procedure TfrmWaypoints.cboSpecial_Click;
    begin
      if ( noChange = false ) and ( cboSpecial.ListIndex > -1 )
        then
          begin
            if not frmSoldatMapEditor.setSpecial( cboSpecial.ListIndex )
              then
                begin
                  cboSpecial.ListIndex := -1;
                end;
          end;
    end;

  procedure TfrmWaypoints.getPathNum( var tehValue : byte );
    begin
      mouseEvent2( picPath( 0 ), 0, 0, BUTTON_SMALL, ( tehValue = 1 ), BUTTON_UP );
      mouseEvent2( picPath( 1 ), 0, 0, BUTTON_SMALL, ( tehValue = 2 ), BUTTON_UP );
      wayptPath := tehValue - 1;
    end;

  procedure TfrmWaypoints.getWayType( var Index : smallint; var tehValue : boolean );
    begin
      wayptType[Index] := tehValue;
      mouseEvent2( picType( Index ), 0, 0, BUTTON_SMALL, tehValue, BUTTON_UP );
    end;

  procedure TfrmWaypoints.lblPath_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      picPath_MouseMove( Index, 1, 0, 0, 0 );
    end;

  procedure TfrmWaypoints.lblShow_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      picShow_MouseMove( Index, Button, 0, 0, 0 );
    end;

  procedure TfrmWaypoints.lblType_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      picType_MouseMove( Index, Button, 0, 0, 0 );
    end;

  procedure TfrmWaypoints.ClearWaypt;
    var
      i : smallint; 
    begin
      for i := 0 to 4 do
        begin
          mouseEvent2( picType( i ), 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
          wayptType[i] := false;
        end;
      cboSpecial.ListIndex := -1;
      lblNumCon.Caption := '';
    end;

  procedure TfrmWaypoints.picTitle_DblClick;
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

  procedure TfrmWaypoints.picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      ReleaseCapture;
      SendMessage( self.hWnd, WM_NCLBUTTONDOWN, 2, 0 );
      snapForm( self, frmPalette );
      snapForm( self, frmInfo );
      snapForm( self, frmTools );
      snapForm( self, frmScenery );
      snapForm( self, frmDisplay );
      snapForm( self, frmTexture );
      snapForm( self, frmSoldatMapEditor );
      xPos := self.Left / Screen.TwipsPerPixelX;
      yPos := self.Top / Screen.TwipsPerPixelY;
    end;

  procedure TfrmWaypoints.picHide_Click;
    begin
      self.Hide;
      frmSoldatMapEditor.mnuWaypoints.Checked := false;
    end;

  procedure TfrmWaypoints.picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN );
    end;

  procedure TfrmWaypoints.picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE );
    end;

  procedure TfrmWaypoints.picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_UP );
    end;

  procedure TfrmWaypoints.picPath_MouseDown( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picPath( Index ), X, Y, BUTTON_SMALL, ( Index = wayptPath ), BUTTON_DOWN );
    end;

  procedure TfrmWaypoints.picPath_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picPath( Index ), X, Y, BUTTON_SMALL, ( Index = wayptPath ), BUTTON_MOVE, lblPath( Index ).Width + 16 );
    end;

  procedure TfrmWaypoints.picPath_MouseUp( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    var
      i : smallint; 
    begin
      wayptPath := Index;
      for i := 0 to 1 do
        begin
          if ( i <> Index )
            then
              begin
                mouseEvent2( picPath( i ), X, Y, BUTTON_SMALL, ( i = wayptPath ), BUTTON_UP );
              end;
        end;
      frmSoldatMapEditor.setPathNum( Index + 1 );
    end;

  procedure TfrmWaypoints.picType_MouseDown( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picType( Index ), X, Y, BUTTON_SMALL, wayptType[Index], BUTTON_DOWN );
    end;

  procedure TfrmWaypoints.picType_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picType( Index ), X, Y, BUTTON_SMALL, wayptType[Index], BUTTON_MOVE, lblType( Index ).Width + 16 );
    end;

  procedure TfrmWaypoints.picType_MouseUp( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      if not frmSoldatMapEditor.setWayType( Index, not wayptType[Index] )
        then
          begin
            exit;
          end;
      wayptType[Index] := not wayptType[Index];
      mouseEvent2( picType( Index ), 0, 0, BUTTON_SMALL, wayptType[Index], BUTTON_UP );
      if ( Index = 0 )
        then
          begin
            wayptType[1] := false;
            mouseEvent2( picType( 1 ), 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
          end
        else
      if ( Index = 1 )
        then
          begin
            wayptType[0] := false;
            mouseEvent2( picType( 0 ), 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
          end
        else
      if ( Index = 2 )
        then
          begin
            wayptType[3] := false;
            mouseEvent2( picType( 3 ), 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
          end
        else
      if ( Index = 3 )
        then
          begin
            wayptType[2] := false;
            mouseEvent2( picType( 2 ), 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
          end;
    end;

  procedure TfrmWaypoints.picShow_MouseDown( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picShow( Index ), X, Y, BUTTON_SMALL, ( Index = showPaths ), BUTTON_DOWN );
    end;

  procedure TfrmWaypoints.picShow_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picShow( Index ), X, Y, BUTTON_SMALL, ( Index = showPaths ), BUTTON_MOVE, lblShow( Index ).Width + 16 );
    end;

  procedure TfrmWaypoints.picShow_MouseUp( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    var
      i : smallint; 
    begin
      showPaths := Index;
      for i := 0 to 2 do
        begin
          if ( i <> Index )
            then
              begin
                mouseEvent2( picShow( i ), X, Y, BUTTON_SMALL, ( i = showPaths ), BUTTON_UP );
              end;
        end;
      frmSoldatMapEditor.setShowPaths;
    end;

  procedure TfrmWaypoints.SetColours;
    var
      i : smallint; 
      c : Control; 
    begin
      //ON ERROR
      //--------
      picTitle.Picture := LoadPicture( appPath + '\' + gfxDir + '\titlebar_waypoints.bmp' );
      mouseEvent2( picHide, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      mouseEvent2( picPath( 0 ), 0, 0, BUTTON_SMALL, true, BUTTON_UP );
      mouseEvent2( picPath( 1 ), 0, 0, BUTTON_SMALL, false, BUTTON_UP );
      for i := 0 to 4 do
        begin
          mouseEvent2( picType( i ), 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
        end;
      for i := 0 to 2 do
        begin
          mouseEvent2( picShow( i ), 0, 0, BUTTON_SMALL, ( i = showPaths ), BUTTON_UP );
        end;
      //--------
      self.BackColor := bgClr;
      for i := 0 to 4 do
        begin
          lblType( i ).BackColor := lblBackClr;
          lblType( i ).ForeColor := lblTextClr;
        end;
      for i := 0 to 1 do
        begin
          lblPath( i ).BackColor := lblBackClr;
          lblPath( i ).ForeColor := lblTextClr;
        end;
      for i := 0 to 2 do
        begin
          lblShow( i ).BackColor := lblBackClr;
          lblShow( i ).ForeColor := lblTextClr;
        end;
      lblWaypoints.BackColor := lblBackClr;
      lblWaypoints.ForeColor := lblTextClr;
      cboSpecial.BackColor := txtBackClr;
      cboSpecial.ForeColor := txtTextClr;
      lblNumCon.BackColor := lblBackClr;
      lblNumCon.ForeColor := lblTextClr;
      //FOREACH
    end;

end.

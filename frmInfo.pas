unit frmInfo;

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
    TfrmInfo =
      class( TForm )
        cboLevel : TComboBox;
        cboPolyType : TComboBox;
        cmdDefault : TButton;
        diagonal : VB.Line;
        frmInfo : TForm;
        lblCoords : TLabel;
        lblCount_0 : TLabel;
        lblCount_1 : TLabel;
        lblCount_2 : TLabel;
        lblCount_3 : TLabel;
        lblCount_4 : TLabel;
        lblCount_5 : TLabel;
        lblCount_6 : TLabel;
        lblDimensions : TLabel;
        lblHeight : TLabel;
        lblIndex : TLabel;
        lblInfo_2 : TLabel;
        lblInfo_3 : TLabel;
        lblInfo_15 : TLabel;
        lblInfo_16 : TLabel;
        lblInfo_32 : TLabel;
        lblInfo_33 : TLabel;
        lblInfo_34 : TLabel;
        lblInfo_35 : TLabel;
        lblInfo_14 : TLabel;
        lblInfo_0 : TLabel;
        lblInfo_10 : TLabel;
        lblInfo_11 : TLabel;
        lblInfo_1 : TLabel;
        lblInfo_13 : TLabel;
        lblInfo_12 : TLabel;
        lblInfo_5 : TLabel;
        lblInfo_7 : TLabel;
        lblInfo_6 : TLabel;
        lblInfo_18 : TLabel;
        lblInfo_17 : TLabel;
        lblInfo_4 : TLabel;
        lblInfo_22 : TLabel;
        lblInfo_21 : TLabel;
        lblInfo_19 : TLabel;
        lblInfo_20 : TLabel;
        lblInfo_24 : TLabel;
        lblInfo_23 : TLabel;
        lblInfo_26 : TLabel;
        lblInfo_25 : TLabel;
        lblInfo_8 : TLabel;
        lblInfo_9 : TLabel;
        lblInfo_27 : TLabel;
        lblInfo_28 : TLabel;
        lblInfo_29 : TLabel;
        lblInfo_30 : TLabel;
        lblInfo_31 : TLabel;
        lblSelPolys : TLabel;
        lblSelScenery : TLabel;
        mnuProp_5 : TMenuItem;
        mnuProp_4 : TMenuItem;
        mnuProp_3 : TMenuItem;
        mnuProp_2 : TMenuItem;
        mnuProp_1 : TMenuItem;
        mnuProp_0 : TMenuItem;
        mnuProperties : TMenuItem;
        picHide : TPaintBox;
        picLight : TPaintBox;
        picProp_0 : TPaintBox;
        picProp_2 : TPaintBox;
        picProp_3 : TPaintBox;
        picProp_1 : TPaintBox;
        picProp_5 : TPaintBox;
        picProp_4 : TPaintBox;
        picPropMenu : TPaintBox;
        picTitle : TPaintBox;
        square : TShape;
        txtBounciness : TEdit;
        txtLightProp_2 : TEdit;
        txtLightProp_0 : TEdit;
        txtLightProp_1 : TEdit;
        txtQuadX_0 : TEdit;
        txtQuadX_1 : TEdit;
        txtQuadY_0 : TEdit;
        txtQuadY_1 : TEdit;
        txtRotate : TEdit;
        txtScale_0 : TEdit;
        txtScale_1 : TEdit;
        txtScenProp_3 : TEdit;
        txtScenProp_2 : TEdit;
        txtScenProp_1 : TEdit;
        txtScenProp_0 : TEdit;
        txtTexture_0 : TEdit;
        txtTexture_1 : TEdit;
        txtVertexAlpha : TEdit;
        private
          formHeight : smallint; 
          fcollapsed : boolean;
          tempVal : single; 
          fxPos : smallint;
          fyPos : smallint;
          fnoChange : boolean;
          applyChange : boolean; 
          procedure Form_Load;
          procedure cboPolyType_Click;
          procedure txtLightProp_GotFocus( var Index : smallint );
          procedure txtLightProp_LostFocus( var Index : smallint );
          procedure picLight_Click;
          procedure txtQuadX_GotFocus( var Index : smallint );
          procedure txtQuadX_LostFocus( var Index : smallint );
          procedure txtQuadY_GotFocus( var Index : smallint );
          procedure txtQuadY_LostFocus( var Index : smallint );
          procedure txtRotate_GotFocus;
          procedure txtRotate_LostFocus;
          procedure txtScale_GotFocus( var Index : smallint );
          procedure txtScale_LostFocus( var Index : smallint );
          procedure cboLevel_Click;
          procedure txtScenProp_GotFocus( var Index : smallint );
          procedure txtScenProp_LostFocus( var Index : smallint );
          procedure txtTexture_GotFocus( var Index : smallint );
          procedure txtTexture_LostFocus( var Index : smallint );
          procedure txtVertexAlpha_GotFocus;
          procedure txtVertexAlpha_LostFocus;
          procedure txtBounciness_GotFocus;
          procedure txtBounciness_LostFocus;
          procedure cmdDefault_Click;
          procedure picTitle_DblClick;
          procedure picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_Click;
          procedure picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picPropMenu_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picPropMenu_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
        public
          procedure setForm;
          procedure mnuProp_Click( var Index : smallint );
          procedure SetColours;
          property collapsed : boolean read fcollapsed write fcollapsed; 
          property xPos : smallint read fxPos write fxPos; 
          property yPos : smallint read fyPos write fyPos; 
          property noChange : boolean read fnoChange write fnoChange; 
      end;

implementation

  {$R *.DFM}

  procedure TfrmInfo.Form_Load;
    label
      ErrorHandler;
    begin
      //ON ERROR
      self.SetColours;
      formHeight := self.ScaleHeight;
      setForm;
      //----
      cboPolyType.ListIndex := 0;
      lblDimensions.Caption := 'Dimensions: ' + frmSoldatMapEditor.xTexture + ' x ' + frmSoldatMapEditor.yTexture;
      txtQuadX( 0 ).Text := 0;
      txtQuadY( 0 ).Text := 0;
      txtQuadX( 1 ).Text := frmSoldatMapEditor.xTexture;
      txtQuadY( 1 ).Text := frmSoldatMapEditor.yTexture;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar(Error + vbNewLine + 'Error loading Properties form'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmInfo.setForm;
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

  procedure TfrmInfo.cboPolyType_Click;
    begin
      if not noChange
        then
          begin
            frmSoldatMapEditor.applyPolyType( cboPolyType.ListIndex );
          end;
      if ( cboPolyType.ListIndex = 18 )
        then
          begin
            txtBounciness.Enabled := true;
          end
        else
          begin
            txtBounciness.Enabled := false;
          end;
    end;

  procedure TfrmInfo.txtLightProp_GotFocus( var Index : smallint );
    begin
      if IsNumeric( txtLightProp( Index ).Text )
        then
          begin
            tempVal := txtLightProp( Index ).Text;
          end;
      SelectAllText( txtLightProp( Index ) );
    end;

  procedure TfrmInfo.txtLightProp_LostFocus( var Index : smallint );
    begin
      if IsNumeric( txtLightProp( Index ).Text ) and applyChange
        then
          begin
            if ( Index = 0 )
              then
                begin
                  frmSoldatMapEditor.applyLightProp( txtLightProp( Index ).Text, Index );
                end
              else
            if ( Index = 1 ) and ( txtLightProp( Index ).Text >= 0 )
              then
                begin
                  frmSoldatMapEditor.applyLightProp( txtLightProp( Index ).Text, Index );
                end
              else
            if ( Index = 1 ) and ( txtLightProp( Index ).Text >= 0 ) and ( txtLightProp( Index ).Text <= 100 )
              then
              else
                begin
                  txtLightProp( Index ).Text := tempVal;
                end;
          end
        else
          begin
            txtLightProp( Index ).Text := tempVal;
          end;
      tempVal := 0;
      applyChange := false;
    end;

  procedure TfrmInfo.picLight_Click;
    begin
      frmSoldatMapEditor.setLightColour;
    end;

  procedure TfrmInfo.txtQuadX_GotFocus( var Index : smallint );
    begin
      if IsNumeric( txtQuadX( Index ).Text )
        then
          begin
            tempVal := txtQuadX( Index ).Text;
          end;
      SelectAllText( txtQuadX( Index ) );
    end;

  procedure TfrmInfo.txtQuadX_LostFocus( var Index : smallint );
    begin
      if not IsNumeric( txtQuadX( Index ).Text )
        then
          begin
            txtQuadX( Index ).Text := tempVal;
          end
        else
      if ( txtQuadX( Index ).Text < 0 ) or ( txtQuadX( Index ).Text > frmSoldatMapEditor.xTexture )
        then
          begin
            txtQuadX( Index ).Text := tempVal;
          end
        else
          begin
            frmTexture.setTexCoords( txtQuadX( Index ).Text, Index );
          end;
      tempVal := 0;
    end;

  procedure TfrmInfo.txtQuadY_GotFocus( var Index : smallint );
    begin
      if IsNumeric( txtQuadY( Index ).Text )
        then
          begin
            tempVal := txtQuadY( Index ).Text;
          end;
      SelectAllText( txtQuadY( Index ) );
    end;

  procedure TfrmInfo.txtQuadY_LostFocus( var Index : smallint );
    begin
      if not IsNumeric( txtQuadY( Index ).Text )
        then
          begin
            txtQuadY( Index ).Text := tempVal;
          end
        else
      if ( txtQuadY( Index ).Text < 0 ) or ( txtQuadY( Index ).Text > frmSoldatMapEditor.yTexture )
        then
          begin
            txtQuadY( Index ).Text := tempVal;
          end
        else
          begin
            frmTexture.setTexCoords( txtQuadY( Index ).Text, Index + 2 );
          end;
      tempVal := 0;
    end;

  procedure TfrmInfo.txtRotate_GotFocus;
    begin
      if IsNumeric( txtRotate.Text )
        then
          begin
            tempVal := txtRotate.Text;
          end;
    end;

  procedure TfrmInfo.txtRotate_LostFocus;
    begin
      if IsNumeric( txtRotate.Text ) and applyChange
        then
          begin
            frmSoldatMapEditor.applyRotate( ( txtRotate.Text / 180 * pi ) );
          end
        else
          begin
            txtRotate.Text := tempVal;
          end;
      tempVal := 0;
    end;

  procedure TfrmInfo.txtScale_GotFocus( var Index : smallint );
    begin
      if IsNumeric( txtScale( Index ).Text )
        then
          begin
            tempVal := txtScale( Index ).Text;
          end;
    end;

  procedure TfrmInfo.txtScale_LostFocus( var Index : smallint );
    begin
      if IsNumeric( txtScale( Index ).Text ) and applyChange
        then
          begin
            if ( Index = 0 )
              then
                begin
                  frmSoldatMapEditor.applyScale( ( txtScale( Index ).Text / 100 ), 1 );
                end
              else
            if ( Index = 1 )
              then
                begin
                  frmSoldatMapEditor.applyScale( 1, ( txtScale( Index ).Text / 100 ) );
                end;
          end
        else
          begin
            txtScale( Index ).Text := tempVal;
          end;
      tempVal := 0;
      applyChange := false;
    end;

  procedure TfrmInfo.cboLevel_Click;
    begin
      if not noChange
        then
          begin
            frmSoldatMapEditor.applySceneryProp( cboLevel.ListIndex, 4 );
          end;
    end;

  procedure TfrmInfo.txtScenProp_GotFocus( var Index : smallint );
    begin
      if IsNumeric( txtScenProp( Index ).Text )
        then
          begin
            tempVal := txtScenProp( Index ).Text;
          end;
      SelectAllText( txtScenProp( Index ) );
    end;

  procedure TfrmInfo.txtScenProp_LostFocus( var Index : smallint );
    begin
      if IsNumeric( txtScenProp( Index ).Text ) and applyChange
        then
          begin
            if ( Index = 0 ) or ( Index = 1 )
              then
                begin
                  frmSoldatMapEditor.applySceneryProp( txtScenProp( Index ).Text / 100, Index );
                end
              else
            if ( Index = 2 ) and ( txtScenProp( Index ).Text >= 0 ) and ( txtScenProp( Index ).Text <= 100 )
              then
                begin
                  frmSoldatMapEditor.applySceneryProp( ( txtScenProp( Index ).Text / 100 ) * 255, Index );
                end
              else
            if ( Index = 3 ) and ( txtScenProp( Index ).Text >= -360 ) and ( txtScenProp( Index ).Text <= 360 )
              then
                begin
                  frmSoldatMapEditor.applySceneryProp( txtScenProp( Index ).Text / 180 * pi, Index );
                end
              else
                begin
                  txtScenProp( Index ).Text := tempVal;
                end;
          end
        else
          begin
            txtScenProp( Index ).Text := tempVal;
          end;
      tempVal := 0;
      applyChange := false;
    end;

  procedure TfrmInfo.txtTexture_GotFocus( var Index : smallint );
    begin
      if IsNumeric( txtTexture( Index ).Text )
        then
          begin
            tempVal := txtTexture( Index ).Text;
          end;
    end;

  procedure TfrmInfo.txtTexture_LostFocus( var Index : smallint );
    begin
      if IsNumeric( txtTexture( Index ).Text ) and applyChange
        then
          begin
            frmSoldatMapEditor.applyTextureCoords( txtTexture( Index ).Text, Index );
          end
        else
          begin
            txtTexture( Index ).Text := tempVal;
          end;
      tempVal := 0;
      applyChange := false;
    end;

  procedure TfrmInfo.txtVertexAlpha_GotFocus;
    begin
      if IsNumeric( txtVertexAlpha.Text )
        then
          begin
            tempVal := txtVertexAlpha.Text;
          end;
    end;

  procedure TfrmInfo.txtVertexAlpha_LostFocus;
    begin
      if not IsNumeric( txtVertexAlpha.Text )
        then
          begin
            txtVertexAlpha.Text := tempVal;
          end
        else
      if ( txtVertexAlpha.Text < 0 ) or ( txtVertexAlpha.Text > 100 )
        then
          begin
            txtVertexAlpha.Text := tempVal;
          end
        else
      if applyChange
        then
          begin
            frmSoldatMapEditor.applyVertexAlpha( txtVertexAlpha.Text / 100 );
          end;
      tempVal := 0;
      applyChange := false;
    end;

  procedure TfrmInfo.txtBounciness_GotFocus;
    begin
      if IsNumeric( txtBounciness.Text )
        then
          begin
            tempVal := txtBounciness.Text;
          end;
    end;

  procedure TfrmInfo.txtBounciness_LostFocus;
    begin
      if not IsNumeric( txtBounciness.Text )
        then
          begin
            txtBounciness.Text := tempVal;
          end
        else
      if ( txtBounciness.Text < 0 )
        then
          begin
            txtBounciness.Text := tempVal;
          end
        else
      if applyChange
        then
          begin
            frmSoldatMapEditor.applyBounciness( 1 + ( txtBounciness.Text / 100 ) );
          end;
      tempVal := 0;
      applyChange := false;
    end;

  procedure TfrmInfo.cmdDefault_Click;
    begin
      applyChange := true;
      cmdDefault.SetFocus;
      frmSoldatMapEditor.RegainFocus;
    end;

  procedure TfrmInfo.mnuProp_Click( var Index : smallint );
    var
      i : smallint; 
    begin
      for i := 0 to 5 do
        begin
          mnuProp( i ).Checked := false;
          picProp( i ).Visible := false;
        end;
      mnuProp( Index ).Checked := true;
      picProp( Index ).Visible := true;
    end;

  procedure TfrmInfo.picTitle_DblClick;
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

  procedure TfrmInfo.picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      ReleaseCapture;
      SendMessage( self.hWnd, WM_NCLBUTTONDOWN, 2, 0 );
      snapForm( self, frmPalette );
      snapForm( self, frmWaypoints );
      snapForm( self, frmTools );
      snapForm( self, frmScenery );
      snapForm( self, frmDisplay );
      snapForm( self, frmTexture );
      snapForm( self, frmSoldatMapEditor );
      xPos := self.Left / Screen.TwipsPerPixelX;
      yPos := self.Top / Screen.TwipsPerPixelY;
    end;

  procedure TfrmInfo.picHide_Click;
    begin
      self.Hide;
      frmSoldatMapEditor.mnuInfo.Checked := false;
    end;

  procedure TfrmInfo.picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN );
    end;

  procedure TfrmInfo.picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE );
    end;

  procedure TfrmInfo.picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_UP );
    end;

  procedure TfrmInfo.picPropMenu_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picPropMenu, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN );
      PopupMenu( mnuProperties, Unassigned, picPropMenu.Left + 32, picPropMenu.Top + 16 );
      mouseEvent2( picPropMenu, X, Y, BUTTON_SMALL, 0, BUTTON_UP );
    end;

  procedure TfrmInfo.picPropMenu_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picPropMenu, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE );
    end;

  procedure TfrmInfo.SetColours;
    var
      i : smallint; 
      c : Control; 
    begin
      //ON ERROR
      picTitle.Picture := LoadPicture( appPath + '\' + gfxDir + '\titlebar_properties.bmp' );
      mouseEvent2( picHide, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      mouseEvent2( picPropMenu, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      self.BackColor := bgClr;
      for i := 0 to 35 do
        begin
          lblInfo( i ).BackColor := lblBackClr;
          lblInfo( i ).ForeColor := lblTextClr;
        end;
      for i := 0 to 5 do
        begin
          picProp( i ).BackColor := bgClr;
        end;
      for i := 0 to 1 do
        begin
          txtScenProp( i ).BackColor := txtBackClr;
          txtScenProp( i ).ForeColor := txtTextClr;
          txtQuadX( i ).BackColor := bgClr;
          txtQuadX( i ).ForeColor := lblTextClr;
          txtQuadY( i ).BackColor := bgClr;
          txtQuadY( i ).ForeColor := lblTextClr;
        end;
      for i := 0 to 1 do
        begin
          txtScale( i ).BackColor := txtBackClr;
          txtScale( i ).ForeColor := txtTextClr;
          txtTexture( i ).BackColor := txtBackClr;
          txtTexture( i ).ForeColor := txtTextClr;
        end;
      for i := 0 to 6 do
        begin
          lblCount( i ).BackColor := lblBackClr;
          lblCount( i ).ForeColor := lblTextClr;
        end;
      lblDimensions.BackColor := lblBackClr;
      lblDimensions.ForeColor := lblTextClr;
      txtRotate.BackColor := txtBackClr;
      txtRotate.ForeColor := txtTextClr;
      cboLevel.BackColor := txtBackClr;
      cboLevel.ForeColor := txtTextClr;
      cboPolyType.BackColor := txtBackClr;
      cboPolyType.ForeColor := txtTextClr;
      txtLightProp( 0 ).BackColor := txtBackClr;
      txtLightProp( 0 ).ForeColor := txtTextClr;
      square.BorderColor := lblTextClr;
      diagonal.BorderColor := lblTextClr;
      //FOREACH
    end;

end.

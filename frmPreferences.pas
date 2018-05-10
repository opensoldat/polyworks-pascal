unit frmPreferences;

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
    TfrmPreferences =
      class( TForm )
        cboPolyDest : TComboBox;
        cboPolySrc : TComboBox;
        cboSkin : TComboBox;
        cboWireDest : TComboBox;
        cboWireSrc : TComboBox;
        fraPref_4 : TShape;
        fraPref_0 : TShape;
        fraPref_2 : TShape;
        fraPref_1 : TShape;
        fraPref_3 : TShape;
        fraPref_5 : TShape;
        frmPreferences : TForm;
        lblBlending : TLabel;
        lblDirs : TLabel;
        lblDisplay : TLabel;
        lblHotkeys : TLabel;
        lblOther : TLabel;
        lblPref_2 : TLabel;
        lblPref_4 : TLabel;
        lblPref_21 : TLabel;
        lblPref_20 : TLabel;
        lblPref_3 : TLabel;
        lblPref_19 : TLabel;
        lblPref_18 : TLabel;
        lblPref_9 : TLabel;
        lblPref_5 : TLabel;
        lblPref_6 : TLabel;
        lblPref_13 : TLabel;
        lblPref_0 : TLabel;
        lblPref_1 : TLabel;
        lblPref_7 : TLabel;
        lblPref_8 : TLabel;
        lblPref_14 : TLabel;
        lblPref_15 : TLabel;
        lblPref_11 : TLabel;
        lblPref_12 : TLabel;
        lblPref_10 : TLabel;
        lblPref_16 : TLabel;
        lblPref_17 : TLabel;
        lblPref_22 : TLabel;
        lblPref_23 : TLabel;
        lblPref_24 : TLabel;
        lblWayKeys : TLabel;
        picApply : TPaintBox;
        picBackClr : TPaintBox;
        picCancel : TPaintBox;
        picFolder : TPaintBox;
        picGridClr : TPaintBox;
        picGridClr2 : TPaintBox;
        picHide : TPaintBox;
        picHotkeys : TPaintBox;
        picOK : TPaintBox;
        picPointClr : TPaintBox;
        picPrefabs : TPaintBox;
        picScenery : TPaintBox;
        picSekrit : TPaintBox;
        picSelectionClr : TPaintBox;
        picTitle : TPaintBox;
        picTopmost : TPaintBox;
        picUncomp : TPaintBox;
        txtDir : TEdit;
        txtDivisions : TEdit;
        txtHeight : TEdit;
        txtHotkey_0 : TEdit;
        txtHotkey_1 : TEdit;
        txtHotkey_2 : TEdit;
        txtHotkey_3 : TEdit;
        txtHotkey_4 : TEdit;
        txtHotkey_5 : TEdit;
        txtHotkey_6 : TEdit;
        txtHotkey_7 : TEdit;
        txtHotkey_8 : TEdit;
        txtHotkey_9 : TEdit;
        txtHotkey_10 : TEdit;
        txtHotkey_11 : TEdit;
        txtHotkey_12 : TEdit;
        txtHotkey_13 : TEdit;
        txtOpacity1 : TEdit;
        txtOpacity2 : TEdit;
        txtPrefabs : TEdit;
        txtSpacing : TEdit;
        txtUncomp : TEdit;
        txtWayptKey_0 : TEdit;
        txtWayptKey_1 : TEdit;
        txtWayptKey_2 : TEdit;
        txtWayptKey_3 : TEdit;
        txtWayptKey_4 : TEdit;
        txtWidth : TEdit;
        private
          blendModes : array[0..7] of smallint; 
          backClr : TColour; 
          pointClr : TColour; 
          selClr : TColour; 
          gridClr : TColour; 
          gridClr2 : TColour; 
          spacing : smallint; 
          divisions : smallint; 
          formWidth : smallint; 
          formHeight : smallint; 
          opacity1 : smallint; 
          opacity2 : smallint; 
          sceneryVerts : boolean; 
          topmost : boolean; 
          procedure picHide_Click;
          procedure picSekrit_Click;
          procedure picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picApply_Click;
          procedure picCancel_Click;
          function applyPreferences : boolean;
          procedure picOK_Click;
          procedure Form_Load;
          function FileExists( var fileName : widestring ) : boolean;
          procedure picPointClr_Click;
          procedure picSelectionClr_Click;
          procedure picBackClr_Click;
          procedure picGridClr_Click;
          procedure picGridClr2_Click;
          procedure picFolder_Click;
          procedure picUncomp_Click;
          procedure picPrefabs_Click;
          procedure txtHotkey_GotFocus( var Index : smallint );
          procedure txtHotkey_KeyDown( var Index : smallint; var KeyCode : smallint; var Shift : smallint );
          procedure txtHotkey_KeyPress( var Index : smallint; var KeyAscii : smallint );
          procedure txtWayptKey_GotFocus( var Index : smallint );
          procedure txtWayptKey_KeyDown( var Index : smallint; var KeyCode : smallint; var Shift : smallint );
          procedure txtWayptKey_KeyPress( var Index : smallint; var KeyAscii : smallint );
          procedure txtSpacing_Change;
          procedure txtSpacing_GotFocus;
          procedure txtSpacing_LostFocus;
          procedure txtDivisions_Change;
          procedure txtDivisions_GotFocus;
          procedure txtDivisions_LostFocus;
          procedure txtOpacity1_Change;
          procedure txtOpacity1_GotFocus;
          procedure txtOpacity1_LostFocus;
          procedure txtOpacity2_Change;
          procedure txtOpacity2_GotFocus;
          procedure txtOpacity2_LostFocus;
          procedure txtWidth_Change;
          procedure txtWidth_GotFocus;
          procedure txtWidth_LostFocus;
          procedure txtHeight_Change;
          procedure txtHeight_GotFocus;
          procedure txtHeight_LostFocus;
          function getRGB( var DecValue : longint ) : TColour;
          procedure picSekrit_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picSekrit_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picCancel_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picCancel_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picOK_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picOK_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picApply_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picApply_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picfolder_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picfolder_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picUncomp_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picUncomp_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picPrefabs_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picPrefabs_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picScenery_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picScenery_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picScenery_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picTopmost_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picTopmost_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picTopmost_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
        public
          procedure SetColours;
      end;

implementation

  {$R *.DFM}

  type
    TColour = 
      packed record
        red : byte; 
        green : byte; 
        blue : byte; 
      end;

  procedure TfrmPreferences.picHide_Click;
    begin
      self.ScaleHeight := 408;
      Unload( self );
      frmSoldatMapEditor.RegainFocus;
    end;

  procedure TfrmPreferences.picSekrit_Click;
    begin
      if ( self.ScaleHeight < 460 )
        then
          begin
            self.Height := 544 * Screen.TwipsPerPixelY;
          end
        else
          begin
            self.Height := 440 * Screen.TwipsPerPixelY;
          end;
    end;

  procedure TfrmPreferences.picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      ReleaseCapture;
      SendMessage( self.hWnd, WM_NCLBUTTONDOWN, 2, 0 );
    end;

  procedure TfrmPreferences.picApply_Click;
    begin
      applyPreferences;
    end;

  procedure TfrmPreferences.picCancel_Click;
    begin
      self.ScaleHeight := 408;
      Unload( self );
      frmSoldatMapEditor.RegainFocus;
    end;

  function TfrmPreferences.applyPreferences : boolean;
    var
      i : smallint; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      mouseEvent2( picHide, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      mouseEvent2( picOK, 0, 0, BUTTON_LARGE, 0, BUTTON_UP );
      mouseEvent2( picCancel, 0, 0, BUTTON_LARGE, 0, BUTTON_UP );
      mouseEvent2( picSekrit, 0, 0, BUTTON_LARGE, 0, BUTTON_UP );
      mouseEvent2( picApply, 0, 0, BUTTON_LARGE, 0, BUTTON_UP );
      mouseEvent2( picFolder, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      if ( RightStr(txtDir.Text, 1) <> '\' )
        then
          begin
            txtDir.Text := txtDir.Text + '\';
          end;
      if ( length( Dir( txtDir.Text, vbDirectory ) ) <> 0 ) and ( frmSoldatMapEditor.soldatDir <> txtDir.Text )
        then
          begin
            if ( not length( Dir( txtDir.Text + 'Maps\', vbDirectory ) ) <> 0 )
              then
                begin
                  Application.MessageBox( pchar('''Maps'' folder does not exist in Soldat directory.'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
                  exit;
                end;
            if ( not length( Dir( txtDir.Text + 'Textures\', vbDirectory ) ) <> 0 )
              then
                begin
                  Application.MessageBox( pchar('''Textures'' folder does not exist in Soldat directory.'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
                  exit;
                end;
            if ( not length( Dir( txtDir.Text + 'Scenery-gfx\', vbDirectory ) ) <> 0 )
              then
                begin
                  Application.MessageBox( pchar('''Scenery-gfx'' folder does not exist in Soldat directory.'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
                  exit;
                end;
            frmSoldatMapEditor.soldatDir := txtDir.Text;
          end
        else
      if ( length( Dir( txtDir.Text, vbDirectory ) ) = 0 )
        then
          begin
            Application.MessageBox( pchar('Soldat directory does not exist.'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
            exit;
          end;
      if ( RightStr(txtUncomp.Text, 1) <> '\' )
        then
          begin
            txtUncomp.Text := txtUncomp.Text + '\';
          end;
      if ( length( Dir( txtUncomp.Text, vbDirectory ) ) <> 0 )
        then
          begin
            frmSoldatMapEditor.uncompDir := txtUncomp.Text;
          end
        else
          begin
            Application.MessageBox( pchar('Uncompiled Maps directory does not exist.'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
            exit;
          end;
      if ( RightStr(txtPrefabs.Text, 1) <> '\' )
        then
          begin
            txtPrefabs.Text := txtPrefabs.Text + '\';
          end;
      if ( length( Dir( txtPrefabs.Text, vbDirectory ) ) <> 0 )
        then
          begin
            frmSoldatMapEditor.prefabDir := txtPrefabs.Text;
          end
        else
          begin
            Application.MessageBox( pchar('Prefabs Maps directory does not exist.'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
            exit;
          end;
      frmSoldatMapEditor.wireBlendSrc := blendModes[cboWireSrc.ListIndex];
      frmSoldatMapEditor.wireBlendDest := blendModes[cboWireDest.ListIndex];
      frmSoldatMapEditor.polyBlendSrc := blendModes[cboPolySrc.ListIndex];
      frmSoldatMapEditor.polyBlendDest := blendModes[cboPolyDest.ListIndex];
      frmSoldatMapEditor.backClr := RGB( backClr.blue, backClr.green, backClr.red );
      frmSoldatMapEditor.pointClr := RGB( pointClr.blue, pointClr.green, pointClr.red );
      frmSoldatMapEditor.selectionClr := RGB( selClr.blue, selClr.green, selClr.red );
      frmSoldatMapEditor.gridClr := RGB( gridClr.blue, gridClr.green, gridClr.red );
      frmSoldatMapEditor.gridClr2 := RGB( gridClr2.blue, gridClr2.green, gridClr2.red );
      frmSoldatMapEditor.formWidth := formWidth;
      frmSoldatMapEditor.formHeight := formHeight;
      if ( frmSoldatMapEditor.WindowState = vbNormal )
        then
          begin
            frmSoldatMapEditor.Width := formWidth * Screen.TwipsPerPixelX;
            frmSoldatMapEditor.Height := formHeight * Screen.TwipsPerPixelY;
          end
        else
      if ( frmSoldatMapEditor.WindowState = vbMaximized )
        then
          begin
            frmSoldatMapEditor.WindowState := vbNormal;
            frmSoldatMapEditor.Width := formWidth * Screen.TwipsPerPixelX;
            frmSoldatMapEditor.Height := formHeight * Screen.TwipsPerPixelY;
            frmSoldatMapEditor.WindowState := vbMaximized;
          end;
      frmSoldatMapEditor.gridSpacing := spacing;
      frmSoldatMapEditor.gridDivisions := divisions;
      frmSoldatMapEditor.gridOp1 := opacity1 / 100 * 255;
      frmSoldatMapEditor.gridOp2 := opacity2 / 100 * 255;
      frmSoldatMapEditor.sceneryVerts := sceneryVerts;
      frmSoldatMapEditor.topmost := topmost;
      for i := 0 to 13 do
        begin
          frmTools.setHotKey( i, MapVirtualKey( VarAsType( txtHotkey( i ).Tag, varSmallint ), 0 ) );
          frmTools.picTools( i ).ToolTipText := frmTools.picTools( i ).Tag + ' (' + ( txtHotkey( i ).Text ) + ')';
        end;
      for i := 0 to 4 do
        begin
          frmWaypoints.setWayptKey( i, MapVirtualKey( VarAsType( txtWayptKey( i ).Tag, varSmallint ), 0 ) );
          frmWaypoints.picType( i ).ToolTipText := ' (' + ( txtWayptKey( i ).Text ) + ')';
          frmWaypoints.lblType( i ).ToolTipText := ' (' + ( txtWayptKey( i ).Text ) + ')';
        end;
      if ( cboSkin.List( cboSkin.ListIndex ) <> gfxDir )
        then
          begin
            gfxDir := cboSkin.List( cboSkin.ListIndex );
            frmSoldatMapEditor.loadColours;
            frmSoldatMapEditor.SetColours;
            frmSoldatMapEditor.initGfx;
            frmColour.SetColours;
            frmDisplay.SetColours;
            frmInfo.SetColours;
            frmMap.SetColours;
            frmPalette.SetColours;
            frmPreferences.SetColours;
            frmScenery.SetColours;
            frmSoldatMapEditor.SetColours;
            frmTexture.SetColours;
            frmTools.SetColours;
            frmWaypoints.SetColours;
            frmDisplay.refreshButtons;
          end;
      frmSoldatMapEditor.setPreferences;
      result := true;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar('Error applying preferences' + vbNewLine + Error), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmPreferences.picOK_Click;
    begin
      self.ScaleHeight := 408;
      self.Hide;
      if applyPreferences
        then
          begin
            Unload( self );
            frmSoldatMapEditor.RegainFocus;
          end
        else
          begin
            self.Show;
          end;
    end;

  procedure TfrmPreferences.Form_Load;
    var
      i : smallint; 
      file : olevariant; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      sceneryVerts := frmSoldatMapEditor.sceneryVerts;
      topmost := frmSoldatMapEditor.topmost;
      self.SetColours;
      blendModes[0] := 1;
      blendModes[1] := 2;
      blendModes[2] := 3;
      blendModes[3] := 4;
      blendModes[4] := 9;
      blendModes[5] := 10;
      blendModes[6] := 5;
      blendModes[7] := 6;
      backClr := getRGB( frmSoldatMapEditor.backClr );
      pointClr := getRGB( frmSoldatMapEditor.pointClr );
      selClr := getRGB( frmSoldatMapEditor.selectionClr );
      gridClr := getRGB( frmSoldatMapEditor.gridClr );
      gridClr2 := getRGB( frmSoldatMapEditor.gridClr2 );
      for i := 0 to 7 do
        begin
          if ( frmSoldatMapEditor.wireBlendSrc = blendModes[i] )
            then
              begin
                cboWireSrc.ListIndex := i;
              end;
          if ( frmSoldatMapEditor.wireBlendDest = blendModes[i] )
            then
              begin
                cboWireDest.ListIndex := i;
              end;
          if ( frmSoldatMapEditor.polyBlendSrc = blendModes[i] )
            then
              begin
                cboPolySrc.ListIndex := i;
              end;
          if ( frmSoldatMapEditor.polyBlendDest = blendModes[i] )
            then
              begin
                cboPolyDest.ListIndex := i;
              end;
        end;
      self.picBackClr.BackColor := RGB( backClr.red, backClr.green, backClr.blue );
      self.picPointClr.BackColor := RGB( pointClr.red, pointClr.green, pointClr.blue );
      self.picSelectionClr.BackColor := RGB( selClr.red, selClr.green, selClr.blue );
      self.picGridClr.BackColor := RGB( gridClr.red, gridClr.green, gridClr.blue );
      self.picGridClr2.BackColor := RGB( gridClr2.red, gridClr2.green, gridClr2.blue );
      txtWidth.Text := frmSoldatMapEditor.formWidth;
      txtHeight.Text := frmSoldatMapEditor.formHeight;
      formWidth := txtWidth.Text;
      formHeight := txtHeight.Text;
      txtSpacing.Text := frmSoldatMapEditor.gridSpacing;
      txtDivisions.Text := frmSoldatMapEditor.gridDivisions;
      spacing := txtSpacing.Text;
      divisions := txtDivisions.Text;
      opacity1 := frmSoldatMapEditor.gridOp1 / 255 * 100;
      txtOpacity1.Text := opacity1;
      opacity2 := frmSoldatMapEditor.gridOp2 / 255 * 100;
      txtOpacity2.Text := opacity2;
      for i := 0 to 13 do
        begin
          txtHotkey( i ).Text := Chr( MapVirtualKey( frmTools.getHotKey( i ), 1 ) );
          txtHotkey( i ).Tag := Asc( txtHotkey( i ).Text );
        end;
      for i := 0 to 4 do
        begin
          txtWayptKey( i ).Text := Chr( MapVirtualKey( frmWaypoints.getWayptKey( i ), 1 ) );
          txtWayptKey( i ).Tag := Asc( txtWayptKey( i ).Text );
        end;
      file := Dir( appPath + '\*.*', vbDirectory );
      while length( file ) do
        begin
          if FileExists( appPath + '\' + file + '\colours.ini' )
            then
              begin
                cboSkin.AddItem( file );
                if ( file = gfxDir )
                  then
                    begin
                      cboSkin.ListIndex := cboSkin.ListCount - 1;
                    end;
              end;
          file := Dir;
        end;
      txtDir.Text := frmSoldatMapEditor.soldatDir;
      txtUncomp.Text := frmSoldatMapEditor.uncompDir;
      txtPrefabs.Text := frmSoldatMapEditor.prefabDir;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar(Error + vbNewLine + 'Error loading Preferences form'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  function TfrmPreferences.FileExists( var fileName : widestring ) : boolean;
    label
      ErrorHandler;
    begin
      //ON ERROR
      result := ( FileLen( fileName ) > 0 );
      ErrorHandler:
    end;

  procedure TfrmPreferences.picPointClr_Click;
    begin
      frmColour.InitClr( pointClr.red, pointClr.green, pointClr.blue );
      frmColour.Show( 1 );
      picPointClr.BackColor := RGB( frmColour.red, frmColour.green, frmColour.blue );
      pointClr.red := frmColour.red;
      pointClr.green := frmColour.green;
      pointClr.blue := frmColour.blue;
    end;

  procedure TfrmPreferences.picSelectionClr_Click;
    begin
      frmColour.InitClr( selClr.red, selClr.green, selClr.blue );
      frmColour.Show( 1 );
      picSelectionClr.BackColor := RGB( frmColour.red, frmColour.green, frmColour.blue );
      selClr.red := frmColour.red;
      selClr.green := frmColour.green;
      selClr.blue := frmColour.blue;
    end;

  procedure TfrmPreferences.picBackClr_Click;
    begin
      frmColour.InitClr( backClr.red, backClr.green, backClr.blue );
      frmColour.Show( 1 );
      picBackClr.BackColor := RGB( frmColour.red, frmColour.green, frmColour.blue );
      backClr.red := frmColour.red;
      backClr.green := frmColour.green;
      backClr.blue := frmColour.blue;
    end;

  procedure TfrmPreferences.picGridClr_Click;
    begin
      frmColour.InitClr( gridClr.red, gridClr.green, gridClr.blue );
      frmColour.Show( 1 );
      picGridClr.BackColor := RGB( frmColour.red, frmColour.green, frmColour.blue );
      gridClr.red := frmColour.red;
      gridClr.green := frmColour.green;
      gridClr.blue := frmColour.blue;
    end;

  procedure TfrmPreferences.picGridClr2_Click;
    begin
      frmColour.InitClr( gridClr2.red, gridClr2.green, gridClr2.blue );
      frmColour.Show( 1 );
      picGridClr2.BackColor := RGB( frmColour.red, frmColour.green, frmColour.blue );
      gridClr2.red := frmColour.red;
      gridClr2.green := frmColour.green;
      gridClr2.blue := frmColour.blue;
    end;

  procedure TfrmPreferences.picFolder_Click;
    var
      folder : widestring; 
    begin
      folder := SelectFolder( self );
      if ( RightStr(folder, 1) <> '\' )
        then
          begin
            folder := folder + '\';
          end;
      if ( length( folder ) > 1 )
        then
          begin
            txtDir.Text := folder;
          end;
      mouseEvent2( picFolder, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
    end;

  procedure TfrmPreferences.picUncomp_Click;
    var
      folder : widestring; 
    begin
      folder := SelectFolder( self );
      if ( RightStr(folder, 1) <> '\' )
        then
          begin
            folder := folder + '\';
          end;
      if ( length( folder ) > 1 )
        then
          begin
            txtUncomp.Text := folder;
          end;
      mouseEvent2( picUncomp, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
    end;

  procedure TfrmPreferences.picPrefabs_Click;
    var
      folder : widestring; 
    begin
      folder := SelectFolder( self );
      if ( RightStr(folder, 1) <> '\' )
        then
          begin
            folder := folder + '\';
          end;
      if ( length( folder ) > 1 )
        then
          begin
            txtPrefabs.Text := folder;
          end;
      mouseEvent2( picPrefabs, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
    end;

  procedure TfrmPreferences.txtHotkey_GotFocus( var Index : smallint );
    begin
      txtHotkey( Index ).SelStart := 0;
      txtHotkey( Index ).SelLength := length( txtHotkey( Index ).Text );
    end;

  procedure TfrmPreferences.txtHotkey_KeyDown( var Index : smallint; var KeyCode : smallint; var Shift : smallint );
    begin
      txtHotkey( Index ).Tag := KeyCode;
    end;

  procedure TfrmPreferences.txtHotkey_KeyPress( var Index : smallint; var KeyAscii : smallint );
    begin
      txtHotkey( Index ).Text := UpperCase(Chr( KeyAscii ));
      KeyAscii := 0;
    end;

  procedure TfrmPreferences.txtWayptKey_GotFocus( var Index : smallint );
    begin
      txtWayptKey( Index ).SelStart := 0;
      txtWayptKey( Index ).SelLength := length( txtWayptKey( Index ).Text );
    end;

  procedure TfrmPreferences.txtWayptKey_KeyDown( var Index : smallint; var KeyCode : smallint; var Shift : smallint );
    begin
      txtWayptKey( Index ).Tag := KeyCode;
    end;

  procedure TfrmPreferences.txtWayptKey_KeyPress( var Index : smallint; var KeyAscii : smallint );
    begin
      txtWayptKey( Index ).Text := UpperCase(Chr( KeyAscii ));
      KeyAscii := 0;
    end;

  procedure TfrmPreferences.txtSpacing_Change;
    begin
      if ( IsNumeric( txtSpacing.Text ) = false ) and ( txtSpacing.Text <> '' )
        then
          begin
            txtSpacing.Text := spacing;
          end;
    end;

  procedure TfrmPreferences.txtSpacing_GotFocus;
    begin
      txtSpacing.SelStart := 0;
      txtSpacing.SelLength := length( txtSpacing.Text );
    end;

  procedure TfrmPreferences.txtSpacing_LostFocus;
    begin
      if ( IsNumeric( txtSpacing.Text ) = false ) and ( txtSpacing.Text <> '' )
        then
          begin
            txtSpacing.Text := spacing;
          end
        else
      if ( txtSpacing.Text = '' )
        then
          begin
            txtSpacing.Text := spacing;
          end
        else
      if ( txtSpacing.Text >= 10 ) and ( txtSpacing.Text <= 100 )
        then
          begin
            spacing := Floor( txtSpacing.Text );
            txtSpacing.Text := spacing;
          end
        else
          begin
            if ( txtSpacing.Text < 10 )
              then
                begin
                  spacing := 10;
                end;
            if ( txtSpacing.Text > 100 )
              then
                begin
                  spacing := 100;
                end;
            txtSpacing.Text := spacing;
          end;
    end;

  procedure TfrmPreferences.txtDivisions_Change;
    begin
      if ( IsNumeric( txtDivisions.Text ) = false ) and ( txtDivisions.Text <> '' )
        then
          begin
            txtDivisions.Text := divisions;
          end;
    end;

  procedure TfrmPreferences.txtDivisions_GotFocus;
    begin
      txtDivisions.SelStart := 0;
      txtDivisions.SelLength := length( txtDivisions.Text );
    end;

  procedure TfrmPreferences.txtDivisions_LostFocus;
    begin
      if ( IsNumeric( txtDivisions.Text ) = false ) and ( txtDivisions.Text <> '' )
        then
          begin
            txtDivisions.Text := divisions;
          end
        else
      if ( txtDivisions.Text = '' )
        then
          begin
            txtDivisions.Text := divisions;
          end
        else
      if ( txtDivisions.Text >= 1 ) and ( txtDivisions.Text <= 10 )
        then
          begin
            divisions := Floor( txtDivisions.Text );
            txtDivisions := divisions;
          end
        else
          begin
            if ( txtDivisions.Text < 1 )
              then
                begin
                  divisions := 1;
                end;
            if ( txtDivisions.Text > Floor( spacing / 4 ) )
              then
                begin
                  divisions := Floor( spacing / 4 );
                end;
            txtDivisions.Text := divisions;
          end;
    end;

  procedure TfrmPreferences.txtOpacity1_Change;
    begin
      if ( IsNumeric( txtOpacity1.Text ) = false ) and ( txtOpacity1.Text <> '' )
        then
          begin
            txtOpacity1.Text := opacity1;
          end;
    end;

  procedure TfrmPreferences.txtOpacity1_GotFocus;
    begin
      txtOpacity1.SelStart := 0;
      txtOpacity1.SelLength := length( txtOpacity1.Text );
    end;

  procedure TfrmPreferences.txtOpacity1_LostFocus;
    begin
      if ( IsNumeric( txtOpacity1.Text ) = false ) and ( txtOpacity1.Text <> '' )
        then
          begin
            txtOpacity1.Text := opacity1;
          end
        else
      if ( txtOpacity1.Text = '' )
        then
          begin
            txtOpacity1.Text := opacity1;
          end
        else
      if ( txtOpacity1.Text >= 10 ) and ( txtOpacity1.Text <= 100 )
        then
          begin
            opacity1 := Floor( txtOpacity1.Text );
            txtOpacity1.Text := opacity1;
          end
        else
          begin
            txtOpacity1.Text := opacity1;
          end;
    end;

  procedure TfrmPreferences.txtOpacity2_Change;
    begin
      if ( IsNumeric( txtOpacity2.Text ) = false ) and ( txtOpacity2.Text <> '' )
        then
          begin
            txtOpacity2.Text := opacity2;
          end;
    end;

  procedure TfrmPreferences.txtOpacity2_GotFocus;
    begin
      txtOpacity2.SelStart := 0;
      txtOpacity2.SelLength := length( txtOpacity2.Text );
    end;

  procedure TfrmPreferences.txtOpacity2_LostFocus;
    begin
      if ( IsNumeric( txtOpacity2.Text ) = false ) and ( txtOpacity2.Text <> '' )
        then
          begin
            txtOpacity2.Text := opacity2;
          end
        else
      if ( txtOpacity2.Text = '' )
        then
          begin
            txtOpacity2.Text := opacity2;
          end
        else
      if ( txtOpacity2.Text >= 10 ) and ( txtOpacity2.Text <= 100 )
        then
          begin
            opacity2 := Floor( txtOpacity2.Text );
            txtOpacity2.Text := opacity2;
          end
        else
          begin
            txtOpacity2.Text := opacity2;
          end;
    end;

  procedure TfrmPreferences.txtWidth_Change;
    begin
      if ( IsNumeric( txtWidth.Text ) = false ) and ( txtWidth.Text <> '' )
        then
          begin
            txtWidth.Text := formWidth;
          end;
    end;

  procedure TfrmPreferences.txtWidth_GotFocus;
    begin
      txtWidth.SelStart := 0;
      txtWidth.SelLength := length( txtWidth.Text );
    end;

  procedure TfrmPreferences.txtWidth_LostFocus;
    begin
      if ( IsNumeric( txtWidth.Text ) = false ) and ( txtWidth.Text <> '' )
        then
          begin
            txtWidth.Text := formWidth;
          end
        else
      if ( txtWidth.Text = '' )
        then
          begin
            txtWidth.Text := formWidth;
          end
        else
      if ( txtWidth.Text >= 320 ) and ( txtWidth.Text <= Screen.Width / Screen.TwipsPerPixelX )
        then
          begin
            formWidth := Floor( txtWidth.Text );
            txtWidth.Text := formWidth;
          end
        else
          begin
            if ( txtWidth.Text < 320 )
              then
                begin
                  formWidth := 320;
                end;
            if ( txtWidth.Text > ( Screen.Width / Screen.TwipsPerPixelX ) )
              then
                begin
                  formWidth := ( Screen.Width / Screen.TwipsPerPixelX );
                end;
            txtWidth.Text := formWidth;
          end;
    end;

  procedure TfrmPreferences.txtHeight_Change;
    begin
      if ( IsNumeric( txtHeight.Text ) = false ) and ( txtHeight.Text <> '' )
        then
          begin
            txtHeight.Text := formHeight;
          end;
    end;

  procedure TfrmPreferences.txtHeight_GotFocus;
    begin
      txtHeight.SelStart := 0;
      txtHeight.SelLength := length( txtHeight.Text );
    end;

  procedure TfrmPreferences.txtHeight_LostFocus;
    begin
      if ( IsNumeric( txtHeight.Text ) = false ) and ( txtHeight.Text <> '' )
        then
          begin
            txtHeight.Text := formHeight;
          end
        else
      if ( txtHeight.Text = '' )
        then
          begin
            txtHeight.Text := formHeight;
          end
        else
      if ( txtHeight.Text >= 320 ) and ( txtHeight.Text <= Screen.Height / Screen.TwipsPerPixelY )
        then
          begin
            formHeight := Floor( txtHeight.Text );
            txtHeight.Text := formHeight;
          end
        else
          begin
            if ( txtHeight.Text < 320 )
              then
                begin
                  formHeight := 320;
                end;
            if ( txtHeight.Text > ( Screen.Height / Screen.TwipsPerPixelY ) )
              then
                begin
                  formHeight := ( Screen.Height / Screen.TwipsPerPixelY );
                end;
            txtHeight.Text := formHeight;
          end;
    end;

  function TfrmPreferences.getRGB( var DecValue : longint ) : TColour;
    var
      hexValue : widestring; 
    begin
      hexValue := Hex( Val( DecValue ) );
      if ( length( hexValue ) < 6 )
        then
          begin
            hexValue := StringOfChar( '0', 6 - length( hexValue ) ) + hexValue;
          end;
      result.red := StrToInt( '&H' + Copy(hexValue, 1, 2) );
      result.green := StrToInt( '&H' + Copy(hexValue, 3, 2) );
      result.blue := StrToInt( '&H' + Copy(hexValue, 5, 2) );
    end;

  procedure TfrmPreferences.picSekrit_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picSekrit, X, Y, BUTTON_LARGE, 0, BUTTON_DOWN );
    end;

  procedure TfrmPreferences.picSekrit_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picSekrit, X, Y, BUTTON_LARGE, 0, BUTTON_MOVE );
    end;

  procedure TfrmPreferences.picCancel_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picCancel, X, Y, BUTTON_LARGE, 0, BUTTON_DOWN );
    end;

  procedure TfrmPreferences.picCancel_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picCancel, X, Y, BUTTON_LARGE, 0, BUTTON_MOVE );
    end;

  procedure TfrmPreferences.picOK_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picOK, X, Y, BUTTON_LARGE, 0, BUTTON_DOWN );
    end;

  procedure TfrmPreferences.picOK_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picOK, X, Y, BUTTON_LARGE, 0, BUTTON_MOVE );
    end;

  procedure TfrmPreferences.picApply_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picApply, X, Y, BUTTON_LARGE, 0, BUTTON_DOWN );
    end;

  procedure TfrmPreferences.picApply_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picApply, X, Y, BUTTON_LARGE, 0, BUTTON_MOVE );
    end;

  procedure TfrmPreferences.picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN );
    end;

  procedure TfrmPreferences.picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE );
    end;

  procedure TfrmPreferences.picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_UP );
    end;

  procedure TfrmPreferences.picfolder_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picFolder, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN );
    end;

  procedure TfrmPreferences.picfolder_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picFolder, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE );
    end;

  procedure TfrmPreferences.picUncomp_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picUncomp, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN );
    end;

  procedure TfrmPreferences.picUncomp_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picUncomp, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE );
    end;

  procedure TfrmPreferences.picPrefabs_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picPrefabs, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN );
    end;

  procedure TfrmPreferences.picPrefabs_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picPrefabs, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE );
    end;

  procedure TfrmPreferences.picScenery_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picScenery, X, Y, BUTTON_SMALL, sceneryVerts, BUTTON_DOWN );
    end;

  procedure TfrmPreferences.picScenery_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picScenery, X, Y, BUTTON_SMALL, sceneryVerts, BUTTON_MOVE );
    end;

  procedure TfrmPreferences.picScenery_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      sceneryVerts := not sceneryVerts;
      mouseEvent2( picScenery, X, Y, BUTTON_SMALL, sceneryVerts, BUTTON_UP );
    end;

  procedure TfrmPreferences.picTopmost_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picTopmost, X, Y, BUTTON_SMALL, topmost, BUTTON_DOWN );
    end;

  procedure TfrmPreferences.picTopmost_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picTopmost, X, Y, BUTTON_SMALL, topmost, BUTTON_MOVE );
    end;

  procedure TfrmPreferences.picTopmost_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      topmost := not topmost;
      mouseEvent2( picTopmost, X, Y, BUTTON_SMALL, topmost, BUTTON_UP );
    end;

  procedure TfrmPreferences.SetColours;
    var
      i : smallint; 
      c : Control; 
    begin
      //ON ERROR
      //--------
      picTitle.Picture := LoadPicture( appPath + '\' + gfxDir + '\titlebar_preferences.bmp' );
      picHotkeys.Picture := LoadPicture( appPath + '\' + gfxDir + '\tools.bmp' );
      mouseEvent2( picHide, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      mouseEvent2( picOK, 0, 0, BUTTON_LARGE, 0, BUTTON_UP );
      mouseEvent2( picCancel, 0, 0, BUTTON_LARGE, 0, BUTTON_UP );
      mouseEvent2( picSekrit, 0, 0, BUTTON_LARGE, 0, BUTTON_UP );
      mouseEvent2( picApply, 0, 0, BUTTON_LARGE, 0, BUTTON_UP );
      mouseEvent2( picFolder, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      mouseEvent2( picUncomp, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      mouseEvent2( picPrefabs, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      mouseEvent2( picScenery, 0, 0, BUTTON_SMALL, sceneryVerts, BUTTON_UP );
      mouseEvent2( picTopmost, 0, 0, BUTTON_SMALL, topmost, BUTTON_UP );
      //--------
      self.BackColor := bgClr;
      for i := 0 to 22 do
        begin
          lblPref( i ).BackColor := lblBackClr;
          lblPref( i ).ForeColor := lblTextClr;
        end;
      lblDisplay.BackColor := bgClr;
      lblDisplay.ForeColor := lblTextClr;
      lblHotkeys.BackColor := bgClr;
      lblHotkeys.ForeColor := lblTextClr;
      lblDirs.BackColor := bgClr;
      lblDirs.ForeColor := lblTextClr;
      lblWayKeys.BackColor := bgClr;
      lblWayKeys.ForeColor := lblTextClr;
      lblBlending.BackColor := bgClr;
      lblBlending.ForeColor := lblTextClr;
      for i := 0 to 13 do
        begin
          txtHotkey( i ).BackColor := bgClr;
          txtHotkey( i ).ForeColor := lblTextClr;
        end;
      for i := 0 to 4 do
        begin
          txtWayptKey( i ).BackColor := bgClr;
          txtWayptKey( i ).ForeColor := lblTextClr;
          fraPref( i ).BorderColor := frameClr;
        end;
      txtWidth.BackColor := txtBackClr;
      txtWidth.ForeColor := txtTextClr;
      txtHeight.BackColor := txtBackClr;
      txtHeight.ForeColor := txtTextClr;
      txtSpacing.BackColor := txtBackClr;
      txtSpacing.ForeColor := txtTextClr;
      txtDivisions.BackColor := txtBackClr;
      txtDivisions.ForeColor := txtTextClr;
      txtOpacity1.BackColor := txtBackClr;
      txtOpacity1.ForeColor := txtTextClr;
      txtOpacity2.BackColor := txtBackClr;
      txtOpacity2.ForeColor := txtTextClr;
      txtDir.BackColor := txtBackClr;
      txtDir.ForeColor := txtTextClr;
      txtUncomp.BackColor := txtBackClr;
      txtUncomp.ForeColor := txtTextClr;
      txtPrefabs.BackColor := txtBackClr;
      txtPrefabs.ForeColor := txtTextClr;
      cboWireSrc.BackColor := txtBackClr;
      cboWireSrc.ForeColor := txtTextClr;
      cboWireDest.BackColor := txtBackClr;
      cboWireDest.ForeColor := txtTextClr;
      cboPolySrc.BackColor := txtBackClr;
      cboPolySrc.ForeColor := txtTextClr;
      cboPolyDest.BackColor := txtBackClr;
      cboPolyDest.ForeColor := txtTextClr;
      cboSkin.BackColor := txtBackClr;
      cboSkin.ForeColor := txtTextClr;
      //FOREACH
    end;

end.

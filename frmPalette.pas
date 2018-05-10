unit frmPalette;

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
    TfrmPalette =
      class( TForm )
        cboBlendMode : TComboBox;
        cmdDefault : TButton;
        commonDialog : MSComDlg.CommonDialog;
        frmPalette : TForm;
        lblClrMode_0 : TLabel;
        lblClrMode_1 : TLabel;
        lblClrMode_2 : TLabel;
        lblPal_4 : TLabel;
        lblPal_2 : TLabel;
        lblPal_1 : TLabel;
        lblPal_0 : TLabel;
        lblPal_5 : TLabel;
        lblPal_3 : TLabel;
        lblPal_6 : TLabel;
        mnuAddToPalette : TMenuItem;
        mnuClearPalette : TMenuItem;
        mnuLoadPalette : TMenuItem;
        mnuNewColour : TMenuItem;
        mnuPalette : TMenuItem;
        mnuSavePalette : TMenuItem;
        picClrMode_0 : TPaintBox;
        picClrMode_1 : TPaintBox;
        picClrMode_2 : TPaintBox;
        picColour : TPaintBox;
        picHide : TPaintBox;
        picPalette : TPaintBox;
        picPaletteMenu : TPaintBox;
        picTitle : TPaintBox;
        shpSel1 : TShape;
        shpSel2 : TShape;
        txtOpacity : TEdit;
        txtRadius : TEdit;
        txtRGB_2 : TEdit;
        txtRGB_1 : TEdit;
        txtRGB_0 : TEdit;
        private
          clrPalette : array[0..11, 0..5] of TColour; 
          formHeight : smallint; 
          fcollapsed : boolean;
          fxPos : smallint;
          fyPos : smallint;
          radius : smallint; 
          clrMode : byte; 
          xVal : smallint; 
          yVal : smallint; 
          tempVal : smallint; 
          function getRGB( var DecValue : longint ) : TColour;
          procedure cmdDefault_Click;
          procedure Form_Click;
          procedure Form_Load;
          procedure Form_LostFocus;
          procedure lblClrMode_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure mnuLoadPalette_Click;
          procedure mnuSavePalette_Click;
          procedure mnuClearPalette_Click;
          procedure picHide_Click;
          procedure picPalette_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure mnuAddToPalette_Click;
          procedure picColour_Click;
          procedure txtradius_Change;
          procedure txtradius_GotFocus;
          procedure txtradius_LostFocus;
          procedure txtRGB_Change( var Index : smallint );
          procedure txtRGB_GotFocus( var Index : smallint );
          procedure txtRGB_LostFocus( var Index : smallint );
          procedure txtOpacity_Change;
          procedure txtOpacity_GotFocus;
          procedure txtOpacity_LostFocus;
          procedure cboBlendMode_Click;
          procedure picClrMode_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picClrMode_MouseUp( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picTitle_DblClick;
          procedure picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picPaletteMenu_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picPaletteMenu_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
        public
          function getPalClr( var X : smallint; var Y : smallint ) : longint;
          procedure setPalClr( var X : smallint; var Y : smallint; var clrVal : longint );
          procedure refreshPalette( var R : smallint; var op : single; var blend : smallint; var mode : byte );
          procedure checkPalette( var red : byte; var green : byte; var blue : byte );
          procedure setForm;
          procedure loadPalette( var fileName : widestring );
          procedure savePalette( var fileName : widestring );
          procedure newPaletteColour;
          procedure setValues( var R : byte; var G : byte; var B : byte );
          function textControl : boolean;
          procedure picClrMode_MouseDown( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure SetColours;
          property collapsed : boolean read fcollapsed write fcollapsed; 
          property xPos : smallint read fxPos write fxPos; 
          property yPos : smallint read fyPos write fyPos; 
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

  function TfrmPalette.getPalClr( var X : smallint; var Y : smallint ) : longint;
    begin
      result := RGB( clrPalette[X, Y].blue, clrPalette[X, Y].green, clrPalette[X, Y].red );
    end;

  procedure TfrmPalette.setPalClr( var X : smallint; var Y : smallint; var clrVal : longint );
    begin
      clrPalette[X, Y] := getRGB( clrVal );
    end;

  procedure TfrmPalette.refreshPalette( var R : smallint; var op : single; var blend : smallint; var mode : byte );
    var
      X : smallint; 
      Y : smallint; 
      i : smallint; 
    begin
      for Y := 0 to 5 do
        begin
          for X := 0 to 11 do
            begin
              frmPalette.picPalette.Canvas.Rectangle({TODO});
            end;
        end;
      radius := R;
      txtRadius.Text := R;
      txtOpacity.Text := op * 100;
      cboBlendMode.ListIndex := blend;
      clrMode := mode;
      for i := 0 to 2 do
        begin
          if ( i = clrMode )
            then
              begin
                BitBlt( picClrMode( i ).hDC, 0, 0, 16, 16, frmSoldatMapEditor.picGfx.hDC, 96, 112, vbSrcCopy );
              end
            else
              begin
                BitBlt( picClrMode( i ).hDC, 0, 0, 16, 16, frmSoldatMapEditor.picGfx.hDC, 96, 96, vbSrcCopy );
              end;
          picClrMode( i ).Refresh;
        end;
      for i := 0 to 2 do
        begin
          mouseEvent2( picClrMode( i ), 0, 0, BUTTON_SMALL, ( clrMode = i ), BUTTON_UP );
        end;
    end;

  function TfrmPalette.getRGB( var DecValue : longint ) : TColour;
    var
      hexValue : widestring; 
    begin
      hexValue := Hex( Val( DecValue ) );
      if ( length( hexValue ) < 6 )
        then
          begin
            hexValue := StringOfChar( '0', 6 - length( hexValue ) ) + hexValue;
          end;
      result.blue := StrToInt( '&H' + RightStr(hexValue, 2) );
      hexValue := LeftStr(hexValue, length( hexValue ) - 2);
      result.green := StrToInt( '&H' + RightStr(hexValue, 2) );
      hexValue := LeftStr(hexValue, length( hexValue ) - 2);
      result.red := StrToInt( '&H' + RightStr(hexValue, 2) );
    end;

  procedure TfrmPalette.checkPalette( var red : byte; var green : byte; var blue : byte );
    var
      X : smallint; 
      Y : smallint; 
      foundClr : boolean; 
    begin
      for Y := 0 to 5 do
        begin
          for X := 0 to 11 do
            begin
              if ( red = clrPalette[X, Y].red ) and ( green = clrPalette[X, Y].green ) and ( blue = clrPalette[X, Y].blue ) and not foundClr
                then
                  begin
                    shpSel1.Left := X * 16 + 1;
                    shpSel1.Top := Y * 16 + 1;
                    shpSel2.Left := X * 16;
                    shpSel2.Top := Y * 16;
                    foundClr := true;
                  end;
            end;
        end;
    end;

  procedure TfrmPalette.cmdDefault_Click;
    begin
      cmdDefault.SetFocus;
    end;

  procedure TfrmPalette.Form_Click;
    begin
      cmdDefault.SetFocus;
    end;

  procedure TfrmPalette.Form_Load;
    var
      i : smallint; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      self.SetColours;
      frmPalette.loadPalette( appPath + '\palettes\current.txt' );
      setValues( frmColour.red, frmColour.green, frmColour.blue );
      shpSel1.Left := picPalette.ScaleWidth + 2;
      shpSel1.Top := picPalette.ScaleHeight + 2;
      shpSel2.Left := picPalette.ScaleWidth + 2;
      shpSel2.Top := picPalette.ScaleHeight + 2;
      formHeight := self.ScaleHeight;
      setForm;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar(Error + vbNewLine + 'Error loading Palette form'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmPalette.setForm;
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

  procedure TfrmPalette.loadPalette( var fileName : widestring );
    var
      X : smallint; 
      Y : smallint; 
      fileOpen : boolean; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      fileOpen := false;
      Assign( file1, fileName ); 
      Reset( file1 );
      fileOpen := true;
      for Y := 0 to 5 do
        begin
          for X := 0 to 11 do
            begin
              Read( file1, clrPalette[X, Y].red );
              Read( file1, clrPalette[X, Y].green );
              Read( file1, clrPalette[X, Y].blue );
              frmPalette.picPalette.Canvas.Rectangle({TODO});
            end;
        end;
      CloseFile( file1 );
      fileOpen := false;
      shpSel1.Left := picPalette.ScaleWidth + 2;
      shpSel1.Top := picPalette.ScaleHeight + 2;
      shpSel2.Left := picPalette.ScaleWidth + 2;
      shpSel2.Top := picPalette.ScaleHeight + 2;
      picPalette.Refresh;
      exit;
      ErrorHandler:
      mnuClearPalette_Click;
      if fileOpen
        then
          begin
            CloseFile( file1 );
          end;
      Application.MessageBox( pchar('Error loading palette' + vbNewLine + Error), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmPalette.Form_LostFocus;
    begin
      cmdDefault.SetFocus;
    end;

  procedure TfrmPalette.lblClrMode_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      picClrMode_MouseMove( Index, 1, 0, 0, 0 );
    end;

  procedure TfrmPalette.mnuLoadPalette_Click;
    label
      ErrorHandler;
    begin
      //ON ERROR
      commonDialog.InitDir := appPath + '\palettes\';
      commonDialog.DialogTitle := 'Load Palette';
      commonDialog.Filter := 'Text Documents (*.txt)|*.txt';
      commonDialog.ShowOpen;
      if ( commonDialog.fileName <> '' )
        then
          begin
            loadPalette( commonDialog.fileName );
          end;
      exit;
      ErrorHandler:
    end;

  procedure TfrmPalette.savePalette( var fileName : widestring );
    var
      X : smallint; 
      Y : smallint; 
      fileOpen : boolean; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      fileOpen := false;
      Assign( file1, fileName ); 
      Rewrite( file1 );
      fileOpen := true;
      for Y := 0 to 5 do
        begin
          for X := 0 to 11 do
            begin
              Write( file1, #9, clrPalette( X, Y ).red + ', ' + clrPalette( X, Y ).green + ', ' + clrPalette( X, Y ).blue );
            end;
        end;
      CloseFile( file1 );
      fileOpen := false;
      exit;
      ErrorHandler:
      if fileOpen
        then
          begin
            CloseFile( file1 );
          end;
      Application.MessageBox( pchar('Error saving palette' + vbNewLine + Error), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmPalette.mnuSavePalette_Click;
    label
      ErrorHandler;
    begin
      //ON ERROR
      commonDialog.InitDir := appPath + '\palettes\';
      commonDialog.DialogTitle := 'Save Palette';
      commonDialog.Filter := 'Text Documents (*.txt)|*.txt';
      commonDialog.ShowSave;
      if ( commonDialog.fileName <> '' )
        then
          begin
            savePalette( commonDialog.fileName );
          end;
      exit;
      ErrorHandler:
    end;

  procedure TfrmPalette.mnuClearPalette_Click;
    var
      X : smallint; 
      Y : smallint; 
    begin
      for Y := 0 to 5 do
        begin
          for X := 0 to 11 do
            begin
              clrPalette[X, Y].red := 0;
              clrPalette[X, Y].green := 0;
              clrPalette[X, Y].blue := 0;
              frmPalette.picPalette.Canvas.Rectangle({TODO});
            end;
        end;
      shpSel1.Left := picPalette.ScaleWidth + 2;
      shpSel1.Top := picPalette.ScaleHeight + 2;
      shpSel2.Left := picPalette.ScaleWidth + 2;
      shpSel2.Top := picPalette.ScaleHeight + 2;
    end;

  procedure TfrmPalette.picHide_Click;
    begin
      self.Hide;
      frmSoldatMapEditor.mnuPalette.Checked := false;
    end;

  procedure TfrmPalette.picPalette_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      if ( Button = 1 ) //select colour
        then
          begin
            xVal := Floor( X / 16 );
            yVal := Floor( Y / 16 );
            frmSoldatMapEditor.setPaletteColour( clrPalette[xVal, yVal].red, clrPalette[xVal, yVal].green, clrPalette[xVal, yVal].blue );
            txtRGB( 0 ).Text := clrPalette[xVal, yVal].red;
            txtRGB( 1 ).Text := clrPalette[xVal, yVal].green;
            txtRGB( 2 ).Text := clrPalette[xVal, yVal].blue;
            picColour.BackColor := RGB( clrPalette[xVal, yVal].red, clrPalette[xVal, yVal].green, clrPalette[xVal, yVal].blue );
            shpSel1.Left := Floor( X / 16 ) * 16 + 1;
            shpSel1.Top := Floor( Y / 16 ) * 16 + 1;
            shpSel2.Left := Floor( X / 16 ) * 16;
            shpSel2.Top := Floor( Y / 16 ) * 16;
          end
        else
      if ( Button = 2 ) //new colour
        then
          begin
            xVal := Floor( X / 16 );
            yVal := Floor( Y / 16 );
            self.PopupMenu( mnuNewColour );
          end;
      cmdDefault.SetFocus;
    end;

  procedure TfrmPalette.newPaletteColour;
    begin
      clrPalette[xVal, yVal].red := txtRGB( 0 ).Text;
      clrPalette[xVal, yVal].green := txtRGB( 1 ).Text;
      clrPalette[xVal, yVal].blue := txtRGB( 2 ).Text;
      picPalette.Canvas.Rectangle({TODO});
      shpSel1.Left := xVal * 16 + 1;
      shpSel1.Top := yVal * 16 + 1;
      shpSel2.Left := xVal * 16;
      shpSel2.Top := yVal * 16;
    end;

  procedure TfrmPalette.mnuAddToPalette_Click;
    begin
      newPaletteColour;
    end;

  procedure TfrmPalette.picColour_Click;
    begin
      frmColour.InitClr( txtRGB( 0 ).Text, txtRGB( 1 ).Text, txtRGB( 2 ).Text );
      frmColour.ChangeColour( picColour, txtRGB( 0 ).Text, txtRGB( 1 ).Text, txtRGB( 2 ).Text, 0 );
    end;

  procedure TfrmPalette.txtradius_Change;
    begin
      if ( IsNumeric( txtRadius.Text ) = false ) and ( txtRadius.Text <> '' )
        then
          begin
            txtRadius.Text := radius;
          end;
    end;

  procedure TfrmPalette.txtradius_GotFocus;
    begin
      SelectAllText( txtRadius );
    end;

  procedure TfrmPalette.txtradius_LostFocus;
    begin
      if ( IsNumeric( txtRadius.Text ) = false ) and ( txtRadius.Text <> '' )
        then
          begin
            txtRadius.Text := radius;
          end
        else
      if ( txtRadius.Text = '' )
        then
          begin
            txtRadius.Text := radius;
          end
        else
      if ( txtRadius.Text >= 4 ) and ( txtRadius.Text <= 128 )
        then
          begin
            radius := Floor( txtRadius.Text );
            txtRadius.Text := radius;
            frmSoldatMapEditor.setRadius( radius );
          end
        else
          begin
            if ( txtRadius.Text < 4 )
              then
                begin
                  radius := 4;
                end;
            if ( txtRadius.Text > 128 )
              then
                begin
                  radius := 128;
                end;
            txtRadius.Text := radius;
            frmSoldatMapEditor.setRadius( radius );
          end;
    end;

  procedure TfrmPalette.txtRGB_Change( var Index : smallint );
    begin
      if ( IsNumeric( txtRGB( Index ).Text ) = false ) and ( txtRGB( Index ).Text <> '' )
        then
        else
      if ( txtRGB( Index ).Text = '' )
        then
        else
      if ( txtRGB( Index ).Text >= 0 ) and ( txtRGB( Index ).Text <= 255 )
        then
          begin
            picColour.BackColor := RGB( txtRGB( 0 ).Text, txtRGB( 1 ).Text, txtRGB( 2 ).Text );
            frmSoldatMapEditor.setPolyColour( Index, txtRGB( Index ).Text );
          end;
    end;

  procedure TfrmPalette.txtRGB_GotFocus( var Index : smallint );
    begin
      if IsNumeric( txtRGB( Index ).Text )
        then
          begin
            tempVal := txtRGB( Index ).Text;
          end
        else
          begin
            tempVal := 0;
          end;
      SelectAllText( txtRGB( Index ) );
    end;

  procedure TfrmPalette.txtRGB_LostFocus( var Index : smallint );
    begin
      if not IsNumeric( txtRGB( Index ).Text )
        then
          begin
            txtRGB( Index ).Text := tempVal;
          end
        else
      if ( txtRGB( Index ).Text = '' )
        then
          begin
            txtRGB( Index ).Text := tempVal;
          end
        else
      if ( txtRGB( Index ).Text >= 0 ) and ( txtRGB( Index ).Text <= 255 )
        then
          begin
            frmSoldatMapEditor.setPolyColour( Index, txtRGB( Index ).Text );
          end
        else
          begin
            txtRGB( Index ).Text := tempVal;
          end;
      picColour.BackColor := RGB( txtRGB( 0 ).Text, txtRGB( 1 ).Text, txtRGB( 2 ).Text );
    end;

  procedure TfrmPalette.txtOpacity_Change;
    begin
      if ( IsNumeric( txtOpacity.Text ) = false ) and ( txtOpacity.Text <> '' )
        then
          begin
            txtOpacity.Text := 100;
          end
        else
      if ( txtOpacity.Text = '' )
        then
        else
      if ( txtOpacity.Text >= 0 ) and ( txtOpacity.Text <= 100 )
        then
          begin
            frmSoldatMapEditor.setPolyColour( 3, txtOpacity.Text );
          end;
    end;

  procedure TfrmPalette.txtOpacity_GotFocus;
    begin
      SelectAllText( txtOpacity );
    end;

  procedure TfrmPalette.txtOpacity_LostFocus;
    begin
      if ( txtOpacity.Text = '' )
        then
          begin
            txtOpacity.Text := 0;
          end
        else
      if ( txtOpacity.Text >= 0 ) and ( txtOpacity.Text <= 100 )
        then
        else
          begin
            txtOpacity.Text := 0;
          end;
    end;

  procedure TfrmPalette.cboBlendMode_Click;
    begin
      frmSoldatMapEditor.setBlendMode( cboBlendMode.ListIndex );
    end;

  procedure TfrmPalette.setValues( var R : byte; var G : byte; var B : byte );
    begin
      txtRGB( 0 ).Text := R;
      txtRGB( 1 ).Text := G;
      txtRGB( 2 ).Text := B;
      picColour.BackColor := RGB( R, G, B );
      shpSel1.Left := picPalette.ScaleWidth + 2;
      shpSel1.Top := picPalette.ScaleHeight + 2;
      shpSel2.Left := picPalette.ScaleWidth + 2;
      shpSel2.Top := picPalette.ScaleHeight + 2;
    end;

  function TfrmPalette.textControl : boolean;
    var
      i : smallint; 
    begin
      result := false;
      for i := 0 to 2 do
        begin
          if ( self.ActiveControl = txtRGB( i ) )
            then
              begin
                result := true;
              end;
        end;
      if ( self.ActiveControl = txtOpacity )
        then
          begin
            result := true;
          end
        else
      if ( self.ActiveControl = txtRadius )
        then
          begin
            result := true;
          end;
    end;

  procedure TfrmPalette.picClrMode_MouseDown( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picClrMode( Index ), X, Y, BUTTON_SMALL, ( Index = clrMode ), BUTTON_DOWN );
    end;

  procedure TfrmPalette.picClrMode_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picClrMode( Index ), X, Y, BUTTON_SMALL, ( Index = clrMode ), BUTTON_MOVE, lblClrMode( Index ).Width + 16 );
    end;

  procedure TfrmPalette.picClrMode_MouseUp( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    var
      i : smallint; 
    begin
      clrMode := Index;
      for i := 0 to 2 do
        begin
          if ( i <> Index )
            then
              begin
                mouseEvent2( picClrMode( i ), X, Y, BUTTON_SMALL, ( i = clrMode ), BUTTON_UP );
              end;
        end;
      frmSoldatMapEditor.setColourMode( clrMode );
      frmSoldatMapEditor.RegainFocus;
    end;

  procedure TfrmPalette.picTitle_DblClick;
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

  procedure TfrmPalette.picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      ReleaseCapture;
      SendMessage( self.hWnd, WM_NCLBUTTONDOWN, 2, 0 );
      snapForm( self, frmDisplay );
      snapForm( self, frmWaypoints );
      snapForm( self, frmTools );
      snapForm( self, frmScenery );
      snapForm( self, frmInfo );
      snapForm( self, frmTexture );
      snapForm( self, frmSoldatMapEditor );
      xPos := self.Left / Screen.TwipsPerPixelX;
      yPos := self.Top / Screen.TwipsPerPixelY;
    end;

  procedure TfrmPalette.picPaletteMenu_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picPaletteMenu, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN );
      PopupMenu( mnuPalette, Unassigned, picPaletteMenu.Left + 32, picPaletteMenu.Top + 16 );
      mouseEvent2( picPaletteMenu, X, Y, BUTTON_SMALL, 0, BUTTON_UP );
    end;

  procedure TfrmPalette.picPaletteMenu_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picPaletteMenu, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE );
    end;

  procedure TfrmPalette.picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN );
    end;

  procedure TfrmPalette.picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE );
    end;

  procedure TfrmPalette.picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_UP );
    end;

  procedure TfrmPalette.SetColours;
    var
      i : smallint; 
      c : Control; 
    begin
      //ON ERROR
      picTitle.Picture := LoadPicture( appPath + '\' + gfxDir + '\titlebar_palette.bmp' );
      mouseEvent2( picHide, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      mouseEvent2( picPaletteMenu, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      for i := 0 to 2 do
        begin
          mouseEvent2( picClrMode( i ), 0, 0, BUTTON_SMALL, ( clrMode = i ), BUTTON_UP );
        end;
      self.BackColor := bgClr;
      for i := 0 to 6 do
        begin
          lblPal( i ).BackColor := lblBackClr;
          lblPal( i ).ForeColor := lblTextClr;
        end;
      for i := 0 to 2 do
        begin
          lblClrMode( i ).BackColor := lblBackClr;
          lblClrMode( i ).ForeColor := lblTextClr;
          txtRGB( i ).BackColor := txtBackClr;
          txtRGB( i ).ForeColor := txtTextClr;
        end;
      txtOpacity.BackColor := txtBackClr;
      txtOpacity.ForeColor := txtTextClr;
      txtRadius.BackColor := txtBackClr;
      txtRadius.ForeColor := txtTextClr;
      cboBlendMode.BackColor := txtBackClr;
      cboBlendMode.ForeColor := txtTextClr;
      //FOREACH
    end;

end.

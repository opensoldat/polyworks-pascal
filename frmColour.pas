unit frmColour;

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
    R : byte = 0; 
    G : byte = 1; 
    B : byte = 2; 

  type
    TfrmColour =
      class( TForm )
        frmColour : TForm;
        imgBright : TImage;
        imgHue : TImage;
        imgRGB_0 : TImage;
        imgRGB_1 : TImage;
        imgRGB_2 : TImage;
        imgSat : TImage;
        lblClr_2 : TLabel;
        lblClr_1 : TLabel;
        lblClr_0 : TLabel;
        lblClr_5 : TLabel;
        lblClr_4 : TLabel;
        lblClr_3 : TLabel;
        lblClr_6 : TLabel;
        lblClr_7 : TLabel;
        lblClr_8 : TLabel;
        picBright : TPaintBox;
        picCancel : TPaintBox;
        picClr : TPaintBox;
        picColour : TPaintBox;
        picHide : TPaintBox;
        picHue : TPaintBox;
        picOK : TPaintBox;
        picRGB_0 : TPaintBox;
        picRGB_1 : TPaintBox;
        picRGB_2 : TPaintBox;
        picSat : TPaintBox;
        picTitle : TPaintBox;
        txtBright : TEdit;
        txtHexCode : TEdit;
        txtHue : TEdit;
        txtRGB_2 : TEdit;
        txtRGB_1 : TEdit;
        txtRGB_0 : TEdit;
        txtSat : TEdit;
        private
          fred : byte;
          fgreen : byte;
          fblue : byte;
          hue : single; 
          sat : single; 
          bright : single; 
          low : byte; 
          mid : byte; 
          high : byte; 
          clr : array[0..2] of byte; 
          pureClr : array[0..2] of byte; 
          oldX : smallint; 
          oldY : smallint; 
          fok : boolean;
          tempHexVal : widestring; 
          hexValue : widestring; 
          nonModal : boolean; 
          lastTool : byte; 
          procedure HideColour( var apply : boolean );
          procedure Form_KeyPress( var KeyAscii : smallint );
          procedure Form_Load;
          procedure lblRGB_Click( var Index : smallint );
          procedure picClr_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picClr_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picRGB_MouseDown( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picRGB_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHue_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHue_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure calculateHue;
          procedure picSat_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picSat_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picBright_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picBright_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure changeRGB;
          procedure changeHue;
          procedure updateAll;
          procedure updateRGB;
          procedure updateHSB;
          procedure updateHex;
          procedure Render;
          procedure txtHexCode_Change;
          procedure txtHexCode_LostFocus;
          procedure txtRGB_Change( var Index : smallint );
          procedure txtRGB_GotFocus( var Index : smallint );
          procedure txtRGB_LostFocus( var Index : smallint );
          procedure txtHue_Change;
          procedure txtHue_GotFocus;
          procedure txtHue_LostFocus;
          procedure txtSat_Change;
          procedure txtSat_LostFocus;
          procedure txtSat_GotFocus;
          procedure txtBright_Change;
          procedure txtBright_LostFocus;
          procedure txtBright_GotFocus;
          procedure picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_Click;
          procedure picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picCancel_Click;
          procedure picCancel_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picCancel_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picCancel_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picOK_Click;
          procedure picOK_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picOK_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picOK_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
        public
          procedure InitClr( var initRed : byte; var initGreen : byte; var initBlue : byte );
          procedure ChangeColour( var pic : TPaintBox; var rVal : byte; var gVal : byte; var bVal : byte; cTool : byte );
          procedure SetColours;
          property red : byte read fred write fred; 
          property green : byte read fgreen write fgreen; 
          property blue : byte read fblue write fblue; 
          property ok : boolean read fok write fok; 
      end;

implementation

  {$R *.DFM}

  procedure TfrmColour.InitClr( var initRed : byte; var initGreen : byte; var initBlue : byte );
    label
      ErrorHandler;
    begin
      //ON ERROR
      clr[R] := initRed;
      clr[G] := initGreen;
      clr[B] := initBlue;
      red := clr[R];
      green := clr[G];
      blue := clr[B];
      changeRGB;
      picClr.Cls;
      oldX := ( hue / 360 * 256 );
      oldY := 255 - ( sat * 255 );
      picClr.Canvas.Arc({TODO});
      picColour.BackColor := RGB( clr[R], clr[B], clr[G] );
      updateAll;
      updateRGB;
      updateHSB;
      updateHex;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar('Error initializing colour picker' + vbNewLine + Error), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmColour.ChangeColour( var pic : TPaintBox; var rVal : byte; var gVal : byte; var bVal : byte; cTool : byte );
    begin
      nonModal := true;
      lastTool := frmSoldatMapEditor.setTempTool( 10 );
      frmSoldatMapEditor.setCurrentTool( 10 );
      frmSoldatMapEditor.picMenuBar.Enabled := false;
      frmTools.Enabled := false;
      frmPalette.Enabled := false;
      frmScenery.Enabled := false;
      frmInfo.Enabled := false;
      frmWaypoints.Enabled := false;
      frmDisplay.picTitle.Enabled := false;
      self.Show( Unassigned, frmSoldatMapEditor );
    end;

  procedure TfrmColour.HideColour( var apply : boolean );
    label
      ErrorHandler;
    begin
      //ON ERROR
      if nonModal
        then
          begin
            if apply
              then
                begin
                  frmPalette.setValues( red, green, blue );
                  frmPalette.checkPalette( red, green, blue );
                end;
            nonModal := false;
            frmSoldatMapEditor.picMenuBar.Enabled := true;
            frmTools.Enabled := true;
            frmPalette.Enabled := true;
            frmScenery.Enabled := true;
            frmInfo.Enabled := true;
            frmWaypoints.Enabled := true;
            frmDisplay.picTitle.Enabled := true;
            frmSoldatMapEditor.setCurrentTool( lastTool );
            lastTool := 0;
          end;
      self.Hide;
      frmSoldatMapEditor.RegainFocus;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar(Error), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmColour.Form_KeyPress( var KeyAscii : smallint );
    begin
      if ( KeyAscii = 27 )
        then
          begin
            picColour.SetFocus;
            picCancel_Click;
          end
        else
      if ( KeyAscii = 13 )
        then
          begin
            picColour.SetFocus;
            picOK_Click;
          end;
    end;

  procedure TfrmColour.Form_Load;
    label
      ErrorHandler;
    begin
      //ON ERROR
      self.SetColours;
      oldX := -16;
      oldY := -16;
      ok := false;
      hue := 0;
      sat := 0;
      bright := 0;
      low := B;
      mid := G;
      high := R;
      pureClr[0] := 255;
      pureClr[1] := 255;
      pureClr[2] := 255;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar(Error + vbNewLine + 'Error loading Colour Picker form'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmColour.lblRGB_Click( var Index : smallint );
    begin
    end;

  procedure TfrmColour.picClr_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      picClr_MouseMove( Button, Shift, X, Y );
    end;

  procedure TfrmColour.picClr_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    var
      xVal : smallint; 
    begin
      if ( Button = 1 )
        then
          begin
            if ( X > 255 )
              then
                begin
                  X := 255;
                end
              else
            if ( X < 0 )
              then
                begin
                  X := 0;
                end;
            if ( Y > 255 )
              then
                begin
                  Y := 255;
                end
              else
            if ( Y < 0 )
              then
                begin
                  Y := 0;
                end;
            sat := ( 255 - Y ) / 255;
            hue := X / 255 * 359;
            calculateHue;
            changeRGB;
            txtSat.Text := Floor( sat * 100 + 0.5 );
            txtHue.Text := Floor( hue + 0.5 );
            updateAll;
            updateRGB;
            updateHex;
            picClr.Canvas.Arc({TODO});
            oldX := X;
            oldY := Y;
            picClr.Canvas.Arc({TODO});
          end;
    end;

  procedure TfrmColour.picRGB_MouseDown( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      picRGB_MouseMove( Index, Button, Shift, X, Y );
    end;

  procedure TfrmColour.picRGB_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      if ( X > 255 )
        then
          begin
            X := 255;
          end
        else
      if ( X < 0 )
        then
          begin
            X := 0;
          end;
      if ( Y > 255 )
        then
          begin
            Y := 255;
          end
        else
      if ( Y < 0 )
        then
          begin
            Y := 0;
          end;
      X := 255 - Y;
      if ( Button = 1 )
        then
          begin
            clr[Index] := X;
            changeRGB;
            txtRGB( Index ).Text := clr[Index];
            updateAll;
            updateHSB;
            updateHex;
            picClr.Canvas.Arc({TODO});
            oldX := hue / 360 * 255;
            oldY := 255 - sat * 255;
            picClr.Canvas.Arc({TODO});
          end;
    end;

  procedure TfrmColour.picHue_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      picHue_MouseMove( Button, Shift, X, Y );
    end;

  procedure TfrmColour.picHue_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      if ( X > 255 )
        then
          begin
            X := 255;
          end
        else
      if ( X < 0 )
        then
          begin
            X := 0;
          end;
      if ( Y > 255 )
        then
          begin
            Y := 255;
          end
        else
      if ( Y < 0 )
        then
          begin
            Y := 0;
          end;
      X := 255 - Y;
      if ( Button = 1 )
        then
          begin
            hue := X / 255 * 359;
            calculateHue;
            changeHue;
            txtHue.Text := Floor( hue + 0.5 );
            updateAll;
            updateRGB;
            updateHex;
            picClr.Canvas.Arc({TODO});
            oldX := X;
            picClr.Canvas.Arc({TODO});
          end;
    end;

  procedure TfrmColour.calculateHue;
    label
      ErrorHandler;
    begin
      //ON ERROR
      if ( hue < 60 )
        then
          begin
            clr[R] := bright * 255;
            clr[G] := ( ( 255 - ( hue / 60 * 255 ) ) * ( 1 - sat ) + ( hue / 60 * 255 ) ) * bright;
            clr[B] := 255 * ( 1 - sat ) * bright;
          end
        else
      if ( hue < 120 )
        then
          begin
            clr[R] := ( ( 255 - ( ( 120 - hue ) / 60 * 255 ) ) * ( 1 - sat ) + ( ( 120 - hue ) / 60 * 255 ) ) * bright;
            clr[G] := bright * 255;
            clr[B] := 255 * ( 1 - sat ) * bright;
          end
        else
      if ( hue < 180 )
        then
          begin
            clr[R] := 255 * ( 1 - sat ) * bright;
            clr[G] := bright * 255;
            clr[B] := ( ( 255 - ( ( hue - 120 ) / 60 * 255 ) ) * ( 1 - sat ) + ( ( hue - 120 ) / 60 * 255 ) ) * bright;
          end
        else
      if ( hue < 240 )
        then
          begin
            clr[R] := 255 * ( 1 - sat ) * bright;
            clr[G] := ( ( 255 - ( ( 240 - hue ) / 60 * 255 ) ) * ( 1 - sat ) + ( ( 240 - hue ) / 60 * 255 ) ) * bright;
            clr[B] := bright * 255;
          end
        else
      if ( hue < 300 )
        then
          begin
            clr[R] := ( ( 255 - ( ( hue - 240 ) / 60 * 255 ) ) * ( 1 - sat ) + ( ( hue - 240 ) / 60 * 255 ) ) * bright;
            clr[G] := 255 * ( 1 - sat ) * bright;
            clr[B] := bright * 255;
          end
        else
      if ( hue < 360 )
        then
          begin
            clr[R] := bright * 255;
            clr[G] := 255 * ( 1 - sat ) * bright;
            clr[B] := ( ( 255 - ( ( 360 - hue ) / 60 * 255 ) ) * ( 1 - sat ) + ( ( 360 - hue ) / 60 * 255 ) ) * bright;
          end;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar(Error), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmColour.picSat_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      picSat_MouseMove( Button, Shift, X, Y );
    end;

  procedure TfrmColour.picSat_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      if ( X > 255 )
        then
          begin
            X := 255;
          end
        else
      if ( X < 0 )
        then
          begin
            X := 0;
          end;
      if ( Y > 255 )
        then
          begin
            Y := 255;
          end
        else
      if ( Y < 0 )
        then
          begin
            Y := 0;
          end;
      X := 255 - Y;
      if ( Button = 1 )
        then
          begin
            sat := X / 255;
            if ( clr[R] = clr[G] ) and ( clr[R] = clr[B] ) and ( sat > 0 ) //determine rgb based on hue
              then
                begin
                  calculateHue;
                end
              else
                begin
                  clr[low] := ( ( 1 - sat ) * 255 ) * bright;
                  clr[mid] := ( ( 255 - pureClr[mid] ) * ( 1 - sat ) + pureClr[mid] ) * bright;
                  clr[high] := pureClr[high] * bright;
                end;
            updateAll;
            txtSat.Text := Floor( sat * 100 + 0.5 );
            updateRGB;
            updateHex;
            picClr.Canvas.Arc({TODO});
            oldY := 255 - X;
            picClr.Canvas.Arc({TODO});
          end;
    end;

  procedure TfrmColour.picBright_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      picBright_MouseMove( Button, Shift, X, Y );
    end;

  procedure TfrmColour.picBright_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      if ( X > 255 )
        then
          begin
            X := 255;
          end
        else
      if ( X < 0 )
        then
          begin
            X := 0;
          end;
      if ( Y > 255 )
        then
          begin
            Y := 255;
          end
        else
      if ( Y < 0 )
        then
          begin
            Y := 0;
          end;
      X := 255 - Y;
      if ( Button = 1 )
        then
          begin
            bright := X / 255;
            clr[low] := ( ( 1 - sat ) * 255 ) * bright;
            clr[mid] := ( ( 255 - pureClr[mid] ) * ( 1 - sat ) + pureClr[mid] ) * bright;
            clr[high] := pureClr[high] * bright;
            updateAll;
            txtBright.Text := Floor( bright * 100 + 0.5 );
            updateRGB;
            updateHex;
          end;
    end;

  procedure TfrmColour.changeRGB; //when rgb modified by user
    begin
      if ( clr[R] = clr[G] ) and ( clr[R] = clr[B] )
        then
          begin
            bright := clr[R] / 255;
            sat := 0;
            if ( hue < 60 )
              then
                begin
                  pureClr[R] := 255;
                  pureClr[G] := ( hue / 60 ) * 255;
                  pureClr[B] := 0;
                end
              else
            if ( hue < 120 )
              then
                begin
                  pureClr[R] := ( ( 120 - hue ) / 60 ) * 255;
                  pureClr[G] := 255;
                  pureClr[B] := 0;
                end
              else
            if ( hue < 180 )
              then
                begin
                  pureClr[R] := 0;
                  pureClr[G] := 255;
                  pureClr[B] := ( ( hue - 120 ) / 60 ) * 255;
                end
              else
            if ( hue < 240 )
              then
                begin
                  pureClr[R] := 0;
                  pureClr[G] := ( ( 240 - hue ) / 60 ) * 255;
                  pureClr[B] := 255;
                end
              else
            if ( hue < 300 )
              then
                begin
                  pureClr[R] := ( ( hue - 240 ) / 60 ) * 255;
                  pureClr[G] := 0;
                  pureClr[B] := 255;
                end
              else
            if ( hue < 360 )
              then
                begin
                  pureClr[R] := 255;
                  pureClr[G] := 0;
                  pureClr[B] := ( ( 360 - hue ) / 60 ) * 255;
                end;
            exit;
          end;
      //get hue from rgb
      if ( clr[R] >= clr[G] ) and ( clr[R] >= clr[B] )
        then
          begin
            if ( clr[G] >= clr[B] )
              then
                begin
                  hue := ( clr[G] - clr[B] ) / ( clr[R] - clr[B] ) * 60;
                end
              else
                begin
                  hue := 360 - ( clr[B] - clr[G] ) / ( clr[R] - clr[G] ) * 60;
                end;
          end
        else
      if ( clr[G] >= clr[R] ) and ( clr[G] >= clr[B] )
        then
          begin
            if ( clr[R] >= clr[B] )
              then
                begin
                  hue := 120 - ( clr[R] - clr[B] ) / ( clr[G] - clr[B] ) * 60;
                end
              else
                begin
                  hue := ( clr[B] - clr[R] ) / ( clr[G] - clr[R] ) * 60 + 120;
                end;
          end
        else
      if ( clr[B] >= clr[R] ) and ( clr[B] >= clr[G] )
        then
          begin
            if ( clr[R] >= clr[G] )
              then
                begin
                  hue := ( clr[R] - clr[G] ) / ( clr[B] - clr[G] ) * 60 + 240;
                end
              else
                begin
                  hue := 240 - ( clr[G] - clr[R] ) / ( clr[B] - clr[R] ) * 60;
                end;
          end;
      changeHue;
      sat := 1 - ( clr[low] / clr[high] );
      bright := clr[high] / 255;
    end;

  procedure TfrmColour.changeHue;
    begin
      if ( hue < 60 )
        then
          begin
            high := R;
            mid := G;
            low := B;
            pureClr[R] := 255;
            pureClr[G] := ( hue / 60 ) * 255;
            pureClr[B] := 0;
          end
        else
      if ( hue < 120 )
        then
          begin
            high := G;
            mid := R;
            low := B;
            pureClr[R] := ( ( 120 - hue ) / 60 ) * 255;
            pureClr[G] := 255;
            pureClr[B] := 0;
          end
        else
      if ( hue < 180 )
        then
          begin
            high := G;
            mid := B;
            low := R;
            pureClr[R] := 0;
            pureClr[G] := 255;
            pureClr[B] := ( ( hue - 120 ) / 60 ) * 255;
          end
        else
      if ( hue < 240 )
        then
          begin
            high := B;
            mid := G;
            low := R;
            pureClr[R] := 0;
            pureClr[G] := ( ( 240 - hue ) / 60 ) * 255;
            pureClr[B] := 255;
          end
        else
      if ( hue < 300 )
        then
          begin
            high := B;
            mid := R;
            low := G;
            pureClr[R] := ( ( hue - 240 ) / 60 ) * 255;
            pureClr[G] := 0;
            pureClr[B] := 255;
          end
        else
      if ( hue < 360 )
        then
          begin
            high := R;
            mid := B;
            low := G;
            pureClr[R] := 255;
            pureClr[G] := 0;
            pureClr[B] := ( ( 360 - hue ) / 60 ) * 255;
          end;
    end;

  procedure TfrmColour.updateAll;
    begin
      picColour.BackColor := RGB( clr[R], clr[G], clr[B] );
      imgRGB( 0 ).Top := picRGB( 0 ).Top + 255 - clr[0] - 7;
      imgRGB( 1 ).Top := picRGB( 1 ).Top + 255 - clr[1] - 7;
      imgRGB( 2 ).Top := picRGB( 2 ).Top + 255 - clr[2] - 7;
      imgHue.Top := picHue.Top + 255 - Floor( hue * 256 / 360 ) - 7;
      imgSat.Top := picSat.Top + 255 - Floor( sat * 255 ) - 7;
      imgBright.Top := picBright.Top + 255 - Floor( bright * 255 ) - 7;
      Render;
    end;

  procedure TfrmColour.updateRGB;
    begin
      txtRGB( R ).Text := clr[R];
      txtRGB( G ).Text := clr[G];
      txtRGB( B ).Text := clr[B];
    end;

  procedure TfrmColour.updateHSB;
    begin
      txtHue.Text := Floor( hue + 0.5 );
      txtSat.Text := Floor( sat * 100 + 0.5 );
      txtBright.Text := Floor( bright * 100 + 0.5 );
    end;

  procedure TfrmColour.updateHex;
    begin
      hexValue := RGBtoHex( RGB( clr[B], clr[G], clr[R] ) );
      txtHexCode.Text := RGBtoHex( RGB( clr[B], clr[G], clr[R] ) );
    end;

  procedure TfrmColour.Render;
    var
      i : smallint; 
      redVal : byte; 
      greenVal : byte; 
      blueVal : byte; 
    begin
      for i := 0 to 255 do
        begin
          picRGB( R ).Canvas.Rectangle({TODO});
          picRGB( G ).Canvas.Rectangle({TODO});
          picRGB( B ).Canvas.Rectangle({TODO});
          redVal := ( ( 255 - pureClr[R] ) * ( 1 - i / 255 ) + pureClr[R] ) * bright;
          greenVal := ( ( 255 - pureClr[G] ) * ( 1 - i / 255 ) + pureClr[G] ) * bright;
          blueVal := ( ( 255 - pureClr[B] ) * ( 1 - i / 255 ) + pureClr[B] ) * bright;
          picSat.Canvas.Rectangle({TODO});
          redVal := ( ( 255 - pureClr[R] ) * ( 1 - sat ) + pureClr[R] ) * ( i / 255 );
          greenVal := ( ( 255 - pureClr[G] ) * ( 1 - sat ) + pureClr[G] ) * ( i / 255 );
          blueVal := ( ( 255 - pureClr[B] ) * ( 1 - sat ) + pureClr[B] ) * ( i / 255 );
          picBright.Canvas.Rectangle({TODO});
          if ( i <= ( 255 / 6 ) )
            then
              begin
                redVal := bright * 255;
                greenVal := ( ( 255 - ( i * 6 ) ) * ( 1 - sat ) + ( i * 6 ) ) * bright;
                blueVal := 255 * ( 1 - sat ) * bright;
              end
            else
          if ( i <= ( 255 / 3 ) )
            then
              begin
                redVal := ( ( 255 - ( ( 255 / 3 - i ) * 6 ) ) * ( 1 - sat ) + ( ( 255 / 3 - i ) * 6 ) ) * bright;
                greenVal := bright * 255;
                blueVal := 255 * ( 1 - sat ) * bright;
              end
            else
          if ( i <= ( 255 / 2 ) )
            then
              begin
                redVal := 255 * ( 1 - sat ) * bright;
                greenVal := bright * 255;
                blueVal := ( ( 255 - ( ( i - 255 / 3 ) * 6 ) ) * ( 1 - sat ) + ( ( i - 255 / 3 ) * 6 ) ) * bright;
              end
            else
          if ( i <= ( 255 / 3 * 2 ) )
            then
              begin
                redVal := 255 * ( 1 - sat ) * bright;
                greenVal := ( ( 255 - ( ( 255 / 3 * 2 - i ) * 6 ) ) * ( 1 - sat ) + ( ( 255 / 3 * 2 - i ) * 6 ) ) * bright;
                blueVal := bright * 255;
              end
            else
          if ( i <= ( 255 / 6 * 5 ) )
            then
              begin
                redVal := ( ( 255 - ( ( i - 255 / 3 * 2 ) * 6 ) ) * ( 1 - sat ) + ( ( i - 255 / 3 * 2 ) * 6 ) ) * bright;
                greenVal := 255 * ( 1 - sat ) * bright;
                blueVal := bright * 255;
              end
            else
          if ( i <= 255 )
            then
              begin
                redVal := bright * 255;
                greenVal := 255 * ( 1 - sat ) * bright;
                blueVal := ( ( 255 - ( ( 255 - i ) * 6 ) ) * ( 1 - sat ) + ( ( 255 - i ) * 6 ) ) * bright;
              end;
          picHue.Canvas.Rectangle({TODO});
        end;
      picRGB( R ).Refresh;
      picRGB( G ).Refresh;
      picRGB( B ).Refresh;
      picHue.Refresh;
      picSat.Refresh;
      picBright.Refresh;
    end;

  procedure TfrmColour.txtHexCode_Change;
    var
      tempHexVal : widestring; 
    begin
      if ( HexToLong( txtHexCode.Text ) = -1 )
        then
        else
      if ( hexValue <> txtHexCode.Text )
        then
          begin
            if ( length( txtHexCode.Text ) < 6 )
              then
                begin
                  tempHexVal := StringOfChar( '0', 6 - length( txtHexCode.Text ) ) + txtHexCode.Text;
                end
              else
            if ( length( txtHexCode.Text ) > 6 )
              then
                begin
                  tempHexVal := RightStr(txtHexCode.Text, 6);
                end
              else
                begin
                  tempHexVal := txtHexCode.Text;
                end;
            clr[B] := StrToInt( '&H' + RightStr(tempHexVal, 2) );
            tempHexVal := LeftStr(tempHexVal, length( tempHexVal ) - 2);
            clr[G] := StrToInt( '&H' + RightStr(tempHexVal, 2) );
            tempHexVal := LeftStr(tempHexVal, length( tempHexVal ) - 2);
            clr[R] := StrToInt( '&H' + RightStr(tempHexVal, 2) );
            changeRGB;
            updateAll;
            updateRGB;
            updateHSB;
          end;
    end;

  procedure TfrmColour.txtHexCode_LostFocus;
    begin
      if ( HexToLong( txtHexCode.Text ) = -1 )
        then
          begin
            txtHexCode.Text := hexValue;
            clr[B] := StrToInt( '&H' + RightStr(hexValue, 2) );
            hexValue := LeftStr(hexValue, length( hexValue ) - 2);
            clr[G] := StrToInt( '&H' + RightStr(hexValue, 2) );
            hexValue := LeftStr(hexValue, length( hexValue ) - 2);
            clr[R] := StrToInt( '&H' + RightStr(hexValue, 2) );
            changeRGB;
            updateAll;
            updateRGB;
            updateHSB;
          end
        else
          begin
            if ( length( txtHexCode.Text ) > 6 )
              then
                begin
                  txtHexCode.Text := RightStr(txtHexCode.Text, 6);
                end
              else
            if ( length( txtHexCode.Text ) < 6 )
              then
                begin
                  txtHexCode := StringOfChar( '0', 6 - length( txtHexCode.Text ) ) + txtHexCode.Text;
                end;
            hexValue := txtHexCode.Text;
          end;
    end;

  procedure TfrmColour.txtRGB_Change( var Index : smallint );
    begin
      if ( IsNumeric( txtRGB( Index ).Text ) = false ) and ( txtRGB( Index ).Text <> '' )
        then
          begin
            txtRGB( Index ).Text := clr[Index];
          end
        else
      if ( txtRGB( Index ).Text = '' )
        then
        else
      if ( txtRGB( Index ).Text >= 0 ) and ( txtRGB( Index ).Text <= 255 )
        then
          begin
            if ( clr[Index] <> txtRGB( Index ).Text )
              then
                begin
                  clr[Index] := txtRGB( Index ).Text;
                  changeRGB;
                  updateAll;
                  updateHSB;
                  updateHex;
                end;
          end;
    end;

  procedure TfrmColour.txtRGB_GotFocus( var Index : smallint );
    begin
      SelectAllText( txtRGB( Index ) );
    end;

  procedure TfrmColour.txtRGB_LostFocus( var Index : smallint );
    begin
      txtRGB( Index ).Text := clr[Index];
    end;

  procedure TfrmColour.txtHue_Change;
    begin
      if ( IsNumeric( txtHue.Text ) = false ) and ( txtHue.Text <> '' )
        then
          begin
            txtHue.Text := Floor( hue + 0.5 );
          end
        else
      if ( txtHue.Text = '' )
        then
        else
      if ( txtHue.Text >= 0 ) and ( txtHue.Text <= 359 )
        then
          begin
            if ( Floor( hue + 0.5 ) <> txtHue.Text )
              then
                begin
                  hue := txtHue.Text;
                  if not ( ( clr[R] = clr[G] ) and ( clr[R] = clr[B] ) )
                    then
                      begin
                        calculateHue;
                      end;
                  changeHue;
                  updateAll;
                  updateRGB;
                  updateHex;
                  picClr.Canvas.Arc({TODO});
                  oldX := hue / 360 * 256;
                  picClr.Canvas.Arc({TODO});
                end;
          end;
    end;

  procedure TfrmColour.txtHue_GotFocus;
    begin
      SelectAllText( txtHue );
    end;

  procedure TfrmColour.txtHue_LostFocus;
    begin
      txtHue.Text := Floor( hue + 0.5 );
    end;

  procedure TfrmColour.txtSat_Change;
    begin
      if ( IsNumeric( txtSat.Text ) = false ) and ( txtSat.Text <> '' )
        then
          begin
            txtSat.Text := Floor( sat * 100 + 0.5 );
          end
        else
      if ( txtSat.Text = '' )
        then
        else
      if ( txtSat.Text >= 0 ) and ( txtSat.Text <= 100 )
        then
          begin
            if ( Floor( sat * 100 + 0.5 ) <> txtSat.Text )
              then
                begin
                  sat := txtSat.Text / 100;
                  clr[low] := ( ( 1 - sat ) * 255 ) * bright;
                  clr[mid] := ( ( 255 - pureClr[mid] ) * ( 1 - sat ) + pureClr[mid] ) * bright;
                  clr[high] := pureClr[high] * bright;
                  updateAll;
                  updateRGB;
                  updateHex;
                  picClr.Canvas.Arc({TODO});
                  oldY := 255 - sat * 255;
                  picClr.Canvas.Arc({TODO});
                end;
          end;
    end;

  procedure TfrmColour.txtSat_LostFocus;
    begin
      txtSat.Text := Floor( sat * 100 + 0.5 );
    end;

  procedure TfrmColour.txtSat_GotFocus;
    begin
      SelectAllText( txtSat );
    end;

  procedure TfrmColour.txtBright_Change;
    begin
      if ( IsNumeric( txtBright.Text ) = false ) and ( txtBright.Text <> '' )
        then
          begin
            txtBright.Text := Floor( bright * 100 + 0.5 );
          end
        else
      if ( txtBright.Text = '' )
        then
        else
      if ( txtBright.Text >= 0 ) and ( txtBright.Text <= 100 )
        then
          begin
            if ( Floor( bright * 100 + 0.5 ) <> txtBright.Text )
              then
                begin
                  bright := txtBright.Text / 100;
                  clr[low] := ( ( 1 - sat ) * 255 ) * bright;
                  clr[mid] := ( ( 255 - pureClr[mid] ) * ( 1 - sat ) + pureClr[mid] ) * bright;
                  clr[high] := pureClr[high] * bright;
                  updateAll;
                  updateRGB;
                  updateHex;
                end;
          end;
    end;

  procedure TfrmColour.txtBright_LostFocus;
    begin
      txtBright.Text := Floor( bright * 100 + 0.5 );
    end;

  procedure TfrmColour.txtBright_GotFocus;
    begin
      SelectAllText( txtBright );
    end;

  //
  //
  //
  //
  //--------
  procedure TfrmColour.picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      ReleaseCapture;
      SendMessage( self.hWnd, WM_NCLBUTTONDOWN, 2, 0 );
    end;

  procedure TfrmColour.picHide_Click;
    begin
      HideColour( false );
    end;

  procedure TfrmColour.picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN );
    end;

  procedure TfrmColour.picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE );
    end;

  procedure TfrmColour.picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_UP );
    end;

  procedure TfrmColour.picCancel_Click;
    begin
      ok := false;
      HideColour( false );
    end;

  procedure TfrmColour.picCancel_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picCancel, X, Y, BUTTON_LARGE, 0, BUTTON_DOWN );
    end;

  procedure TfrmColour.picCancel_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picCancel, X, Y, BUTTON_LARGE, 0, BUTTON_MOVE );
    end;

  procedure TfrmColour.picCancel_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picCancel, 0, 0, BUTTON_LARGE, 0, BUTTON_UP );
    end;

  procedure TfrmColour.picOK_Click;
    begin
      ok := true;
      red := clr[R];
      green := clr[G];
      blue := clr[B];
      HideColour( true );
    end;

  procedure TfrmColour.picOK_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picOK, X, Y, BUTTON_LARGE, 0, BUTTON_DOWN );
    end;

  procedure TfrmColour.picOK_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picOK, X, Y, BUTTON_LARGE, 0, BUTTON_MOVE );
    end;

  procedure TfrmColour.picOK_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picOK, 0, 0, BUTTON_LARGE, 0, BUTTON_UP );
    end;

  procedure TfrmColour.SetColours;
    var
      i : smallint; 
      c : Control; 
    begin
      //ON ERROR
      //--------
      picTitle.Picture := LoadPicture( appPath + '\' + gfxDir + '\titlebar_colourpicker.bmp' );
      picClr.Picture := LoadPicture( appPath + '\' + gfxDir + '\colour_picker.bmp' );
      mouseEvent2( picHide, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      mouseEvent2( picOK, 0, 0, BUTTON_LARGE, 0, BUTTON_UP );
      mouseEvent2( picCancel, 0, 0, BUTTON_LARGE, 0, BUTTON_UP );
      imgRGB( 0 ).Picture := LoadPicture( appPath + '\' + gfxDir + '\slider_arrow.bmp' );
      imgRGB( 1 ).Picture := LoadPicture( appPath + '\' + gfxDir + '\slider_arrow.bmp' );
      imgRGB( 2 ).Picture := LoadPicture( appPath + '\' + gfxDir + '\slider_arrow.bmp' );
      imgHue.Picture := LoadPicture( appPath + '\' + gfxDir + '\slider_arrow.bmp' );
      imgBright.Picture := LoadPicture( appPath + '\' + gfxDir + '\slider_arrow.bmp' );
      imgSat.Picture := LoadPicture( appPath + '\' + gfxDir + '\slider_arrow.bmp' );
      picClr.MouseIcon := LoadPicture( appPath + '\' + gfxDir + '\cursors\colour_picker.cur' );
      //--------
      self.BackColor := bgClr;
      for i := 0 to 8 do
        begin
          lblClr( i ).BackColor := lblBackClr;
          lblClr( i ).ForeColor := lblTextClr;
        end;
      for i := 0 to 2 do
        begin
          txtRGB( i ).BackColor := txtBackClr;
          txtRGB( i ).ForeColor := txtTextClr;
        end;
      txtHue.BackColor := txtBackClr;
      txtHue.ForeColor := txtTextClr;
      txtSat.BackColor := txtBackClr;
      txtSat.ForeColor := txtTextClr;
      txtBright.BackColor := txtBackClr;
      txtBright.ForeColor := txtTextClr;
      txtHexCode.BackColor := bgClr;
      txtHexCode.ForeColor := lblTextClr;
      //FOREACH
    end;

end.

unit frmTexture;

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
    TfrmTexture =
      class( TForm )
        frmTexture : TForm;
        picHide : TPaintBox;
        picTexture : TPaintBox;
        picTitle : TPaintBox;
        private
          fxPos : smallint;
          fyPos : smallint;
          formHeight : smallint; 
          fcollapsed : boolean;
          fx1tex : single;
          fx2tex : single;
          fy1tex : single;
          fy2tex : single;
          procedure Form_Load;
          procedure picTexture_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picTexture_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picTexture_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picTitle_DblClick;
          procedure picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_Click;
          procedure picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
        public
          procedure setForm;
          procedure setTexCoords( var tehValue : single; var Index : smallint );
          procedure setTexture( var texturePath : widestring );
          procedure SetColours;
          property xPos : smallint read fxPos write fxPos; 
          property yPos : smallint read fyPos write fyPos; 
          property collapsed : boolean read fcollapsed write fcollapsed; 
          property x1tex : single read fx1tex write fx1tex; 
          property x2tex : single read fx2tex write fx2tex; 
          property y1tex : single read fy1tex write fy1tex; 
          property y2tex : single read fy2tex write fy2tex; 
      end;

implementation

  {$R *.DFM}

  procedure TfrmTexture.Form_Load;
    label
      ErrorHandler;
    begin
      //ON ERROR
      self.SetColours;
      formHeight := self.ScaleHeight;
      setForm;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar(Error + vbNewLine + 'Error loading texture form'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmTexture.setForm;
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

  procedure TfrmTexture.setTexCoords( var tehValue : single; var Index : smallint );
    begin
      picTexture.Canvas.Rectangle({TODO});
      if ( Index = 0 )
        then
          begin
            x1tex := tehValue / 2;
          end
        else
      if ( Index = 1 )
        then
          begin
            x2tex := tehValue / 2;
          end
        else
      if ( Index = 2 )
        then
          begin
            y1tex := tehValue / 2;
          end
        else
      if ( Index = 3 )
        then
          begin
            y2tex := tehValue / 2;
          end;
      picTexture.Canvas.Rectangle({TODO});
    end;

  procedure TfrmTexture.picTexture_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      if ( Button <> 0 )
        then
          begin
            picTexture.DrawMode := 6;
            picTexture.Canvas.Rectangle({TODO});
            x1tex := Floor( ( X + 0 ) / 16 ) * 16;
            y1tex := Floor( ( Y + 0 ) / 16 ) * 16;
            x2tex := x1tex + 16;
            y2tex := y1tex + 16;
            picTexture.Canvas.Rectangle({TODO});
          end;
    end;

  procedure TfrmTexture.picTexture_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    var
      drawBox : boolean; 
    begin
      if ( Button <> 0 )
        then
          begin
            if ( X + 16 > frmSoldatMapEditor.xTexture / 2 )
              then
                begin
                  X := frmSoldatMapEditor.xTexture / 2 - 16;
                end
              else
            if ( X + 16 < 0 )
              then
                begin
                  X := -16;
                end;
            if ( Y + 16 > frmSoldatMapEditor.yTexture / 2 )
              then
                begin
                  Y := frmSoldatMapEditor.yTexture / 2 - 16;
                end
              else
            if ( Y + 16 < 0 )
              then
                begin
                  Y := -16;
                end;
            if ( Floor( ( X + 16 ) / 16 ) * 16 <> x2tex )
              then
                begin
                  drawBox := true;
                end;
            if ( Floor( ( Y + 16 ) / 16 ) * 16 <> y2tex )
              then
                begin
                  drawBox := true;
                end;
            if drawBox
              then
                begin
                  picTexture.Canvas.Rectangle({TODO});
                  x2tex := Floor( ( X + 16 ) / 16 ) * 16;
                  y2tex := Floor( ( Y + 16 ) / 16 ) * 16;
                  picTexture.Canvas.Rectangle({TODO});
                end;
          end;
    end;

  procedure TfrmTexture.picTexture_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      if ( Button <> 0 )
        then
          begin
            if ( X + 16 > frmSoldatMapEditor.xTexture / 2 )
              then
                begin
                  X := frmSoldatMapEditor.xTexture / 2 - 16;
                end
              else
            if ( X + 16 < 0 )
              then
                begin
                  X := -16;
                end;
            if ( Y + 16 > frmSoldatMapEditor.yTexture / 2 )
              then
                begin
                  Y := frmSoldatMapEditor.yTexture / 2 - 16;
                end
              else
            if ( Y + 16 < 0 )
              then
                begin
                  Y := -16;
                end;
            x2tex := Floor( ( X + 16 ) / 16 ) * 16;
            y2tex := Floor( ( Y + 16 ) / 16 ) * 16;
            frmInfo.txtQuadX( 0 ).Text := x1tex * 2;
            frmInfo.txtQuadY( 0 ).Text := y1tex * 2;
            frmInfo.txtQuadX( 1 ).Text := x2tex * 2;
            frmInfo.txtQuadY( 1 ).Text := y2tex * 2;
          end;
    end;

  procedure TfrmTexture.setTexture( var texturePath : widestring );
    var
      texWidth : smallint; 
      texHeight : smallint; 
      X : smallint; 
      Y : smallint; 
      Token : longint; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      texWidth := frmSoldatMapEditor.xTexture;
      texHeight := frmSoldatMapEditor.yTexture;
      picTexture.DrawMode := 13;
      picTexture.Width := texWidth / 2;
      picTexture.Height := texHeight / 2;
      frmTexture.Width := ( texWidth / 2 + 2 + 16 ) * Screen.TwipsPerPixelX;
      formHeight := texHeight / 2 + 18 + 16;
      frmTexture.Height := formHeight * Screen.TwipsPerPixelY;
      picHide.Left := frmTexture.Width / Screen.TwipsPerPixelX - 17;
      Token := InitGDIPlus;
      picTexture.Picture := LoadPictureGDIPlus( frmSoldatMapEditor.soldatDir + 'textures\' + texturePath, texWidth / 2, texHeight / 2 );
      FreeGDIPlus( Token );
      for Y := 0 to ( texHeight / 32 ) do
        begin
          if ( Y mod 4 = 0 )
            then
              begin
                picTexture.DrawWidth := 2;
              end
            else
              begin
                picTexture.DrawWidth := 1;
              end;
          picTexture.Canvas.Rectangle({TODO});
        end;
      for X := 0 to ( texWidth / 32 ) do
        begin
          if ( X mod 4 = 0 )
            then
              begin
                picTexture.DrawWidth := 2;
              end
            else
              begin
                picTexture.DrawWidth := 1;
              end;
          picTexture.Canvas.Rectangle({TODO});
        end;
      x1tex := 0;
      y1tex := 0;
      x2tex := texWidth / 2;
      y2tex := texHeight / 2;
      picTexture.DrawMode := 6;
      picTexture.Canvas.Rectangle({TODO});
      exit;
      ErrorHandler:
      Application.MessageBox( pchar('Error setting texture' + vbNewLine + Error), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmTexture.picTitle_DblClick;
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

  procedure TfrmTexture.picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      ReleaseCapture;
      SendMessage( self.hWnd, WM_NCLBUTTONDOWN, 2, 0 );
      snapForm( self, frmTools );
      snapForm( self, frmPalette );
      snapForm( self, frmWaypoints );
      snapForm( self, frmDisplay );
      snapForm( self, frmScenery );
      snapForm( self, frmInfo );
      snapForm( self, frmSoldatMapEditor );
      xPos := self.Left / Screen.TwipsPerPixelX;
      yPos := self.Top / Screen.TwipsPerPixelY;
    end;

  procedure TfrmTexture.picHide_Click;
    begin
      self.Hide;
      frmSoldatMapEditor.mnuTexture.Checked := false;
    end;

  procedure TfrmTexture.picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN );
    end;

  procedure TfrmTexture.picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE );
    end;

  procedure TfrmTexture.picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_UP );
    end;

  procedure TfrmTexture.SetColours;
    begin
      //ON ERROR
      picTitle.Picture := LoadPicture( appPath + '\' + gfxDir + '\titlebar_texture.bmp' );
      mouseEvent2( picHide, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      self.BackColor := bgClr;
    end;

end.

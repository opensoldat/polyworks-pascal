unit frmTaskBar;

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
    TfrmTaskBar =
      class( TForm )
        frmTaskBar : TForm;
        private
          minimized : boolean; 
          procedure Form_GotFocus;
          procedure Form_Load;
          procedure Form_Resize;
          procedure Form_Unload( var Cancel : smallint );
        public
      end;

implementation

  {$R *.DFM}

  procedure TfrmTaskBar.Form_GotFocus;
    begin
      if frmSoldatMapEditor.Visible
        then
          begin
            frmSoldatMapEditor.RegainFocus;
          end;
    end;

  procedure TfrmTaskBar.Form_Load;
    begin
      self.Left := 2000 * Screen.TwipsPerPixelX;
      self.Top := 2000 * Screen.TwipsPerPixelY;
    end;

  procedure TfrmTaskBar.Form_Resize;
    begin
      if not frmSoldatMapEditor.Visible and ( self.WindowState = vbNormal ) //show when it gets restored
        then
          begin
            frmSoldatMapEditor.Show;
            if frmSoldatMapEditor.mnuDisplay.Checked
              then
                begin
                  frmDisplay.Show;
                end;
            if frmSoldatMapEditor.mnuWaypoints.Checked
              then
                begin
                  frmWaypoints.Show;
                end;
            if frmSoldatMapEditor.mnuTools.Checked
              then
                begin
                  frmTools.Show;
                end;
            if frmSoldatMapEditor.mnuPalette.Checked
              then
                begin
                  frmPalette.Show;
                end;
            if frmSoldatMapEditor.mnuScenery.Checked
              then
                begin
                  frmScenery.Show;
                end;
            if frmSoldatMapEditor.mnuInfo.Checked
              then
                begin
                  frmInfo.Show;
                end;
            if frmSoldatMapEditor.mnuTexture.Checked
              then
                begin
                  frmTexture.Show;
                end;
            if ( frmSoldatMapEditor.WindowState = vbNormal )
              then
                begin
                  frmSoldatMapEditor.left := frmSoldatMapEditor.formLeft * Screen.TwipsPerPixelX;
                  frmSoldatMapEditor.Top := frmSoldatMapEditor.formTop * Screen.TwipsPerPixelY;
                  frmSoldatMapEditor.ScaleWidth := frmSoldatMapEditor.formWidth;
                  frmSoldatMapEditor.ScaleHeight := frmSoldatMapEditor.formHeight;
                end;
            frmSoldatMapEditor.RegainFocus;
          end
        else
      if not frmSoldatMapEditor.Visible and ( self.WindowState = vbMinimized )
        then
        else
      if frmSoldatMapEditor.Visible and ( self.WindowState = vbNormal )
        then
          begin
            frmSoldatMapEditor.RegainFocus;
          end
        else
      if frmSoldatMapEditor.Visible and ( self.WindowState = vbMinimized )
        then
          begin
            frmSoldatMapEditor.RegainFocus;
          end;
    end;

  procedure TfrmTaskBar.Form_Unload( var Cancel : smallint );
    begin
      frmSoldatMapEditor.Terminate;
    end;

end.

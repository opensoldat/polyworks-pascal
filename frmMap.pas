unit frmMap;

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
    TfrmMap =
      class( TForm )
        cboGrenades : TComboBox;
        cboJet : TComboBox;
        cboMedikits : TComboBox;
        cboSteps : TComboBox;
        cboTexture : TComboBox;
        cboWeather : TComboBox;
        fraMap_0 : TShape;
        fraMap_1 : TShape;
        frmMap : TForm;
        lblMap_1 : TLabel;
        lblMap_2 : TLabel;
        lblMap_3 : TLabel;
        lblMap_4 : TLabel;
        lblMap_5 : TLabel;
        lblMap_0 : TLabel;
        lblMap_7 : TLabel;
        lblMap_6 : TLabel;
        picBackClr_1 : TPaintBox;
        picBackClr_0 : TPaintBox;
        picCancel : TPaintBox;
        picHide : TPaintBox;
        picOK : TPaintBox;
        picTexture : TPaintBox;
        picTitle : TPaintBox;
        txtDesc : TEdit;
        txtJet : TEdit;
        private
          procedure cboJet_Click;
          procedure getJets;
          procedure cboTexture_Click;
          procedure picBackClr_Click( var Index : smallint );
          procedure picCancel_Click;
          procedure picOK_Click;
          procedure picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picCancel_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picCancel_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picOK_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picOK_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_Click;
          procedure picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure txtJet_KeyPress( var KeyAscii : smallint );
        public
          procedure Form_Load;
          procedure loadTextures;
          procedure loadTextures2;
          procedure loadFromList;
          procedure mnuRefresh_Click;
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

  procedure TfrmMap.cboJet_Click;
    begin
      case cboJet.ListIndex of
        0 : //none
          begin
            txtJet.Text := '0';
          end;
        1 : //minimal
          begin
            txtJet.Text := '12';
          end;
        2 : //very low
          begin
            txtJet.Text := '45';
          end;
        3 : //low
          begin
            txtJet.Text := '95';
          end;
        4 : //normal
          begin
            txtJet.Text := '190';
          end;
        5 : //high
          begin
            txtJet.Text := '320';
          end;
        6 : //maximum
          begin
            txtJet.Text := '800';
          end;
        7 : //infinite
          begin
            txtJet.Text := '32766';
          end;
        8 : //custom
          begin
          end;
      end;
      if ( cboJet.ListIndex <> 8 )
        then
          begin
            txtJet.Enabled := false;
          end
        else
          begin
            txtJet.Enabled := true;
          end;
    end;

  procedure TfrmMap.getJets;
    begin
      tmp{DECLARE} := txtJet.Text;
      if ( tmp = 0 ) //none
        then
          begin
            cboJet.ListIndex := 0;
          end
        else
      if ( tmp = 12 )
        then
          begin
            cboJet.ListIndex := 1;
          end
        else
      if ( tmp = 45 )
        then
          begin
            cboJet.ListIndex := 2;
          end
        else
      if ( tmp = 95 )
        then
          begin
            cboJet.ListIndex := 3;
          end
        else
      if ( tmp = 190 )
        then
          begin
            cboJet.ListIndex := 4;
          end
        else
      if ( tmp = 320 )
        then
          begin
            cboJet.ListIndex := 5;
          end
        else
      if ( tmp = 800 )
        then
          begin
            cboJet.ListIndex := 6;
          end
        else
      if ( tmp = 32766 )
        then
          begin
            cboJet.ListIndex := 7;
          end
        else
          begin
            cboJet.ListIndex := 8;
          end;
    end;

  procedure TfrmMap.Form_Load;
    label
      ErrorHandler;
    begin
      //ON ERROR
      self.SetColours;
      loadTextures2;
      frmSoldatMapEditor.getOptions;
      getJets;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar(Error + vbNewLine + 'Error loading Map form'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmMap.cboTexture_Click;
    var
      Token : longint; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      if ( cboTexture.List( cboTexture.ListIndex ) <> '' )
        then
          begin
            frmSoldatMapEditor.setMapTexture( cboTexture.List( cboTexture.ListIndex ) );
            frmTexture.setTexture( cboTexture.List( cboTexture.ListIndex ) );
            Token := InitGDIPlus;
            picTexture.Picture := LoadPictureGDIPlus( frmSoldatMapEditor.soldatDir + 'textures\' + cboTexture.List( cboTexture.ListIndex ), 128, 128 );
            FreeGDIPlus( Token );
          end;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar('Error showing texture' + vbNewLine + Error), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmMap.loadTextures;
    var
      strParent : widestring; 
      strPath : widestring; 
      objFSO : FileSystemObject; 
      objFiles : Files; 
      objFile : file; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      cboTexture.Clear;
      strParent := frmSoldatMapEditor.soldatDir;
      strPath := frmSoldatMapEditor.soldatDir + 'textures\';
      objFSO := {UNIMPLEMENTED};
      if not objFSO.FolderExists( strPath )
        then
          begin
            exit;
          end;
      objFiles := objFSO.GetFolder( strPath ).Files;
      //FOREACH
      exit;
      ErrorHandler:
      Application.MessageBox( pchar('loading textures failed' + vbNewLine + Error), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmMap.loadTextures2;
    var
      file : olevariant; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      cboTexture.Clear;
      file := Dir( frmSoldatMapEditor.soldatDir + 'textures\' + '*.bmp', vbDirectory );
      while length( file ) do
        begin
          cboTexture.AddItem( file );
          file := Dir;
        end;
      file := Dir( frmSoldatMapEditor.soldatDir + 'textures\' + '*.png', vbDirectory );
      while length( file ) do
        begin
          cboTexture.AddItem( file );
          file := Dir;
        end;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar('loading textures failed' + vbNewLine + Error), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmMap.loadFromList;
    var
      textureName : widestring; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      cboTexture.Clear;
      Assign( file1, appPath + '\texture_list.txt' ); 
      Reset( file1 );
      while not EOF( 1 ) do
        begin
          Read( file1, textureName );
          cboTexture.AddItem( textureName );
        end;
      CloseFile( file1 );
      exit;
      ErrorHandler:
      Application.MessageBox( pchar(Error), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmMap.mnuRefresh_Click;
    var
      i : smallint; 
    begin
      loadTextures2;
      for i := 0 to cboTexture.ListCount - 1 do
        begin
          if ( cboTexture.List( i ) = frmSoldatMapEditor.textureFile ) and ( cboTexture.List( i ) <> '' )
            then
              begin
                cboTexture.ListIndex := i;
              end;
        end;
    end;

  procedure TfrmMap.picBackClr_Click( var Index : smallint );
    begin
      picBackClr( Index ).BackColor := frmSoldatMapEditor.setBGColour( Index + 1 );
    end;

  procedure TfrmMap.picCancel_Click;
    begin
      Unload( self );
    end;

  procedure TfrmMap.picOK_Click;
    begin
      frmSoldatMapEditor.setOptions;
      Unload( self );
      frmSoldatMapEditor.RegainFocus;
    end;

  procedure TfrmMap.picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      ReleaseCapture;
      SendMessage( self.hWnd, WM_NCLBUTTONDOWN, 2, 0 );
    end;

  procedure TfrmMap.picCancel_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picCancel, X, Y, BUTTON_LARGE, 0, BUTTON_DOWN );
    end;

  procedure TfrmMap.picCancel_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picCancel, X, Y, BUTTON_LARGE, 0, BUTTON_MOVE );
    end;

  procedure TfrmMap.picOK_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picOK, X, Y, BUTTON_LARGE, 0, BUTTON_DOWN );
    end;

  procedure TfrmMap.picOK_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picOK, X, Y, BUTTON_LARGE, 0, BUTTON_MOVE );
    end;

  procedure TfrmMap.picHide_Click;
    begin
      frmSoldatMapEditor.setOptions;
      frmSoldatMapEditor.mnuMap.Checked := false;
      Unload( self );
    end;

  procedure TfrmMap.picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN );
    end;

  procedure TfrmMap.picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE );
    end;

  procedure TfrmMap.picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_UP );
    end;

  procedure TfrmMap.txtJet_KeyPress( var KeyAscii : smallint );
    begin
      if ( ( KeyAscii >= 48 ) and ( KeyAscii <= 57 ) ) or ( KeyAscii = 8 )
        then
        else
          begin
            KeyAscii := 0;
          end;
    end;

  procedure TfrmMap.SetColours;
    var
      i : smallint; 
      c : Control; 
    begin
      //ON ERROR
      picTitle.Picture := LoadPicture( appPath + '\' + gfxDir + '\titlebar_map.bmp' );
      mouseEvent2( picHide, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      mouseEvent2( picOK, 0, 0, BUTTON_LARGE, 0, BUTTON_UP );
      mouseEvent2( picCancel, 0, 0, BUTTON_LARGE, 0, BUTTON_UP );
      self.BackColor := bgClr;
      for i := 0 to 7 do
        begin
          lblMap( i ).BackColor := lblBackClr;
          lblMap( i ).ForeColor := lblTextClr;
        end;
      txtDesc.BackColor := txtBackClr;
      txtDesc.ForeColor := txtTextClr;
      txtJet.BackColor := txtBackClr;
      txtJet.ForeColor := txtTextClr;
      cboWeather.BackColor := txtBackClr;
      cboWeather.ForeColor := txtTextClr;
      cboSteps.BackColor := txtBackClr;
      cboSteps.ForeColor := txtTextClr;
      cboJet.BackColor := txtBackClr;
      cboJet.ForeColor := txtTextClr;
      cboGrenades.BackColor := txtBackClr;
      cboGrenades.ForeColor := txtTextClr;
      cboMedikits.BackColor := txtBackClr;
      cboMedikits.ForeColor := txtTextClr;
      cboTexture.BackColor := txtBackClr;
      cboTexture.ForeColor := txtTextClr;
      fraMap( 0 ).BorderColor := frameClr;
      fraMap( 1 ).BorderColor := frameClr;
      //FOREACH
    end;

end.

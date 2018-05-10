unit frmScenery;

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
    TfrmScenery =
      class( TForm )
        frmScenery : TForm;
        imgScenery : TImage;
        lblLevel_0 : TLabel;
        lblLevel_1 : TLabel;
        lblLevel_2 : TLabel;
        lblLvl : TLabel;
        lblRotate : TLabel;
        lblScale : TLabel;
        lstScenery : TListBox;
        mnuClearUnused : TMenuItem;
        mnuRefresh : TMenuItem;
        mnuReload : TMenuItem;
        mnuScenery : TMenuItem;
        picHide : TPaintBox;
        picLevel_0 : TPaintBox;
        picLevel_1 : TPaintBox;
        picLevel_2 : TPaintBox;
        picRotate : TPaintBox;
        picScale : TPaintBox;
        picScenery : TPaintBox;
        picSceneryMenu : TPaintBox;
        picTitle : TPaintBox;
        private
          formHeight : smallint; 
          fcollapsed : boolean;
          fxPos : smallint;
          fyPos : smallint;
          flevel : byte;
          frotateScenery : boolean;
          fscaleScenery : boolean;
          fnotClicked : boolean;
          checkVal : boolean; 
          selNode : Node; 
          procedure Form_Load;
          function FileExists( var fileName : widestring ) : boolean;
          procedure lblLevel_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure lblRotate_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure lblScale_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure mnuClearUnused_Click;
          procedure mnuReload_Click;
          procedure mnuRefresh_Click;
          procedure picSceneryMenu_Click;
          procedure picSceneryMenu_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picSceneryMenu_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picSceneryMenu_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picTitle_DblClick;
          procedure picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_Click;
          procedure picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picRotate_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picRotate_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picRotate_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picScale_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picScale_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picScale_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picLevel_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure picLevel_MouseUp( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
        public
          procedure setForm;
          procedure listScenery;
          procedure lstScenery_Click;
          procedure picLevel_MouseDown( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
          procedure SetColours;
          property collapsed : boolean read fcollapsed write fcollapsed; 
          property xPos : smallint read fxPos write fxPos; 
          property yPos : smallint read fyPos write fyPos; 
          property level : byte read flevel write flevel; 
          property rotateScenery : boolean read frotateScenery write frotateScenery; 
          property scaleScenery : boolean read fscaleScenery write fscaleScenery; 
          property notClicked : boolean read fnotClicked write fnotClicked; 
      end;

implementation

  {$R *.DFM}

  procedure TfrmScenery.Form_Load;
    var
      i : smallint; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      self.SetColours;
      formHeight := self.ScaleHeight;
      setForm;
      listScenery;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar(Error + vbNewLine + 'Error loading Scenery form'), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmScenery.setForm;
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

  procedure TfrmScenery.listScenery;
    var
      file : olevariant; 
      Index : smallint; 
      i : smallint; 
      sceneryName : widestring; 
      fileOpen : boolean; 
      tempNode : Node; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      frmSoldatMapEditor.tvwScenery.Nodes.Clear;
      frmSoldatMapEditor.tvwScenery.Nodes.Add( Unassigned, Unassigned, 'In Use', 'In Use' );
      //load all scenery
      frmSoldatMapEditor.tvwScenery.Nodes.Add( Unassigned, Unassigned, 'Master List', 'Master List' );
      file := Dir( frmSoldatMapEditor.soldatDir + 'Scenery-gfx\' + '*.bmp', vbDirectory );
      while length( file ) do
        begin
          frmSoldatMapEditor.tvwScenery.Nodes.Add( 'Master List', tvwChild, Unassigned, file );
          file := Dir;
        end;
      file := Dir( frmSoldatMapEditor.soldatDir + 'Scenery-gfx\' + '*.png', vbDirectory );
      while length( file ) do
        begin
          frmSoldatMapEditor.tvwScenery.Nodes.Add( 'Master List', tvwChild, Unassigned, file );
          file := Dir;
        end;
      file := Dir( frmSoldatMapEditor.soldatDir + 'Scenery-gfx\' + '*.tga', vbDirectory );
      while length( file ) do
        begin
          frmSoldatMapEditor.tvwScenery.Nodes.Add( 'Master List', tvwChild, Unassigned, file );
          file := Dir;
        end;
      file := Dir( frmSoldatMapEditor.soldatDir + 'Scenery-gfx\' + '*.gif', vbDirectory );
      while length( file ) do
        begin
          frmSoldatMapEditor.tvwScenery.Nodes.Add( 'Master List', tvwChild, Unassigned, file );
          file := Dir;
        end;
      frmSoldatMapEditor.tvwScenery.Nodes( 'Master List' ).Sorted := true;
      frmSoldatMapEditor.tvwScenery.Nodes( 'Master List' ).Sorted := false;
      frmSoldatMapEditor.tvwScenery.Nodes( 'Master List' ).Child.selected := true;
      frmSoldatMapEditor.tvwScenery_NodeClick( frmSoldatMapEditor.tvwScenery.SelectedItem );
      //load lists
      file := Dir( appPath + '\lists\' + '*.txt', vbDirectory );
      while length( file ) do //for every txt file in lists
        begin
          file := LeftStr(file, length( file ) - 4);
          frmSoldatMapEditor.tvwScenery.Nodes.Add( Unassigned, Unassigned, file, file );
          fileOpen := true;
          Assign( file1, appPath + '\lists\' + file + '.txt' ); 
          Reset( file1 );
          while not ( EOF( 1 ) ) do
            begin
              Read( file1, sceneryName );
              frmSoldatMapEditor.tvwScenery.Nodes.Add( file, tvwChild, Unassigned, sceneryName );
            end;
          CloseFile( file1 );
          fileOpen := false;
          file := Dir;
        end;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar('loading scenery tree failed' + vbNewLine + Error + vbNewLine + sceneryName), pchar(''), MB_OK ) {HelpFile:None, Context:None};
      if fileOpen
        then
          begin
            CloseFile( file1 );
          end;
    end;

  function TfrmScenery.FileExists( var fileName : widestring ) : boolean;
    label
      ErrorHandler;
    begin
      //ON ERROR
      result := ( FileLen( fileName ) > 0 );
      ErrorHandler:
    end;

  procedure TfrmScenery.lblLevel_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      picLevel_MouseMove( Index, 1, 0, 0, 0 );
    end;

  procedure TfrmScenery.lblRotate_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      picRotate_MouseMove( 1, 0, 0, 0 );
    end;

  procedure TfrmScenery.lblScale_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      picScale_MouseMove( 1, 0, 0, 0 );
    end;

  procedure TfrmScenery.lstScenery_Click;
    var
      Token : longint; 
    label
      ErrorHandler;
    begin
      //ON ERROR
      if ( lstScenery.List( lstScenery.ListIndex ) = '' )
        then
          begin
            lstScenery.ListIndex := -1;
            exit;
          end;
      if ( length( Dir( frmSoldatMapEditor.soldatDir + 'Scenery-gfx\' + lstScenery.List( lstScenery.ListIndex ) ) ) <> 0 )
        then
          begin
            Token := InitGDIPlus;
            picScenery.Picture := LoadPictureGDIPlus( frmSoldatMapEditor.soldatDir + 'Scenery-gfx\' + lstScenery.List( lstScenery.ListIndex ), Unassigned, Unassigned, RGB( 0, 255, 0 ) );
            FreeGDIPlus( Token );
            frmSoldatMapEditor.setCurrentScenery( lstScenery.ListIndex + 1, lstScenery.List( lstScenery.ListIndex ) );
          end
        else
          begin
            frmSoldatMapEditor.setCurrentScenery( lstScenery.ListIndex + 1, 'notfound.bmp' );
            picScenery.Picture := LoadPicture( appPath + '\' + gfxDir + '\notfound.bmp' );
            frmSoldatMapEditor.tvwScenery.SelectedItem := nil;
          end;
      lstScenery.ToolTipText := lstScenery.List( lstScenery.ListIndex );
      frmSoldatMapEditor.tvwScenery.Nodes( lstScenery.List( lstScenery.ListIndex ) ).selected := true;
      exit;
      ErrorHandler:
      Application.MessageBox( pchar('Error clicking scenery' + vbNewLine + Error), pchar(''), MB_OK ) {HelpFile:None, Context:None};
    end;

  procedure TfrmScenery.mnuClearUnused_Click;
    begin
      frmSoldatMapEditor.ClearUnused;
    end;

  procedure TfrmScenery.mnuReload_Click;
    var
      i : smallint; 
    begin
      listScenery;
      for i := 0 to lstScenery.ListCount - 1 do
        begin
          frmSoldatMapEditor.tvwScenery.Nodes.Add( 'In Use', tvwChild, lstScenery.List( i ), lstScenery.List( i ) );
        end;
    end;

  procedure TfrmScenery.mnuRefresh_Click;
    var
      Index : smallint; 
    begin
      for Index := 1 to lstScenery.ListCount do
        begin
          frmSoldatMapEditor.RefreshSceneryTextures( Index );
        end;
      frmSoldatMapEditor.Render;
    end;

  procedure TfrmScenery.picSceneryMenu_Click;
    begin
      PopupMenu( mnuScenery, Unassigned, picHide.Left + picHide.ScaleWidth, picSceneryMenu.Top + picSceneryMenu.ScaleHeight );
    end;

  procedure TfrmScenery.picSceneryMenu_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picSceneryMenu, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN );
    end;

  procedure TfrmScenery.picSceneryMenu_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picSceneryMenu, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE );
    end;

  procedure TfrmScenery.picSceneryMenu_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picSceneryMenu, X, Y, BUTTON_SMALL, 0, BUTTON_UP );
    end;

  procedure TfrmScenery.picTitle_DblClick;
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

  procedure TfrmScenery.picTitle_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      ReleaseCapture;
      SendMessage( self.hWnd, WM_NCLBUTTONDOWN, 2, 0 );
      snapForm( self, frmPalette );
      snapForm( self, frmWaypoints );
      snapForm( self, frmDisplay );
      snapForm( self, frmTools );
      snapForm( self, frmInfo );
      snapForm( self, frmTexture );
      snapForm( self, frmSoldatMapEditor );
      xPos := self.Left / Screen.TwipsPerPixelX;
      yPos := self.Top / Screen.TwipsPerPixelY;
    end;

  procedure TfrmScenery.picHide_Click;
    begin
      self.Hide;
      frmSoldatMapEditor.mnuScenery.Checked := false;
    end;

  procedure TfrmScenery.picHide_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_DOWN );
    end;

  procedure TfrmScenery.picHide_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_MOVE );
    end;

  procedure TfrmScenery.picHide_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picHide, X, Y, BUTTON_SMALL, 0, BUTTON_UP );
    end;

  procedure TfrmScenery.picRotate_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picRotate, X, Y, BUTTON_SMALL, rotateScenery, BUTTON_DOWN );
    end;

  procedure TfrmScenery.picRotate_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picRotate, X, Y, BUTTON_SMALL, rotateScenery, BUTTON_MOVE, lblRotate.Width + 16 );
    end;

  procedure TfrmScenery.picRotate_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      rotateScenery := not rotateScenery;
    end;

  procedure TfrmScenery.picScale_MouseDown( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picScale, X, Y, BUTTON_SMALL, scaleScenery, BUTTON_DOWN );
    end;

  procedure TfrmScenery.picScale_MouseMove( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picScale, X, Y, BUTTON_SMALL, scaleScenery, BUTTON_MOVE, lblScale.Width + 16 );
    end;

  procedure TfrmScenery.picScale_MouseUp( var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      scaleScenery := not scaleScenery;
    end;

  procedure TfrmScenery.picLevel_MouseDown( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picLevel( Index ), X, Y, BUTTON_SMALL, ( Index = level ), BUTTON_DOWN );
    end;

  procedure TfrmScenery.picLevel_MouseMove( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    begin
      mouseEvent2( picLevel( Index ), X, Y, BUTTON_SMALL, ( Index = level ), BUTTON_MOVE, lblLevel( Index ).Width + 16 );
    end;

  procedure TfrmScenery.picLevel_MouseUp( var Index : smallint; var Button : smallint; var Shift : smallint; var X : single; var Y : single );
    var
      i : smallint; 
    begin
      level := Index;
      for i := 0 to 2 do
        begin
          if ( i <> Index )
            then
              begin
                mouseEvent2( picLevel( i ), X, Y, BUTTON_SMALL, ( i = level ), BUTTON_UP );
              end;
        end;
      frmSoldatMapEditor.setSceneryLevel( level );
      frmSoldatMapEditor.RegainFocus;
    end;

  procedure TfrmScenery.SetColours;
    var
      i : smallint; 
      c : Control; 
    begin
      //ON ERROR
      //--------
      picTitle.Picture := LoadPicture( appPath + '\' + gfxDir + '\titlebar_scenery.bmp' );
      mouseEvent2( picHide, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      mouseEvent2( picSceneryMenu, 0, 0, BUTTON_SMALL, 0, BUTTON_UP );
      for i := 0 to 2 do
        begin
          mouseEvent2( picLevel( i ), 0, 0, BUTTON_SMALL, ( i = level ), BUTTON_UP );
        end;
      mouseEvent2( picScale, 0, 0, BUTTON_SMALL, scaleScenery, BUTTON_UP );
      mouseEvent2( picRotate, 0, 0, BUTTON_SMALL, rotateScenery, BUTTON_UP );
      //--------
      self.BackColor := bgClr;
      lblLvl.BackColor := lblBackClr;
      lblLvl.ForeColor := lblTextClr;
      for i := 0 to 2 do
        begin
          lblLevel( i ).BackColor := lblBackClr;
          lblLevel( i ).ForeColor := lblTextClr;
        end;
      lblRotate.BackColor := lblBackClr;
      lblRotate.ForeColor := lblTextClr;
      lblScale.BackColor := lblBackClr;
      lblScale.ForeColor := lblTextClr;
      lstScenery.BackColor := txtBackClr;
      lstScenery.ForeColor := txtTextClr;
      picScenery.BackColor := bgClr;
      //FOREACH
    end;

end.

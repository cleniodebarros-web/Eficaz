object FrmGrafico_Pie: TFrmGrafico_Pie
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gr'#225'fico'
  ClientHeight = 481
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 440
    Width = 556
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnRetorna: TBitBtn
      Left = 477
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Retorna'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00377777777788
        F8F878F7777777777333333F00004444400777FFF444447777777777F333FF7F
        000033334D5008FFF4333377777777773337777F0000333345D50FFFF4333333
        337F777F3337F33F000033334D5D0FFFF43333333377877F3337F33F00003333
        45D50FEFE4333333337F787F3337F33F000033334D5D0FFFF43333333377877F
        3337F33F0000333345D50FEFE4333333337F787F3337F33F000033334D5D0FFF
        F43333333377877F3337F33F0000333345D50FEFE4333333337F787F3337F33F
        000033334D5D0EFEF43333333377877F3337F33F0000333345D50FEFE4333333
        337F787F3337F33F000033334D5D0EFEF43333333377877F3337F33F00003333
        4444444444333333337F7F7FFFF7F33F00003333333333333333333333777777
        7777333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333777777F3333F00003333330000003333333333337FFFF7F3333F
        0000}
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 556
    Height = 440
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Curva &A'
      object DBChart1: TDBChart
        Left = 0
        Top = 0
        Width = 548
        Height = 412
        AllowPanning = pmNone
        BackWall.Brush.Style = bsClear
        BackWall.Pen.Visible = False
        Gradient.Visible = True
        Title.Font.Height = -19
        Title.Text.Strings = (
          '')
        AxisVisible = False
        BottomAxis.LabelsFormat.TextAlignment = taCenter
        BottomAxis.Title.Caption = 'DESCR'
        Chart3DPercent = 35
        ClipPoints = False
        DepthAxis.LabelsFormat.TextAlignment = taCenter
        DepthTopAxis.LabelsFormat.TextAlignment = taCenter
        Frame.Visible = False
        LeftAxis.LabelsFormat.TextAlignment = taCenter
        LeftAxis.Title.Caption = 'PERCENTUAL'
        Legend.Visible = False
        RightAxis.LabelsFormat.TextAlignment = taCenter
        TopAxis.LabelsFormat.TextAlignment = taCenter
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        View3DWalls = False
        Zoom.Allow = False
        Zoom.Animated = True
        Zoom.Pen.Mode = pmNotXor
        Align = alClient
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series1: TPieSeries
          Marks.Frame.Visible = False
          Marks.Transparent = True
          Marks.Visible = True
          Marks.Style = smsLabelValue
          Marks.Callout.Length = 20
          Title = 'PERCENTUAL'
          XLabelsSource = 'DESCR'
          XValues.Order = loAscending
          YValues.Name = 'Pie'
          YValues.Order = loNone
          YValues.ValueSource = 'PERCENTUAL'
          Frame.InnerBrush.BackColor = clRed
          Frame.InnerBrush.Gradient.EndColor = clGray
          Frame.InnerBrush.Gradient.MidColor = clWhite
          Frame.InnerBrush.Gradient.StartColor = 4210752
          Frame.InnerBrush.Gradient.Visible = True
          Frame.MiddleBrush.BackColor = clYellow
          Frame.MiddleBrush.Gradient.EndColor = 8553090
          Frame.MiddleBrush.Gradient.MidColor = clWhite
          Frame.MiddleBrush.Gradient.StartColor = clGray
          Frame.MiddleBrush.Gradient.Visible = True
          Frame.OuterBrush.BackColor = clGreen
          Frame.OuterBrush.Gradient.EndColor = 4210752
          Frame.OuterBrush.Gradient.MidColor = clWhite
          Frame.OuterBrush.Gradient.StartColor = clSilver
          Frame.OuterBrush.Gradient.Visible = True
          Frame.Width = 4
          OtherSlice.Legend.Visible = False
          OtherSlice.Text = 'Other'
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Curva &B'
      ImageIndex = 1
      object DBChart2: TDBChart
        Left = 0
        Top = 0
        Width = 548
        Height = 412
        AllowPanning = pmNone
        BackWall.Brush.Style = bsClear
        BackWall.Pen.Visible = False
        Gradient.Visible = True
        Title.Font.Height = -19
        Title.Text.Strings = (
          '')
        AxisVisible = False
        BottomAxis.LabelsFormat.TextAlignment = taCenter
        BottomAxis.Title.Caption = 'DESCR'
        Chart3DPercent = 35
        ClipPoints = False
        DepthAxis.LabelsFormat.TextAlignment = taCenter
        DepthTopAxis.LabelsFormat.TextAlignment = taCenter
        Frame.Visible = False
        LeftAxis.LabelsFormat.TextAlignment = taCenter
        LeftAxis.Title.Caption = 'PERCENTUAL'
        Legend.Visible = False
        RightAxis.LabelsFormat.TextAlignment = taCenter
        TopAxis.LabelsFormat.TextAlignment = taCenter
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        View3DWalls = False
        Zoom.Allow = False
        Zoom.Animated = True
        Zoom.Pen.Mode = pmNotXor
        Align = alClient
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object BarSeries1: TPieSeries
          Marks.Frame.Visible = False
          Marks.Transparent = True
          Marks.Visible = True
          Marks.Style = smsLabelValue
          Marks.Callout.Length = 20
          Title = 'PERCENTUAL'
          XLabelsSource = 'DESCR'
          XValues.Order = loAscending
          YValues.Name = 'Pie'
          YValues.Order = loNone
          YValues.ValueSource = 'PERCENTUAL'
          Frame.InnerBrush.BackColor = clRed
          Frame.InnerBrush.Gradient.EndColor = clGray
          Frame.InnerBrush.Gradient.MidColor = clWhite
          Frame.InnerBrush.Gradient.StartColor = 4210752
          Frame.InnerBrush.Gradient.Visible = True
          Frame.MiddleBrush.BackColor = clYellow
          Frame.MiddleBrush.Gradient.EndColor = 8553090
          Frame.MiddleBrush.Gradient.MidColor = clWhite
          Frame.MiddleBrush.Gradient.StartColor = clGray
          Frame.MiddleBrush.Gradient.Visible = True
          Frame.OuterBrush.BackColor = clGreen
          Frame.OuterBrush.Gradient.EndColor = 4210752
          Frame.OuterBrush.Gradient.MidColor = clWhite
          Frame.OuterBrush.Gradient.StartColor = clSilver
          Frame.OuterBrush.Gradient.Visible = True
          Frame.Width = 4
          OtherSlice.Legend.Visible = False
          OtherSlice.Text = 'Other'
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Curva &C'
      ImageIndex = 2
      object DBChart3: TDBChart
        Left = 0
        Top = 0
        Width = 548
        Height = 412
        AllowPanning = pmNone
        BackWall.Brush.Style = bsClear
        BackWall.Pen.Visible = False
        Gradient.Visible = True
        Title.Font.Height = -19
        Title.Text.Strings = (
          '')
        AxisVisible = False
        BottomAxis.LabelsFormat.TextAlignment = taCenter
        BottomAxis.Title.Caption = 'DESCR'
        Chart3DPercent = 35
        ClipPoints = False
        DepthAxis.LabelsFormat.TextAlignment = taCenter
        DepthTopAxis.LabelsFormat.TextAlignment = taCenter
        Frame.Visible = False
        LeftAxis.LabelsFormat.TextAlignment = taCenter
        LeftAxis.Title.Caption = 'PERCENTUAL'
        Legend.Visible = False
        RightAxis.LabelsFormat.TextAlignment = taCenter
        TopAxis.LabelsFormat.TextAlignment = taCenter
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        View3DWalls = False
        Zoom.Allow = False
        Zoom.Animated = True
        Zoom.Pen.Mode = pmNotXor
        Align = alClient
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object BarSeries2: TPieSeries
          Marks.Frame.Visible = False
          Marks.Transparent = True
          Marks.Visible = True
          Marks.Style = smsLabelValue
          Marks.Callout.Length = 20
          Title = 'PERCENTUAL'
          XLabelsSource = 'DESCR'
          XValues.Order = loAscending
          YValues.Name = 'Pie'
          YValues.Order = loNone
          YValues.ValueSource = 'PERCENTUAL'
          Frame.InnerBrush.BackColor = clRed
          Frame.InnerBrush.Gradient.EndColor = clGray
          Frame.InnerBrush.Gradient.MidColor = clWhite
          Frame.InnerBrush.Gradient.StartColor = 4210752
          Frame.InnerBrush.Gradient.Visible = True
          Frame.MiddleBrush.BackColor = clYellow
          Frame.MiddleBrush.Gradient.EndColor = 8553090
          Frame.MiddleBrush.Gradient.MidColor = clWhite
          Frame.MiddleBrush.Gradient.StartColor = clGray
          Frame.MiddleBrush.Gradient.Visible = True
          Frame.OuterBrush.BackColor = clGreen
          Frame.OuterBrush.Gradient.EndColor = 4210752
          Frame.OuterBrush.Gradient.MidColor = clWhite
          Frame.OuterBrush.Gradient.StartColor = clSilver
          Frame.OuterBrush.Gradient.Visible = True
          Frame.Width = 4
          OtherSlice.Legend.Visible = False
          OtherSlice.Text = 'Other'
        end
      end
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 76
    Top = 184
  end
  object Table3: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 92
    Top = 152
  end
  object table1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 92
    Top = 56
  end
  object Table2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 92
    Top = 104
  end
end

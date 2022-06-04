VERSION 5.00
Begin VB.Form Form2 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "开始一个工程"
   ClientHeight    =   6060
   ClientLeft      =   3555
   ClientTop       =   1260
   ClientWidth     =   9870
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6060
   ScaleWidth      =   9870
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   5880
      Top             =   2280
   End
   Begin VB.TextBox Text4 
      Height          =   5895
      Left            =   4920
      MultiLine       =   -1  'True
      TabIndex        =   23
      Top             =   120
      Width           =   4935
   End
   Begin VB.Frame Frame4 
      Caption         =   "收集一些基本信息"
      Enabled         =   0   'False
      Height          =   1095
      Left            =   120
      TabIndex        =   14
      Top             =   4440
      Width           =   4695
      Begin VB.TextBox Text3 
         Height          =   270
         Left            =   1080
         TabIndex        =   18
         Text            =   "（同上）"
         Top             =   720
         Width           =   3495
      End
      Begin VB.TextBox Text2 
         Height          =   270
         Left            =   1080
         TabIndex        =   16
         Text            =   "（仅含英文）"
         Top             =   360
         Width           =   3495
      End
      Begin VB.Label Label5 
         Caption         =   "模组作者："
         Height          =   255
         Left            =   120
         TabIndex        =   17
         Top             =   720
         Width           =   975
      End
      Begin VB.Label Label4 
         Caption         =   "模组名称："
         Height          =   255
         Left            =   120
         TabIndex        =   15
         Top             =   360
         Width           =   1455
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "下载mdk"
      Enabled         =   0   'False
      Height          =   2055
      Left            =   120
      TabIndex        =   10
      Top             =   2280
      Width           =   4695
      Begin VB.DirListBox Dir1 
         Height          =   930
         Left            =   120
         TabIndex        =   13
         Top             =   960
         Width           =   4335
      End
      Begin VB.TextBox Text1 
         Height          =   270
         Left            =   120
         TabIndex        =   12
         Text            =   "（选择完成后双击这里并执行）"
         Top             =   240
         Width           =   4335
      End
      Begin VB.DriveListBox Drive1 
         Height          =   300
         Left            =   120
         TabIndex        =   11
         Top             =   600
         Width           =   4335
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "控制"
      Height          =   735
      Left            =   120
      TabIndex        =   7
      Top             =   120
      Width           =   4695
      Begin VB.CommandButton Command2 
         Caption         =   "表现自己~"
         Height          =   375
         Left            =   3120
         TabIndex        =   22
         Top             =   240
         Width           =   1335
      End
      Begin VB.CommandButton Command3 
         Caption         =   "构建"
         Enabled         =   0   'False
         Height          =   375
         Left            =   1560
         TabIndex        =   9
         Top             =   240
         Width           =   1335
      End
      Begin VB.CommandButton Command1 
         Caption         =   "下一步"
         Height          =   375
         Left            =   120
         TabIndex        =   8
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "需要手动确认完成的操作"
      Height          =   1215
      Left            =   120
      TabIndex        =   0
      Top             =   960
      Width           =   4695
      Begin VB.CheckBox Check3 
         Caption         =   "Check3"
         Height          =   180
         Left            =   3720
         TabIndex        =   6
         Top             =   840
         Width           =   135
      End
      Begin VB.CheckBox Check2 
         Caption         =   "Check2"
         Height          =   180
         Left            =   3360
         TabIndex        =   4
         Top             =   600
         Width           =   135
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Check1"
         Height          =   180
         Left            =   2640
         TabIndex        =   2
         Top             =   360
         Width           =   135
      End
      Begin VB.Label Label3 
         Caption         =   "3.安装了尾号为2847的forge并已经启动过"
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   840
         Width           =   3375
      End
      Begin VB.Label Label2 
         Caption         =   "2.安装了白端（官方启动器）和1.12.2"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   600
         Width           =   3975
      End
      Begin VB.Label Label1 
         Caption         =   "1.安装并配置jkd8的环境变量"
         Height          =   375
         Left            =   120
         TabIndex        =   1
         Top             =   360
         Width           =   2775
      End
   End
   Begin VB.Label Label8 
      Caption         =   "1"
      Height          =   375
      Left            =   1800
      TabIndex        =   21
      Top             =   5640
      Width           =   1095
   End
   Begin VB.Label Label7 
      Caption         =   "阶段"
      Height          =   375
      Left            =   1320
      TabIndex        =   20
      Top             =   5640
      Width           =   2415
   End
   Begin VB.Label Label6 
      Caption         =   "执行阶段："
      Height          =   495
      Left            =   120
      TabIndex        =   19
      Top             =   5640
      Width           =   1095
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function URLDownloadToFile Lib "urlmon.dll" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
Private Sub Command1_Click()
If Label8.Caption = 1 Then
If Check1.Value = 1 And Check2.Value = 1 And Check3.Value = 1 Then
    Frame1.Enabled = False
    Frame3.Enabled = True
    Label8.Caption = 2
    Else
    MsgBox "请勾选单选框", vbCritical
    End If
Else
If Label8.Caption = 2 Then
    If Text1.Text = "（选择完成后双击这里并执行）" Then
        MsgBox "请选择文件路径", vbCritical
        Else
        b = Left(Text1.Text, 1)
        Dim nUrl As String, F As String, S As Long
        nUrl = "https://maven.minecraftforge.net/net/minecraftforge/forge/1.12.2-14.23.5.2847/forge-1.12.2-14.23.5.2847-mdk.zip": F = App.Path & "\mdk.zip"
        S = URLDownloadToFile(0, nUrl, F, 0, 0)
        MsgBox "已完成下载,等待解压", vbInformation
        Shell ("C:\Windows\System32\cmd.exe /c copy C:\Windows\System32\cmd.exe " & App.Path & "")
        MsgBox "复制了一个cmd到该文件夹", vbInformation
        Shell ("" & App.Path & "\cmd.exe /c tar -xzvf mdk.zip")
        MsgBox "解压成功", vbInformation
        Shell ("" & App.Path & "\cmd.exe /c rd /s /q " & App.Path & "\src\main\java\com\example")
        Frame3.Enabled = False
        Frame4.Enabled = True
        Label8.Caption = 3
        End If
    Else
    If Label8.Caption = 3 Then
        If Text2.Text = "（仅含英文）" Or Text3.Text = "（同上）" Then
            MsgBox "这只是个离线程序,我们不会收集您的任何信息", vbCritical, "请填写"
            Else
            Shell ("" & App.Path & "\cmd /c md " & App.Path & "\src\main\java\com\" & Text3.Text & "\" & Text2.Text & "")
            Frame4.Enabled = False
            Command3.Enabled = True
            Command1.Enabled = False
            Label8.Caption = "final"
            End If
        End If
    End If
End If
End Sub

Private Sub Command2_Click()
MsgBox "阶段一双击文本可以直接下载到ForgeHelper所在位置", vbInformation, "但可能导致短暂未响应"
End Sub

Private Sub Command3_Click()
Shell ("" & App.Path & "\cmd /c gradlew setupdecompworkspace")
Timer1.Enabled = True
End Sub

Private Sub Drive1_Change()
Dir1.Path = Drive1.Drive
End Sub

Private Sub Label1_DblClick()
Dim nUrl As String, F As String, S As Long
nUrl = "https://dl.softmgr.qq.com/original/Development/jdk-8u191-windows-x64-8.0.1910.12.exe": F = App.Path & "\jdk_installer.exe"
S = URLDownloadToFile(0, nUrl, F, 0, 0)
End If
End Sub

Private Sub Label2_DblClick()
Dim nUrl As String, F As String, S As Long
nUrl = "https://launcher.mojang.com/download/MinecraftInstaller.msi": F = App.Path & "\mc_installer.msi"
S = URLDownloadToFile(0, nUrl, F, 0, 0)
MsgBox "已完成下载", vbInformation
End Sub

Private Sub label3_DblClick()
Dim nUrl As String, F As String, S As Long
nUrl = "https://maven.minecraftforge.net/net/minecraftforge/forge/1.12.2-14.23.5.2847/forge-1.12.2-14.23.5.2847-installer.jar": F = App.Path & "\forge_installer.jar"
S = URLDownloadToFile(0, nUrl, F, 0, 0)
MsgBox "已完成下载", vbInformation
End Sub

Private Sub Text1_DblClick()
Text1.Text = Dir1.Path
End Sub

Private Sub Timer1_Timer()
Dim fso As Object, ts As Object
If Dir("" & App.Path & "\.gradle\gradle.log") = "" Then
Text4.Text = "building environment..."
Else
Text4.Text = ""
Set fso = CreateObject("Scripting.FileSystemObject")
Set ts = fso.opentextfile(App.Path & "\.gradle\gradle.log", 1)
Do While ts.AtEndofStream <> True
Text4 = Text4 & ts.ReadLine & vbCrLf
Loop
ts.Close
Set ts = Nothing
Set fso = Nothing
i = InStr(1, "" & Text4.Text & "", "SUCCESSFUL", 1)
If i = 0 Then
If Text4.Text = "" Then
Text4.Text = "buiding environment..."
Else
MsgBox "构建错误,请按照报错重新调整", vbCritical, "被门夹过的核桃不能补脑"
Label8.Caption = "build failed"
Timer1.Enabled = False
End If
Else
MsgBox "构建成功", vbInformation, "被门夹过的核桃不能补脑"
Label8.Caption = successful
Timer1.Enabled = False
Command2.Enabled = False
End If
End If
End Sub

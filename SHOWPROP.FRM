VERSION 5.00
Begin VB.Form Form2 
   BackColor       =   &H00000000&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Properties"
   ClientHeight    =   3600
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3660
   DrawStyle       =   5  'Transparent
   FillColor       =   &H80000007&
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3600
   ScaleWidth      =   3660
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text10 
      BackColor       =   &H80000007&
      ForeColor       =   &H80000005&
      Height          =   285
      Left            =   3000
      TabIndex        =   9
      Top             =   2160
      Width           =   495
   End
   Begin VB.TextBox Text9 
      BackColor       =   &H80000007&
      ForeColor       =   &H80000005&
      Height          =   285
      Left            =   3000
      TabIndex        =   8
      Top             =   1800
      Width           =   495
   End
   Begin VB.TextBox Text8 
      BackColor       =   &H80000007&
      ForeColor       =   &H80000005&
      Height          =   285
      Left            =   3000
      TabIndex        =   7
      Top             =   1440
      Width           =   495
   End
   Begin VB.TextBox Text7 
      BackColor       =   &H80000007&
      ForeColor       =   &H80000005&
      Height          =   285
      Left            =   3000
      TabIndex        =   6
      Top             =   1080
      Width           =   495
   End
   Begin VB.TextBox Text6 
      BackColor       =   &H80000007&
      ForeColor       =   &H80000005&
      Height          =   285
      Left            =   1200
      TabIndex        =   5
      Top             =   2640
      Width           =   495
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H00000000&
      Caption         =   "Default"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      MaskColor       =   &H00000000&
      TabIndex        =   10
      Top             =   3240
      UseMaskColor    =   -1  'True
      Width           =   975
   End
   Begin VB.TextBox Text5 
      BackColor       =   &H80000007&
      ForeColor       =   &H80000005&
      Height          =   285
      Left            =   1200
      TabIndex        =   4
      Top             =   2160
      Width           =   495
   End
   Begin VB.TextBox Text4 
      BackColor       =   &H80000007&
      ForeColor       =   &H80000005&
      Height          =   285
      Left            =   1200
      TabIndex        =   3
      Top             =   1800
      Width           =   495
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00000000&
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   162
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3000
      MaskColor       =   &H00000000&
      TabIndex        =   11
      Top             =   3240
      UseMaskColor    =   -1  'True
      Width           =   495
   End
   Begin VB.TextBox Text3 
      BackColor       =   &H80000007&
      ForeColor       =   &H80000005&
      Height          =   285
      Left            =   1200
      TabIndex        =   2
      Top             =   1440
      Width           =   495
   End
   Begin VB.TextBox Text2 
      BackColor       =   &H80000007&
      ForeColor       =   &H80000005&
      Height          =   285
      Left            =   1200
      TabIndex        =   1
      Top             =   1080
      Width           =   495
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H80000007&
      ForeColor       =   &H80000005&
      Height          =   285
      Left            =   1200
      TabIndex        =   0
      Top             =   120
      Width           =   495
   End
   Begin VB.Label Label12 
      BackStyle       =   0  'Transparent
      Caption         =   "Unit_vy"
      ForeColor       =   &H80000005&
      Height          =   255
      Left            =   1920
      TabIndex        =   23
      Top             =   2160
      Width           =   735
   End
   Begin VB.Label Label11 
      BackStyle       =   0  'Transparent
      Caption         =   "Unit_vx"
      ForeColor       =   &H80000005&
      Height          =   255
      Left            =   1920
      TabIndex        =   22
      Top             =   1800
      Width           =   735
   End
   Begin VB.Label Label10 
      BackStyle       =   0  'Transparent
      Caption         =   "Unit_y"
      ForeColor       =   &H80000005&
      Height          =   255
      Left            =   1920
      TabIndex        =   21
      Top             =   1440
      Width           =   735
   End
   Begin VB.Label Label9 
      BackStyle       =   0  'Transparent
      Caption         =   "Unit_x"
      ForeColor       =   &H80000005&
      Height          =   255
      Left            =   1920
      TabIndex        =   20
      Top             =   1080
      Width           =   735
   End
   Begin VB.Label Label8 
      BackStyle       =   0  'Transparent
      Caption         =   "g (Earth)"
      ForeColor       =   &H80000005&
      Height          =   255
      Left            =   120
      TabIndex        =   19
      Top             =   2640
      Width           =   735
   End
   Begin VB.Label Label7 
      BackStyle       =   0  'Transparent
      Caption         =   "4"
      ForeColor       =   &H80000005&
      Height          =   255
      Left            =   360
      TabIndex        =   18
      Top             =   2160
      Width           =   135
   End
   Begin VB.Label Label6 
      BackStyle       =   0  'Transparent
      Caption         =   "3"
      ForeColor       =   &H80000005&
      Height          =   255
      Left            =   360
      TabIndex        =   17
      Top             =   1800
      Width           =   135
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "2"
      ForeColor       =   &H80000005&
      Height          =   255
      Left            =   360
      TabIndex        =   16
      Top             =   1440
      Width           =   255
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "1"
      ForeColor       =   &H80000005&
      Height          =   255
      Left            =   360
      TabIndex        =   15
      Top             =   1080
      Width           =   255
   End
   Begin VB.Label Label3 
      BackColor       =   &H80000007&
      BackStyle       =   0  'Transparent
      Caption         =   "Explosion#"
      ForeColor       =   &H80000005&
      Height          =   255
      Left            =   120
      TabIndex        =   14
      Top             =   720
      Width           =   855
   End
   Begin VB.Label Label2 
      BackColor       =   &H80000007&
      BackStyle       =   0  'Transparent
      Caption         =   "Pieces"
      ForeColor       =   &H80000005&
      Height          =   255
      Left            =   1200
      TabIndex        =   13
      Top             =   720
      Width           =   495
   End
   Begin VB.Label Label1 
      BackColor       =   &H80000007&
      BackStyle       =   0  'Transparent
      Caption         =   "Explosions"
      ForeColor       =   &H80000005&
      Height          =   255
      Left            =   120
      TabIndex        =   12
      Top             =   240
      Width           =   975
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
File_Stop_Bit = 1
Explosions = Val(Text1.Text)
If Explosions > 4 Then Explosions = 4
If Explosions < 0 Then Explosions = 1
Pieces(1) = Val(Text2.Text)
Pieces(2) = Val(Text3.Text)
Pieces(3) = Val(Text4.Text)
Pieces(4) = Val(Text5.Text)
g = Val(Text6.Text) / 3.333333
Unit_x = Val((Text7.Text))
Unit_y = Val((Text8.Text))
Unit_vx = Val((Text9.Text))
Unit_vy = Val((Text10.Text))
For Counter = 1 To Explosions
    If Pieces(Counter_F2) > 64 Then
        Pieces(Counter_F2) = 64
    ElseIf Pieces(Counter_F2) < 1 Then
        Pieces(Counter_F2) = 1
    End If
    Form1.SET_NEW_VALUES Counter_F2
Next Counter
Coming_From_Form_2 = 1
Unload Me
End Sub

Private Sub Command2_Click()
Text1.Text = "4"
Text2.Text = "16"
Text3.Text = "16"
Text4.Text = "16"
Text5.Text = "16"
End Sub

Private Sub Form_Load()
Text1.Text = LTrim(Str$(Explosions))
Text2.Text = LTrim(Str$(Pieces(1)))
Text3.Text = LTrim(Str$(Pieces(2)))
Text4.Text = LTrim(Str$(Pieces(3)))
Text5.Text = LTrim(Str$(Pieces(4)))
Text6.Text = LTrim(Str$(3.333333 * g))
Text7.Text = LTrim(Str$(Unit_x))
Text8.Text = LTrim(Str$(Unit_y))
Text9.Text = LTrim(Str$(Unit_vx))
Text10.Text = LTrim(Str$(Unit_vy))
Form2.Top = Form1.Top + Form1.Height / 4
Form2.Left = Form1.Left + (Form1.Width - Form2.Width) / 2
End Sub

Private Sub Text1_GotFocus()
Text1.SelStart = 0
Text1.SelLength = Len(Text1.Text)
End Sub

Private Sub Text2_GotFocus()
Text2.SelStart = 0
Text2.SelLength = Len(Text2.Text)
End Sub
Private Sub Text3_GotFocus()
Text3.SelStart = 0
Text3.SelLength = Len(Text3.Text)
End Sub
Private Sub Text4_GotFocus()
Text4.SelStart = 0
Text4.SelLength = Len(Text4.Text)
End Sub

Private Sub Text5_GotFocus()
Text5.SelStart = 0
Text5.SelLength = Len(Text5.Text)
End Sub

Private Sub Text6_GotFocus()
Text6.SelStart = 0
Text6.SelLength = Len(Text6.Text)
End Sub

Private Sub Text7_GotFocus()
Text7.SelStart = 0
Text7.SelLength = Len(Text8.Text)
End Sub

Private Sub Text8_GotFocus()
Text8.SelStart = 0
Text8.SelLength = Len(Text8.Text)
End Sub

Private Sub Text9_GotFocus()
Text9.SelStart = 0
Text9.SelLength = Len(Text9.Text)
End Sub


Private Sub text10_GotFocus()
Text10.SelStart = 0
Text10.SelLength = Len(Text10.Text)
End Sub



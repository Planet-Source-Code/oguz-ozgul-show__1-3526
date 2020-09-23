VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Boom!"
   ClientHeight    =   3615
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   5055
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3615
   ScaleWidth      =   5055
   StartUpPosition =   3  'Windows Default
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      ForeColor       =   &H8000000E&
      Height          =   255
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   855
   End
   Begin VB.Menu File 
      Caption         =   "&File"
      Index           =   1
      WindowList      =   -1  'True
      Begin VB.Menu File_Start 
         Caption         =   "&Start"
         Index           =   2
         Shortcut        =   {F2}
      End
      Begin VB.Menu File_Stop 
         Caption         =   "S&top"
         Index           =   3
      End
      Begin VB.Menu File_Exit 
         Caption         =   "E&xit"
         Index           =   4
      End
   End
   Begin VB.Menu Options 
      Caption         =   "&Options"
      Index           =   5
      Begin VB.Menu Options_Explotions 
         Caption         =   "&Explosions"
         Index           =   6
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim pieceon As Long
Dim t1 As Single
Option Explicit

Private Sub File_Exit_Click(Index As Integer)
Form1.Cls
Unload Me
End
End Sub

Private Sub File_Start_Click(Index As Integer)
File_Stop_Bit = 0
Form1.Cls
For Explosion_No = 1 To Explosions
    SET_NEW_VALUES Explosion_No
Next Explosion_No
DoIt:
COUNT_THE_COORDINATES
'CHECK_THE_COORDINATES
ROTATE_PIECES
DRAW_PIECES
'DoEvents: This is important
'If you don't put DoEvents in your main control routine
'You can't use any of the command buttons, textboxes, etc..
'Then you have to add it if you are programming games
'or something takes time like this
DoEvents
If File_Stop_Bit Then Exit Sub
GoTo DoIt
End Sub

Private Sub File_Stop_Click(Index As Integer)
Form1.Cls
File_Stop_Bit = 1
End Sub

Private Sub Form_GotFocus()
Label1.Caption = ""
If Coming_From_Form_2 Then
    File_Start_Click 1
End If
End Sub

Private Sub Form_Load()
Coming_From_Form_2 = 0
'This is the most important think
Randomize Timer
'Set the default values
DEFAULT_VALUES
'Take the screen width and height
sw = Screen.Width
sh = Screen.Height
'Half screen
fw = sw / 2 'Set form width
fh = sh / 2 'Set form Height
'Full screen
'fw = sw
'fh = sh
'.Scalemode = 3, Sets the objects scale mode to pixels
'Enables to work with pixels while using the pset or line statements
'1 pixel = 15 twips on 640*480
Form1.ScaleMode = 3
'Put the form to the middle of the screen
'and set the form size
'.Move method is faster than changing the left and top properties
'It is also easier to change the size of an object with .Move method
Form1.Move sw / 2 - sw / 4, sh / 2 - sh / 4, fw, fh
'Fullscreen
'Form1.Move 0, 0, fw, fh
End Sub

Sub DEFAULT_VALUES()
g = 0
Explosions = 4
Pieces(1) = 32: Pieces(2) = 64
Pieces(3) = 32: Pieces(4) = 64
Unit_x = 0.5: Unit_y = 0.5
Unit_vx = 5: Unit_vy = 5
End Sub

Sub SET_NEW_VALUES(ExplosionNo As Single)
Total_Count(ExplosionNo) = 0
Explosion_x(ExplosionNo) = Rnd * fw / 15
Explosion_y(ExplosionNo) = Rnd * (fh / 15 - 100)
For Piece_No = 1 To Pieces(ExplosionNo)
    Tmp_Str = ""
    'One piece includes nine pixels
    'The sort order makes the rotation easier
    'But rotate only the first eight
    'Because pixel nine is the center.
    '   1 2 3
    '   8 9 4
    '   7 6 5
    'Lets create the piece randomly:
    For Counter = 1 To 9
        Tmp_Str = Tmp_Str + LTrim$(Str$(Int(Rnd * 2)))
    Next Counter
    'For example,
    'If the piece content is "110100101"
    'it will look like this:
    '   X X .
    '   . X X
    '   X . .
    'Replace the content of the piece:
    Piece_Content(ExplosionNo, Piece_No) = Tmp_Str
    'To randomize the rotation frequency: (1,2,3 or 4)
    'With this, every piece will have it's own frequency to turn
    Rotation_Frq(ExplosionNo, Piece_No) = Int(1 + Int(Rnd * 4))
    'To randomize the rotation: (0 or 1, 1 means clockwise)
    Direction(ExplosionNo, Piece_No) = Int(Rnd * 2)
    'Create the vertical and horizontal speed randomly
    Piece_vx(ExplosionNo, Piece_No) = Unit_vx - (Rnd * 2 * Unit_vx) '(-Unit_vx,Unit_vx)
    Piece_vy(ExplosionNo, Piece_No) = Unit_vy - (Rnd * 2 * Unit_vy) '(-Unit_vy,Unit_vy)
    Piece_x(ExplosionNo, Piece_No) = Explosion_x(ExplosionNo)
    Piece_y(ExplosionNo, Piece_No) = Explosion_y(ExplosionNo)
    Piece_dx(ExplosionNo, Piece_No) = Piece_x(ExplosionNo, Piece_No)
    Piece_dy(ExplosionNo, Piece_No) = Piece_y(ExplosionNo, Piece_No)
Next Piece_No
'The values for drawing by the content strings
Dr_Cont_x1(1) = -4 * Unit_x: Dr_Cont_y1(1) = -4 * Unit_y
Dr_Cont_x2(1) = -2 * Unit_x: Dr_Cont_y2(1) = -2 * Unit_y
Dr_Cont_x1(2) = -1 * Unit_x: Dr_Cont_y1(2) = -4 * Unit_y
Dr_Cont_x2(2) = 1 * Unit_x: Dr_Cont_y2(2) = -2 * Unit_y
Dr_Cont_x1(3) = 2 * Unit_x: Dr_Cont_y1(3) = -4 * Unit_y
Dr_Cont_x2(3) = 4 * Unit_x: Dr_Cont_y2(3) = -2 * Unit_y
Dr_Cont_x1(4) = 2 * Unit_x: Dr_Cont_y1(4) = -1 * Unit_y
Dr_Cont_x2(4) = 4 * Unit_x: Dr_Cont_y2(4) = 1 * Unit_y
Dr_Cont_x1(5) = 2 * Unit_x: Dr_Cont_y1(5) = 2 * Unit_y
Dr_Cont_x2(5) = 4 * Unit_x: Dr_Cont_y2(5) = 4 * Unit_y
Dr_Cont_x1(6) = -1 * Unit_x: Dr_Cont_y1(6) = 2 * Unit_y
Dr_Cont_x2(6) = 1 * Unit_x: Dr_Cont_y2(6) = 4 * Unit_y
Dr_Cont_x1(7) = -4 * Unit_x: Dr_Cont_y1(7) = 2 * Unit_y
Dr_Cont_x2(7) = -2 * Unit_x: Dr_Cont_y2(7) = 4 * Unit_y
Dr_Cont_x1(8) = -4 * Unit_x: Dr_Cont_y1(8) = -1 * Unit_y
Dr_Cont_x2(8) = -2 * Unit_x: Dr_Cont_y2(8) = 1 * Unit_y
Dr_Cont_x1(9) = -1 * Unit_x: Dr_Cont_y1(9) = -1 * Unit_y
Dr_Cont_x2(9) = 1 * Unit_x: Dr_Cont_y2(9) = 1 * Unit_y
'As you see, number nine is the center
End Sub

Sub ROTATE_PIECES()
For Explosion_No = 1 To Explosions
    For Piece_No = 1 To Pieces(Explosion_No)
        If Total_Count(Explosion_No) Mod Rotation_Frq(Explosion_No, Piece_No) = 0 Then
            'Take the first 8 characters of the piece:
            Tmp_Str = Left$(Piece_Content(Explosion_No, Piece_No), 8)
            'if the direction is clockwise:
            If Direction(Explosion_No, Piece_No) = 1 Then
                'Add the last pixel to the start, and then take the first eight
                'So we have the piece turned
                Tmp_Str = Left$(Right$(Tmp_Str, 1) + Tmp_Str, 8)
            'if not:
            Else
                'Add the first pixel to the end, and then take the last eight
                'So we have the piece turned again
                Tmp_Str = Right$(Tmp_Str + Left$(Tmp_Str, 1), 8)
            End If
            'Replace the piece
            'Don't forget to add the center piece
            Piece_Content(Explosion_No, Piece_No) = Tmp_Str + Right$(Piece_Content(Explosion_No, Piece_No), 1)
        End If
    Next Piece_No
Next Explosion_No
End Sub

Sub COUNT_THE_COORDINATES()
For Explosion_No = 1 To Explosions
    'Add 1 to total counts
    Total_Count(Explosion_No) = Total_Count(Explosion_No) + 1
    For Piece_No = 1 To Pieces(Explosion_No)
        Piece_dx(Explosion_No, Piece_No) = Piece_x(Explosion_No, Piece_No)
        Piece_dy(Explosion_No, Piece_No) = Piece_y(Explosion_No, Piece_No)
        Piece_x(Explosion_No, Piece_No) = Piece_x(Explosion_No, Piece_No) + Piece_vx(Explosion_No, Piece_No)
        Piece_vy(Explosion_No, Piece_No) = Piece_vy(Explosion_No, Piece_No) + g
        Piece_y(Explosion_No, Piece_No) = Piece_y(Explosion_No, Piece_No) + Piece_vy(Explosion_No, Piece_No)
    Next Piece_No
    If Total_Count(Explosion_No) >= 75 Then
        If Rnd < 0.15 Then
            CLEAR_PIECES Explosion_No, 0, 1
            SET_NEW_VALUES Explosion_No
        End If
    End If
Next Explosion_No
End Sub

Sub CHECK_THE_COORDINATES()
For Explosion_No = 1 To Explosions
    For Piece_No = 1 To Pieces(Explosion_No)
        'Check the pieces hitting the walls
        If Piece_x(Explosion_No, Piece_No) >= fw / 15 Then
            Piece_x(Explosion_No, Piece_No) = fw / 15 - 2
            Piece_vx(Explosion_No, Piece_No) = -Piece_vx(Explosion_No, Piece_No)
        ElseIf Piece_x(Explosion_No, Piece_No) <= 0 Then
            Piece_x(Explosion_No, Piece_No) = 1
            Piece_vx(Explosion_No, Piece_No) = -Piece_vx(Explosion_No, Piece_No)
        End If
        If Piece_y(Explosion_No, Piece_No) >= fh / 15 - 60 Then
            Piece_y(Explosion_No, Piece_No) = fh / 15 - 62
            Piece_vy(Explosion_No, Piece_No) = -Piece_vy(Explosion_No, Piece_No) / 2
        ElseIf Piece_y(Explosion_No, Piece_No) <= 0 Then
            Piece_y(Explosion_No, Piece_No) = 1
            Piece_vy(Explosion_No, Piece_No) = -Piece_vy(Explosion_No, Piece_No) / 2
        End If
    Next Piece_No
Next Explosion_No
End Sub

Sub DRAW_PIECES()
pieceon = pieceon + 1
If Timer - t1 > 1 Then
    Label1.Caption = "fps: " + Str$(pieceon)
    pieceon = 0
    t1 = Timer
End If
'If you want, you can use the cls command for clearing the form
'form1.cls
For Explosion_No = 1 To Explosions
    For Piece_No = 1 To Pieces(Explosion_No)
        'First, delete the existing by drawing a black box
        'It looks better than clear the form with cls
        Form1.Line (Piece_dx(Explosion_No, Piece_No) - 4 * Unit_x, Piece_dy(Explosion_No, Piece_No) - 4 * Unit_y)-(Piece_dx(Explosion_No, Piece_No) + 4 * Unit_y, Piece_dy(Explosion_No, Piece_No) + 4 * Unit_y), QBColor(0), BF
        'Then set the new one
        For Counter = 1 To 9
            If Mid$(Piece_Content(Explosion_No, Piece_No), Counter, 1) = "1" Then
                Form1.PSet (Piece_x(Explosion_No, Piece_No) + Dr_Cont_x1(Counter), Piece_y(Explosion_No, Piece_No) + Dr_Cont_y1(Counter)), QBColor(14)
            End If
        Next Counter
    Next Piece_No
Next Explosion_No
End Sub

Sub CLEAR_PIECES(ExplosionNo As Single, PieceNo As Single, All As Single)
'If the user wants to clear all pieces
'of the explosion:
If All = 1 Then
    For Piece_No = 1 To Pieces(ExplosionNo)
        Form1.Line (Piece_dx(ExplosionNo, Piece_No) - 4 * Unit_x, Piece_dy(ExplosionNo, Piece_No) - 4 * Unit_y)-(Piece_dx(ExplosionNo, Piece_No) + 4 * Unit_y, Piece_dy(ExplosionNo, Piece_No) + 4 * Unit_y), QBColor(0), BF
    Next Piece_No
'If the user wants to clear only one piece
Else
    Form1.Line (Piece_dx(ExplosionNo, Piece_No) - 4 * Unit_x, Piece_dy(ExplosionNo, Piece_No) - 4 * Unit_y)-(Piece_dx(ExplosionNo, Piece_No) + 4 * Unit_y, Piece_dy(ExplosionNo, Piece_No) + 4 * Unit_y), QBColor(0), BF
End If
End Sub

Private Sub Options_Explotions_Click(Index As Integer)
Form2.Show
End Sub

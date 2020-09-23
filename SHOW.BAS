Attribute VB_Name = "Module1"
'Option explicit protects you against anarchie on the source!
Option Explicit
'You have to define all variables used within the source
Public Unit_vx As Single, Unit_vy As Single
Public Unit_x As Single, Unit_y As Single
Public Coming_From_Form_2 As Long
Public Counter_F2 As Single
Public sw As Single, sh As Single, fw As Single, fh As Single
Public Explosions As Single, Pieces(4) As Single
Public Explosion_No As Single, Piece_No As Single
Public Explosion_x(4) As Single, Explosion_y(4) As Single
Public g As Single
Public Piece_x(4, 64) As Single, Piece_y(4, 64) As Single
Public Piece_vx(4, 64) As Single, Piece_vy(4, 64) As Single
Public Piece_dx(4, 64) As Single, Piece_dy(4, 64) As Single
Public Piece_Content(4, 64) As String
Public Dr_Cont_x1(9), Dr_Cont_y1(9)
Public Dr_Cont_x2(9), Dr_Cont_y2(9)
Public Direction(4, 64) As Single, Rotation_Frq(4, 64)
Public Tmp_Str As String
Public Counter As Single
Public Total_Count(4) As Single
Public File_Stop_Bit As Long


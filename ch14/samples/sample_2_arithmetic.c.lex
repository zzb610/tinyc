TOKEN-TYPE          TOKEN-VALUE
--------------------------------------
T_Int               int
T_Identifier        main
(                   (
)                   )
{                   {
T_Int               int
T_Identifier        x
,                   ,
T_Identifier        y
,                   ,
T_Identifier        z
;                   ;
T_Identifier        x
=                   =
T_IntConstant       1
;                   ;
T_Identifier        y
=                   =
T_IntConstant       2
;                   ;
T_Identifier        z
=                   =
T_Identifier        x
+                   +
T_Identifier        y
;                   ;
T_Print             print
(                   (
T_StringConstant    "x = %d, y = %d, z = %d"
,                   ,
T_Identifier        x
,                   ,
T_Identifier        y
,                   ,
T_Identifier        z
)                   )
;                   ;
T_Print             print
(                   (
T_StringConstant    "x + y = %d"
,                   ,
T_Identifier        x
+                   +
T_Identifier        y
)                   )
;                   ;
T_Print             print
(                   (
T_StringConstant    "x - y = %d"
,                   ,
T_Identifier        x
-                   -
T_Identifier        y
)                   )
;                   ;
T_Print             print
(                   (
T_StringConstant    "x * y = %d"
,                   ,
T_Identifier        x
*                   *
T_Identifier        y
)                   )
;                   ;
T_Print             print
(                   (
T_StringConstant    "x / y = %d"
,                   ,
T_Identifier        x
/                   /
T_Identifier        y
)                   )
;                   ;
T_Print             print
(                   (
T_StringConstant    "x %% y = %d"
,                   ,
T_Identifier        x
%                   %
T_Identifier        y
)                   )
;                   ;
T_Print             print
(                   (
T_StringConstant    "-x = %d, -y = %d"
,                   ,
-                   -
T_Identifier        x
,                   ,
-                   -
T_Identifier        y
)                   )
;                   ;
T_Return            return
T_IntConstant       0
;                   ;
}                   }
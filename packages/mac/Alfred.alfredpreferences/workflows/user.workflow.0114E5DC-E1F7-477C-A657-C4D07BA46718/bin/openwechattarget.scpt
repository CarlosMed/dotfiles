FasdUAS 1.101.10   ��   ��    k             l     ��  ��    G A Applescript to start a new conversation in WeChat using provided     � 	 	 �   A p p l e s c r i p t   t o   s t a r t   a   n e w   c o n v e r s a t i o n   i n   W e C h a t   u s i n g   p r o v i d e d   
  
 l     ��  ��    K E target address. This is to fix problem of using WeChat's URL scheme,     �   �   t a r g e t   a d d r e s s .   T h i s   i s   t o   f i x   p r o b l e m   o f   u s i n g   W e C h a t ' s   U R L   s c h e m e ,      l     ��  ��    D > where WeChat ignores incoming URL request that is sent before     �   |   w h e r e   W e C h a t   i g n o r e s   i n c o m i n g   U R L   r e q u e s t   t h a t   i s   s e n t   b e f o r e      l     ��  ��      WeChat is logged in.     �   *   W e C h a t   i s   l o g g e d   i n .      l     ��������  ��  ��        l     ��  ��     	 Guan Gui     �      G u a n   G u i     !   l     �� " #��   "   http://www.guiguan.net    # � $ $ .   h t t p : / / w w w . g u i g u a n . n e t !  % & % l     �� ' (��   '       ( � ) )    &  * + * l     �� , -��   ,   19/11/2014    - � . .    1 9 / 1 1 / 2 0 1 4 +  / 0 / l     ��������  ��  ��   0  1 2 1 i      3 4 3 I     �� 5��
�� .aevtoappnull  �   � **** 5 o      ���� 0 argv  ��   4 k     � 6 6  7 8 7 Z     9 :���� 9 H      ; ; I     �� <���� *0 enabledguiscripting enabledGUIScripting <  =�� = m    ��
�� boovtrue��  ��   : L   
 ����  ��  ��   8  > ? > l   ��������  ��  ��   ?  @ A @ r     B C B c     D E D o    ���� 0 argv   E m    ��
�� 
TEXT C o      ���� 
0 target   A  F G F l   ��������  ��  ��   G  H I H I   �� J��
�� .miscactvnull��� ��� null J m     K K�                                                                                      @ alis    N  Macintosh HD               Ζ�vH+  B5�
WeChat.app                                                     �[��}�        ����  	                Applications    Ζ�      �}n    B5�  %Macintosh HD:Applications: WeChat.app    
 W e C h a t . a p p    M a c i n t o s h   H D  Applications/WeChat.app   / ��  ��   I  L�� L O    � M N M O   ! � O P O k   ( � Q Q  R S R r   ( 7 T U T n   ( 5 V W V 4   2 5�� X
�� 
menI X m   3 4����  W n   ( 2 Y Z Y 4   / 2�� [
�� 
menE [ m   0 1����  Z n   ( / \ ] \ 4   , /�� ^
�� 
mbri ^ m   - .����  ] 4   ( ,�� _
�� 
mbar _ m   * +����  U o      ���� 0 prefmenu prefMenu S  ` a ` l  8 8��������  ��  ��   a  b c b r   8 ? d e d l  8 = f���� f >  8 = g h g n   8 ; i j i 1   9 ;��
�� 
enaB j o   8 9���� 0 prefmenu prefMenu h m   ; <��
�� boovtrue��  ��   e o      ���� (0 prefmenuinitstatus prefMenuInitStatus c  k l k l  @ @��������  ��  ��   l  m n m l  @ @�� o p��   o ( " wait until the user has logged in    p � q q D   w a i t   u n t i l   t h e   u s e r   h a s   l o g g e d   i n n  r s r W   @ T t u t I  J O�� v��
�� .sysodelanull��� ��� nmbr v m   J K w w ?�      ��   u =  D I x y x n   D G z { z 1   E G��
�� 
enaB { o   D E���� 0 prefmenu prefMenu y m   G H��
�� boovtrue s  | } | l  U U��������  ��  ��   }  ~  ~ l  U U�� � ���   � = 7 Bring WeChat app to front. When user has closed WeChat    � � � � n   B r i n g   W e C h a t   a p p   t o   f r o n t .   W h e n   u s e r   h a s   c l o s e d   W e C h a t   � � � l  U U�� � ���   � Q K app by clicking cross "x" on the upper left corner of WeChat window, using    � � � � �   a p p   b y   c l i c k i n g   c r o s s   " x "   o n   t h e   u p p e r   l e f t   c o r n e r   o f   W e C h a t   w i n d o w ,   u s i n g �  � � � l  U U�� � ���   � 2 , URL scheme does not reopen the app window.     � � � � X   U R L   s c h e m e   d o e s   n o t   r e o p e n   t h e   a p p   w i n d o w .   �  � � � r   U d � � � =  U ` � � � l  U ^ ����� � I  U ^�� ���
�� .corecnte****       **** � 2  U Z��
�� 
cwin��  ��  ��   � m   ^ _����   � o      ���� 0 needsreopen needsReopen �  � � � O   e  � � � k   i ~ � �  � � � Z  i x � ����� � o   i l���� 0 needsreopen needsReopen � I  o t������
�� .aevtrappnull��� ��� null��  ��  ��  ��   �  ��� � I  y ~������
�� .miscactvnull��� ��� null��  ��  ��   � m   e f � ��                                                                                      @ alis    N  Macintosh HD               Ζ�vH+  B5�
WeChat.app                                                     �[��}�        ����  	                Applications    Ζ�      �}n    B5�  %Macintosh HD:Applications: WeChat.app    
 W e C h a t . a p p    M a c i n t o s h   H D  Applications/WeChat.app   / ��   �  � � � l  � ���������  ��  ��   �  � � � Z  � � � ����� � o   � ����� (0 prefmenuinitstatus prefMenuInitStatus � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � ����� ��  ��  ��   �  � � � l  � ���������  ��  ��   �  ��� � I  � ��� ���
�� .sysoexecTEXT���     TEXT � l  � � ����� � b   � � � � � m   � � � � � � � 
 o p e n   � n   � � � � � 1   � ���
�� 
strq � l  � � ����� � b   � � � � � m   � � � � � � � " w e i x i n m a c : / / c h a t / � o   � ����� 
0 target  ��  ��  ��  ��  ��  ��   P 4   ! %�� �
�� 
prcs � m   # $ � � � � �  W e C h a t N m     � ��                                                                                  sevs  alis    �  Macintosh HD               Ζ�vH+  B5wSystem Events.app                                              FO��5�=        ����  	                CoreServices    Ζ�      �5"�    B5wB5kB5j  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��   2  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� *0 enabledguiscripting enabledGUIScripting �  ��� � o      ���� 0 flag  ��  ��   � k     � � �  � � � P      � ��� � r     � � � A     � � � n     � � � 1   
 ��
�� 
sisv � l   
 ����� � I   
������
�� .sysosigtsirr   ��� null��  ��  ��  ��   � m     � � � � �  1 0 . 9 � o      ���� *0 mountainlionorolder MountainLionOrOlder � ����
�� consnume��  ��   �  ��� � Z    � � ��� � � o    �� *0 mountainlionorolder MountainLionOrOlder � k    , � �  � � � l   �~�}�|�~  �}  �|   �  � � � l   �{ � ��{   ��� In OS X 10.8 Mountain Lion and older, enable GUI Scripting globally by calling this handler and passing 'true' in the flag parameter before your script executes any GUI Scripting commands, or pass 'false' to disable GUI Scripting. Authentication is required only if the value of the 'UI elements enabled' property will be changed. Returns the final setting of 'UI elements enabled' even if unchanged.    � � � �"   I n   O S   X   1 0 . 8   M o u n t a i n   L i o n   a n d   o l d e r ,   e n a b l e   G U I   S c r i p t i n g   g l o b a l l y   b y   c a l l i n g   t h i s   h a n d l e r   a n d   p a s s i n g   ' t r u e '   i n   t h e   f l a g   p a r a m e t e r   b e f o r e   y o u r   s c r i p t   e x e c u t e s   a n y   G U I   S c r i p t i n g   c o m m a n d s ,   o r   p a s s   ' f a l s e '   t o   d i s a b l e   G U I   S c r i p t i n g .   A u t h e n t i c a t i o n   i s   r e q u i r e d   o n l y   i f   t h e   v a l u e   o f   t h e   ' U I   e l e m e n t s   e n a b l e d '   p r o p e r t y   w i l l   b e   c h a n g e d .   R e t u r n s   t h e   f i n a l   s e t t i n g   o f   ' U I   e l e m e n t s   e n a b l e d '   e v e n   i f   u n c h a n g e d . �  � � � l   �z�y�x�z  �y  �x   �  ��w � O    , � � � k    + � �  � � � l    � � � � I   �v�u�t
�v .miscactvnull��� ��� null�u  �t   � : 4 brings System Events authentication dialog to front    � � � � h   b r i n g s   S y s t e m   E v e n t s   a u t h e n t i c a t i o n   d i a l o g   t o   f r o n t �  � � � r     % � � � o     !�s�s 0 flag   � 1   ! $�r
�r 
uien �  ��q � L   & + � � 1   & *�p
�p 
uien�q   � m     � ��                                                                                  sevs  alis    �  Macintosh HD               Ζ�vH+  B5wSystem Events.app                                              FO��5�=        ����  	                CoreServices    Ζ�      �5"�    B5wB5kB5j  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  �w  ��   � k   / � � �  � � � l  / /�o�n�m�o  �n  �m   �  � � � l  / /�l � ��l   �`Z In OS X 10.9 Mavericks and newer, global access is no longer available and GUI Scripting can only be enabled manually on a per-application basis. Pass true to present an alert with a button to open System Preferences and telling the user to select the current application (the application running the script) in the Accessibility list in the Security & Privacy preference's Privacy pane. Authentication is required to unlock the preference. Returns the current setting of 'UI elements enabled' asynchronously, without waiting for System Preferences to open, and tells the user to run the script again.    � � � ��   I n   O S   X   1 0 . 9   M a v e r i c k s   a n d   n e w e r ,   g l o b a l   a c c e s s   i s   n o   l o n g e r   a v a i l a b l e   a n d   G U I   S c r i p t i n g   c a n   o n l y   b e   e n a b l e d   m a n u a l l y   o n   a   p e r - a p p l i c a t i o n   b a s i s .   P a s s   t r u e   t o   p r e s e n t   a n   a l e r t   w i t h   a   b u t t o n   t o   o p e n   S y s t e m   P r e f e r e n c e s   a n d   t e l l i n g   t h e   u s e r   t o   s e l e c t   t h e   c u r r e n t   a p p l i c a t i o n   ( t h e   a p p l i c a t i o n   r u n n i n g   t h e   s c r i p t )   i n   t h e   A c c e s s i b i l i t y   l i s t   i n   t h e   S e c u r i t y   &   P r i v a c y   p r e f e r e n c e ' s   P r i v a c y   p a n e .   A u t h e n t i c a t i o n   i s   r e q u i r e d   t o   u n l o c k   t h e   p r e f e r e n c e .   R e t u r n s   t h e   c u r r e n t   s e t t i n g   o f   ' U I   e l e m e n t s   e n a b l e d '   a s y n c h r o n o u s l y ,   w i t h o u t   w a i t i n g   f o r   S y s t e m   P r e f e r e n c e s   t o   o p e n ,   a n d   t e l l s   t h e   u s e r   t o   r u n   t h e   s c r i p t   a g a i n . �  � � � l  / /�k�j�i�k  �j  �i   �  � � � l  / 9 � � � � O  / 9 �  � r   3 8 1   3 6�h
�h 
uien o      �g�g *0 guiscriptingenabled GUIScriptingEnabled  m   / 0�                                                                                  sevs  alis    �  Macintosh HD               Ζ�vH+  B5wSystem Events.app                                              FO��5�=        ����  	                CoreServices    Ζ�      �5"�    B5wB5kB5j  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   � 1 + read-only in OS X 10.9 Mavericks and newer    � � V   r e a d - o n l y   i n   O S   X   1 0 . 9   M a v e r i c k s   a n d   n e w e r �  Z   : ��f�e =  : =	
	 o   : ;�d�d 0 flag  
 m   ; <�c
�c boovtrue Z   @ ��b�a H   @ B o   @ A�`�` *0 guiscriptingenabled GUIScriptingEnabled k   E �  I  E J�_�^�]
�_ .miscactvnull��� ��� null�^  �]    r   K N m   K L �  A l f r e d   2 o      �\�\ 0 scriptrunner scriptRunner  r   O [ 4   O Y�[
�[ 
psxf l  Q X�Z�Y b   Q X I   Q V�X�W�V�X  0 getworkingpath getWorkingPath�W  �V   m   V W �   & / . . / a l f r e d I c o n . i c n s�Z  �Y   o      �U�U 0 iconfilepath iconFilePath !"! I  \ ��T#$
�T .sysodlogaskr        TEXT# b   \ a%&% b   \ _'(' m   \ ])) �** P A c c e s s i b i l i t y   a c c e s s   i s   n o t   e n a b l e d   f o r  ( o   ] ^�S�S 0 scriptrunner scriptRunner& m   _ `++ �,,  .$ �R-.
�R 
dtxt- b   b g/0/ b   b e121 m   b c33 �44$ W e C h a t   C a l l   n e e d s   y o u   t o   e n a b l e   A l f r e d   2 ' s   A c c e s s i b i l i t y   a c c e s s .   P l e a s e   o p e n   S y s t e m   P r e f e r e n c e s ,   u n l o c k   t h e   S e c u r i t y   &   P r i v a c y   p r e f e r e n c e ,   s e l e c t  2 o   c d�Q�Q 0 scriptrunner scriptRunner0 m   e f55 �66 �   i n   t h e   P r i v a c y   P a n e ' s   A c c e s s i b i l i t y   l i s t ,   a n d   t h e n   i n v o k e   y o u r   U n i   C a l l   c o m m a n d   a g a i n .. �P78
�P 
btns7 J   j r99 :;: m   j m<< �== . O p e n   S y s t e m   P r e f e r e n c e s; >�O> m   m p?? �@@  C a n c e l�O  8 �NAB
�N 
dfltA m   u xCC �DD  C a n c e lB �ME�L
�M 
dispE o   { |�K�K 0 iconfilepath iconFilePath�L  " F�JF Z   � �GH�I�HG =  � �IJI n   � �KLK 1   � ��G
�G 
bhitL 1   � ��F
�F 
rsltJ m   � �MM �NN . O p e n   S y s t e m   P r e f e r e n c e sH O   � �OPO k   � �QQ RSR O  � �TUT I  � ��EV�D
�E .miscmvisnull���     ****V 4   � ��CW
�C 
xppaW m   � �XX �YY * P r i v a c y _ A c c e s s i b i l i t y�D  U 5   � ��BZ�A
�B 
xppbZ m   � �[[ �\\ : c o m . a p p l e . p r e f e r e n c e . s e c u r i t y
�A kfrmID  S ]�@] I  � ��?�>�=
�? .miscactvnull��� ��� null�>  �=  �@  P m   � �^^�                                                                                  sprf  alis    ~  Macintosh HD               Ζ�vH+  B5�System Preferences.app                                         FV��A�V        ����  	                Applications    Ζ�      �A=�    B5�  1Macintosh HD:Applications: System Preferences.app   .  S y s t e m   P r e f e r e n c e s . a p p    M a c i n t o s h   H D  #Applications/System Preferences.app   / ��  �I  �H  �J  �b  �a  �f  �e   _�<_ L   � �`` o   � ��;�; *0 guiscriptingenabled GUIScriptingEnabled�<  ��   � aba l     �:�9�8�:  �9  �8  b cdc i    efe I      �7�6�5�7  0 getworkingpath getWorkingPath�6  �5  f k     +gg hih r     jkj 1     �4
�4 
txdlk o      �3�3 0 d  i lml r    non m    pp �qq  /o 1    
�2
�2 
txdlm rsr r    "tut b     vwv n   xyx 7   �1z{
�1 
ctxtz m    �0�0 { 4    �/|
�/ 
citm| m    �.�.��y l   }�-�,} n    ~~ 1    �+
�+ 
psxp l   ��*�)� I   �(��'
�( .earsffdralis        afdr�  f    �'  �*  �)  �-  �,  w m    �� ���  /u o      �&�& 0 p  s ��� r   # (��� o   # $�%�% 0 d  � 1   $ '�$
�$ 
txdl� ��� l  ) )�#�"�!�#  �"  �!  � �� � L   ) +�� o   ) *�� 0 p  �   d ��� l     ����  �  �  �       ���������������  � ���������
�	��
� .aevtoappnull  �   � ****� *0 enabledguiscripting enabledGUIScripting�  0 getworkingpath getWorkingPath� 
0 target  � 0 prefmenu prefMenu� (0 prefmenuinitstatus prefMenuInitStatus� 0 needsreopen needsReopen�  �
  �	  �  �  � � 4�����
� .aevtoappnull  �   � ****� 0 argv  �  � �� 0 argv  � �� �� K�� ��� ��������������� w���������� � ������ *0 enabledguiscripting enabledGUIScripting
�  
TEXT�� 
0 target  
�� .miscactvnull��� ��� null
�� 
prcs
�� 
mbar
�� 
mbri
�� 
menE
�� 
menI�� 0 prefmenu prefMenu
�� 
enaB�� (0 prefmenuinitstatus prefMenuInitStatus
�� .sysodelanull��� ��� nmbr
�� 
cwin
�� .corecnte****       ****�� 0 needsreopen needsReopen
�� .aevtrappnull��� ��� null
�� 
strq
�� .sysoexecTEXT���     TEXT� �*ek+   hY hO��&E�O�j O� �*��/ y*�k/�l/�k/�m/E�O��,eE�O h��,e �j [OY��O*a -j j E` O� _  
*j Y hO*j UO� 
lj Y hOa a �%a ,%j UU� �� ����������� *0 enabledguiscripting enabledGUIScripting�� ����� �  ���� 0 flag  ��  � ������������ 0 flag  �� *0 mountainlionorolder MountainLionOrOlder�� *0 guiscriptingenabled GUIScriptingEnabled�� 0 scriptrunner scriptRunner�� 0 iconfilepath iconFilePath� " ����� � ���������)+��35��<?��C����������M^��[����X��
�� .sysosigtsirr   ��� null
�� 
sisv
�� .miscactvnull��� ��� null
�� 
uien
�� 
psxf��  0 getworkingpath getWorkingPath
�� 
dtxt
�� 
btns
�� 
dflt
�� 
disp�� 
�� .sysodlogaskr        TEXT
�� 
rslt
�� 
bhit
�� 
xppb
�� kfrmID  
�� 
xppa
�� .miscmvisnull���     ****�� ��g *j �,�E�VO� � *j O�*�,FO*�,EUY �� *�,E�UO�e  �� }*j O�E�O*�*j+ 	�%/E�O�%�%��%�%a a a lva a a �a  O_ a ,a   -a  #*a a a 0 *a a  /j !UO*j UY hY hY hO�� ��f����������  0 getworkingpath getWorkingPath��  ��  � ������ 0 d  �� 0 p  � ��p�����������
�� 
txdl
�� .earsffdralis        afdr
�� 
psxp
�� 
ctxt
�� 
citm������ ,*�,E�O�*�,FO)j �,[�\[Zk\��/2�%E�O�*�,FO�� ���  g u i _ g u a n� �� ����� ����� ����� ������  ����
�� 
pcap� ���  W e C h a t
�� 
mbar�� 
�� 
mbri� ���  W e C h a t
�� 
menE� ���  W e C h a t
�� 
menI� ���  P r e f e r e n c e s &
� boovtrue
� boovfals�  �  �  �  �  ascr  ��ޭ
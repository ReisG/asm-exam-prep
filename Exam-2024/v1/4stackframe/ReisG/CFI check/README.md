[some material](https://lpc.events/event/7/contributions/729/attachments/496/903/CET-LPC-2020.pdf)

Это мои попытки разобраться, как это всё устроено. Вроде как для того, чтобы компилятор делал код с INTEL CET, нужно добавать флаг `-fcf-protection=full`. Но результаты для флага `-m32` и без него разняться

```
$ gcc -fcf-protection=full main.c -o main -m32
$ objdump -d -M intel main | less

main:     file format elf32-i386


Disassembly of section .init:

00001000 <_init>:
    1000:       53                      push   ebx
    1001:       83 ec 08                sub    esp,0x8
    1004:       e8 87 00 00 00          call   1090 <__x86.get_pc_thunk.bx>
    1009:       81 c3 cf 2f 00 00       add    ebx,0x2fcf
    100f:       8b 83 1c 00 00 00       mov    eax,DWORD PTR [ebx+0x1c]
    1015:       85 c0                   test   eax,eax
    1017:       74 02                   je     101b <_init+0x1b>
    1019:       ff d0                   call   eax
    101b:       83 c4 08                add    esp,0x8
    101e:       5b                      pop    ebx
    101f:       c3                      ret

Disassembly of section .plt:

00001020 <__libc_start_main@plt-0x10>:
    1020:       ff b3 04 00 00 00       push   DWORD PTR [ebx+0x4]
    1026:       ff a3 08 00 00 00       jmp    DWORD PTR [ebx+0x8]
    102c:       00 00                   add    BYTE PTR [eax],al
        ...

00001030 <__libc_start_main@plt>:
    1030:       ff a3 0c 00 00 00       jmp    DWORD PTR [ebx+0xc]
    1036:       68 00 00 00 00          push   0x0
    103b:       e9 e0 ff ff ff          jmp    1020 <_init+0x20>

00001040 <printf@plt>:
    1040:       ff a3 10 00 00 00       jmp    DWORD PTR [ebx+0x10]
    1046:       68 08 00 00 00          push   0x8
    104b:       e9 d0 ff ff ff          jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

00001050 <__cxa_finalize@plt>:
    1050:       ff a3 18 00 00 00       jmp    DWORD PTR [ebx+0x18]
    1056:       66 90                   xchg   ax,ax

Disassembly of section .text:

00001060 <_start>:
    1060:       31 ed                   xor    ebp,ebp
    1062:       5e                      pop    esi
    1063:       89 e1                   mov    ecx,esp
    1065:       83 e4 f0                and    esp,0xfffffff0
    1068:       50                      push   eax
    1069:       54                      push   esp
    106a:       52                      push   edx
    106b:       e8 18 00 00 00          call   1088 <_start+0x28>
    1070:       81 c3 68 2f 00 00       add    ebx,0x2f68
    1076:       6a 00                   push   0x0
    1078:       6a 00                   push   0x0
    107a:       51                      push   ecx
    107b:       56                      push   esi
    107c:       ff b3 20 00 00 00       push   DWORD PTR [ebx+0x20]
    1082:       e8 a9 ff ff ff          call   1030 <__libc_start_main@plt>
    1087:       f4                      hlt
    1088:       8b 1c 24                mov    ebx,DWORD PTR [esp]
    108b:       c3                      ret
    108c:       66 90                   xchg   ax,ax
    108e:       66 90                   xchg   ax,ax

00001090 <__x86.get_pc_thunk.bx>:
    1090:       8b 1c 24                mov    ebx,DWORD PTR [esp]
    1093:       c3                      ret
    1094:       66 90                   xchg   ax,ax
    1096:       66 90                   xchg   ax,ax
    1098:       66 90                   xchg   ax,ax
    109a:       66 90                   xchg   ax,ax
    109c:       66 90                   xchg   ax,ax
    109e:       66 90                   xchg   ax,ax

000010a0 <deregister_tm_clones>:
    10a0:       e8 e4 00 00 00          call   1189 <__x86.get_pc_thunk.dx>
    10a5:       81 c2 33 2f 00 00       add    edx,0x2f33
    10ab:       8d 8a 30 00 00 00       lea    ecx,[edx+0x30]
    10b1:       8d 82 30 00 00 00       lea    eax,[edx+0x30]
    10b7:       39 c8                   cmp    eax,ecx
    10b9:       74 1d                   je     10d8 <deregister_tm_clones+0x38>
    10bb:       8b 82 14 00 00 00       mov    eax,DWORD PTR [edx+0x14]
    10c1:       85 c0                   test   eax,eax
    10c3:       74 13                   je     10d8 <deregister_tm_clones+0x38>
    10c5:       55                      push   ebp
    10c6:       89 e5                   mov    ebp,esp
    10c8:       83 ec 14                sub    esp,0x14
    10cb:       51                      push   ecx
    10cc:       ff d0                   call   eax
    10ce:       83 c4 10                add    esp,0x10
    10d1:       c9                      leave
    10d2:       c3                      ret
    10d3:       2e 8d 74 26 00          lea    esi,cs:[esi+eiz*1+0x0]
    10d8:       c3                      ret
    10d9:       8d b4 26 00 00 00 00    lea    esi,[esi+eiz*1+0x0]

000010e0 <register_tm_clones>:
    10e0:       e8 a4 00 00 00          call   1189 <__x86.get_pc_thunk.dx>
    10e5:       81 c2 f3 2e 00 00       add    edx,0x2ef3
    10eb:       55                      push   ebp
    10ec:       89 e5                   mov    ebp,esp
    10ee:       53                      push   ebx
    10ef:       8d 8a 30 00 00 00       lea    ecx,[edx+0x30]
    10f5:       8d 82 30 00 00 00       lea    eax,[edx+0x30]
    10fb:       83 ec 04                sub    esp,0x4
    10fe:       29 c8                   sub    eax,ecx
    1100:       89 c3                   mov    ebx,eax
    1102:       c1 e8 1f                shr    eax,0x1f
    1105:       c1 fb 02                sar    ebx,0x2
    1108:       01 d8                   add    eax,ebx
    110a:       d1 f8                   sar    eax,1
    110c:       74 14                   je     1122 <register_tm_clones+0x42>
    110e:       8b 92 24 00 00 00       mov    edx,DWORD PTR [edx+0x24]
    1114:       85 d2                   test   edx,edx
    1116:       74 0a                   je     1122 <register_tm_clones+0x42>
    1118:       83 ec 08                sub    esp,0x8
    111b:       50                      push   eax
    111c:       51                      push   ecx
    111d:       ff d2                   call   edx
    111f:       83 c4 10                add    esp,0x10
    1122:       8b 5d fc                mov    ebx,DWORD PTR [ebp-0x4]
    1125:       c9                      leave
    1126:       c3                      ret
    1127:       2e 8d b4 26 00 00 00    lea    esi,cs:[esi+eiz*1+0x0]
    112e:       00 
    112f:       90                      nop

00001130 <__do_global_dtors_aux>:
    1130:       f3 0f 1e fb             endbr32
    1134:       55                      push   ebp
    1135:       89 e5                   mov    ebp,esp
    1137:       53                      push   ebx
    1138:       e8 53 ff ff ff          call   1090 <__x86.get_pc_thunk.bx>
    113d:       81 c3 9b 2e 00 00       add    ebx,0x2e9b
    1143:       83 ec 04                sub    esp,0x4
    1146:       80 bb 30 00 00 00 00    cmp    BYTE PTR [ebx+0x30],0x0
    114d:       75 27                   jne    1176 <__do_global_dtors_aux+0x46>
    114f:       8b 83 18 00 00 00       mov    eax,DWORD PTR [ebx+0x18]
    1155:       85 c0                   test   eax,eax
    1157:       74 11                   je     116a <__do_global_dtors_aux+0x3a>
    1159:       83 ec 0c                sub    esp,0xc
    115c:       ff b3 2c 00 00 00       push   DWORD PTR [ebx+0x2c]
    1162:       e8 e9 fe ff ff          call   1050 <__cxa_finalize@plt>
    1167:       83 c4 10                add    esp,0x10
    116a:       e8 31 ff ff ff          call   10a0 <deregister_tm_clones>
    116f:       c6 83 30 00 00 00 01    mov    BYTE PTR [ebx+0x30],0x1
    1176:       8b 5d fc                mov    ebx,DWORD PTR [ebp-0x4]
    1179:       c9                      leave
    117a:       c3                      ret
    117b:       2e 8d 74 26 00          lea    esi,cs:[esi+eiz*1+0x0]

00001180 <frame_dummy>:
    1180:       f3 0f 1e fb             endbr32
    1184:       e9 57 ff ff ff          jmp    10e0 <register_tm_clones>

00001189 <__x86.get_pc_thunk.dx>:
    1189:       8b 14 24                mov    edx,DWORD PTR [esp]
    118c:       c3                      ret

0000118d <sum>:
    118d:       f3 0f 1e fb             endbr32
    1191:       55                      push   ebp
    1192:       89 e5                   mov    ebp,esp
    1194:       e8 c7 00 00 00          call   1260 <__x86.get_pc_thunk.ax>
    1199:       05 3f 2e 00 00          add    eax,0x2e3f
    119e:       8b 55 08                mov    edx,DWORD PTR [ebp+0x8]
    11a1:       8b 45 0c                mov    eax,DWORD PTR [ebp+0xc]
    11a4:       01 d0                   add    eax,edx
    11a6:       5d                      pop    ebp
    11a7:       c3                      ret

000011a8 <dbl>:
    11a8:       f3 0f 1e fb             endbr32
    11ac:       55                      push   ebp
    11ad:       89 e5                   mov    ebp,esp
    11af:       e8 ac 00 00 00          call   1260 <__x86.get_pc_thunk.ax>
    11b4:       05 24 2e 00 00          add    eax,0x2e24
    11b9:       8b 45 08                mov    eax,DWORD PTR [ebp+0x8]
    11bc:       01 c0                   add    eax,eax
    11be:       5d                      pop    ebp
    11bf:       c3                      ret

000011c0 <call_fn>:
    11c0:       f3 0f 1e fb             endbr32
    11c4:       55                      push   ebp
    11c5:       89 e5                   mov    ebp,esp
    11c7:       53                      push   ebx
    11c8:       83 ec 04                sub    esp,0x4
    11cb:       e8 c0 fe ff ff          call   1090 <__x86.get_pc_thunk.bx>
    11d0:       81 c3 08 2e 00 00       add    ebx,0x2e08
    11d6:       83 ec 0c                sub    esp,0xc
    11d9:       6a 2a                   push   0x2a
    11db:       8b 45 08                mov    eax,DWORD PTR [ebp+0x8]
    11de:       ff d0                   call   eax
    11e0:       83 c4 10                add    esp,0x10
    11e3:       83 ec 08                sub    esp,0x8
    11e6:       50                      push   eax
    11e7:       8d 83 30 e0 ff ff       lea    eax,[ebx-0x1fd0]
    11ed:       50                      push   eax
    11ee:       e8 4d fe ff ff          call   1040 <printf@plt>
    11f3:       83 c4 10                add    esp,0x10
    11f6:       90                      nop
    11f7:       8b 5d fc                mov    ebx,DWORD PTR [ebp-0x4]
    11fa:       c9                      leave
    11fb:       c3                      ret

000011fc <erase_type>:
    11fc:       f3 0f 1e fb             endbr32
    1200:       55                      push   ebp
    1201:       89 e5                   mov    ebp,esp
    1203:       83 ec 08                sub    esp,0x8
    1206:       e8 55 00 00 00          call   1260 <__x86.get_pc_thunk.ax>
    120b:       05 cd 2d 00 00          add    eax,0x2dcd
    1210:       8b 45 08                mov    eax,DWORD PTR [ebp+0x8]
    1213:       83 ec 0c                sub    esp,0xc
    1216:       50                      push   eax
    1217:       e8 a4 ff ff ff          call   11c0 <call_fn>
    121c:       83 c4 10                add    esp,0x10
    121f:       90                      nop
    1220:       c9                      leave
    1221:       c3                      ret

00001222 <main>:
    1222:       f3 0f 1e fb             endbr32
    1226:       8d 4c 24 04             lea    ecx,[esp+0x4]
    122a:       83 e4 f0                and    esp,0xfffffff0
    122d:       ff 71 fc                push   DWORD PTR [ecx-0x4]
    1230:       55                      push   ebp
    1231:       89 e5                   mov    ebp,esp
    1233:       51                      push   ecx
    1234:       83 ec 04                sub    esp,0x4
    1237:       e8 24 00 00 00          call   1260 <__x86.get_pc_thunk.ax>
    123c:       05 9c 2d 00 00          add    eax,0x2d9c
    1241:       83 ec 0c                sub    esp,0xc
    1244:       8d 80 b5 d1 ff ff       lea    eax,[eax-0x2e4b]
    124a:       50                      push   eax
    124b:       e8 ac ff ff ff          call   11fc <erase_type>
    1250:       83 c4 10                add    esp,0x10
    1253:       b8 00 00 00 00          mov    eax,0x0
    1258:       8b 4d fc                mov    ecx,DWORD PTR [ebp-0x4]
    125b:       c9                      leave
    125c:       8d 61 fc                lea    esp,[ecx-0x4]
    125f:       c3                      ret

00001260 <__x86.get_pc_thunk.ax>:
    1260:       8b 04 24                mov    eax,DWORD PTR [esp]
    1263:       c3                      ret

Disassembly of section .fini:

00001264 <_fini>:
    1264:       53                      push   ebx
    1265:       83 ec 08                sub    esp,0x8
    1268:       e8 23 fe ff ff          call   1090 <__x86.get_pc_thunk.bx>
    126d:       81 c3 6b 2d 00 00       add    ebx,0x2d6b
    1273:       83 c4 08                add    esp,0x8
    1276:       5b                      pop    ebx
    1277:       c3                      ret
```

Для x64
```
$ gcc -fcf-protection=full main.c -o main
$ objdump -d -M intel main | less

main:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:       f3 0f 1e fa             endbr64
    1004:       48 83 ec 08             sub    rsp,0x8
    1008:       48 8b 05 d9 2f 00 00    mov    rax,QWORD PTR [rip+0x2fd9]        # 3fe8 <__gmon_start__@Base>
    100f:       48 85 c0                test   rax,rax
    1012:       74 02                   je     1016 <_init+0x16>
    1014:       ff d0                   call   rax
    1016:       48 83 c4 08             add    rsp,0x8
    101a:       c3                      ret

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:       ff 35 9a 2f 00 00       push   QWORD PTR [rip+0x2f9a]        # 3fc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:       ff 25 9c 2f 00 00       jmp    QWORD PTR [rip+0x2f9c]        # 3fc8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:       0f 1f 40 00             nop    DWORD PTR [rax+0x0]
    1030:       f3 0f 1e fa             endbr64
    1034:       68 00 00 00 00          push   0x0
    1039:       e9 e2 ff ff ff          jmp    1020 <_init+0x20>
    103e:       66 90                   xchg   ax,ax

Disassembly of section .plt.got:

0000000000001040 <__cxa_finalize@plt>:
    1040:       f3 0f 1e fa             endbr64
    1044:       ff 25 ae 2f 00 00       jmp    QWORD PTR [rip+0x2fae]        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    104a:       66 0f 1f 44 00 00       nop    WORD PTR [rax+rax*1+0x0]

Disassembly of section .plt.sec:

0000000000001050 <printf@plt>:
    1050:       f3 0f 1e fa             endbr64
    1054:       ff 25 76 2f 00 00       jmp    QWORD PTR [rip+0x2f76]        # 3fd0 <printf@GLIBC_2.2.5>
    105a:       66 0f 1f 44 00 00       nop    WORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

0000000000001060 <_start>:
    1060:       f3 0f 1e fa             endbr64
    1064:       31 ed                   xor    ebp,ebp
    1066:       49 89 d1                mov    r9,rdx
    1069:       5e                      pop    rsi
    106a:       48 89 e2                mov    rdx,rsp
    106d:       48 83 e4 f0             and    rsp,0xfffffffffffffff0
    1071:       50                      push   rax
    1072:       54                      push   rsp
    1073:       45 31 c0                xor    r8d,r8d
    1076:       31 c9                   xor    ecx,ecx
    1078:       48 8d 3d 47 01 00 00    lea    rdi,[rip+0x147]        # 11c6 <main>
    107f:       ff 15 53 2f 00 00       call   QWORD PTR [rip+0x2f53]        # 3fd8 <__libc_start_main@GLIBC_2.34>
    1085:       f4                      hlt
    1086:       66 2e 0f 1f 84 00 00    cs nop WORD PTR [rax+rax*1+0x0]
    108d:       00 00 00 

0000000000001090 <deregister_tm_clones>:
    1090:       48 8d 3d 79 2f 00 00    lea    rdi,[rip+0x2f79]        # 4010 <__TMC_END__>
    1097:       48 8d 05 72 2f 00 00    lea    rax,[rip+0x2f72]        # 4010 <__TMC_END__>
    109e:       48 39 f8                cmp    rax,rdi
    10a1:       74 15                   je     10b8 <deregister_tm_clones+0x28>
    10a3:       48 8b 05 36 2f 00 00    mov    rax,QWORD PTR [rip+0x2f36]        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    10aa:       48 85 c0                test   rax,rax
    10ad:       74 09                   je     10b8 <deregister_tm_clones+0x28>
    10af:       ff e0                   jmp    rax
    10b1:       0f 1f 80 00 00 00 00    nop    DWORD PTR [rax+0x0]
    10b8:       c3                      ret
    10b9:       0f 1f 80 00 00 00 00    nop    DWORD PTR [rax+0x0]

00000000000010c0 <register_tm_clones>:
    10c0:       48 8d 3d 49 2f 00 00    lea    rdi,[rip+0x2f49]        # 4010 <__TMC_END__>
    10c7:       48 8d 35 42 2f 00 00    lea    rsi,[rip+0x2f42]        # 4010 <__TMC_END__>
    10ce:       48 29 fe                sub    rsi,rdi
    10d1:       48 89 f0                mov    rax,rsi
    10d4:       48 c1 ee 3f             shr    rsi,0x3f
    10d8:       48 c1 f8 03             sar    rax,0x3
    10dc:       48 01 c6                add    rsi,rax
    10df:       48 d1 fe                sar    rsi,1
    10e2:       74 14                   je     10f8 <register_tm_clones+0x38>
    10e4:       48 8b 05 05 2f 00 00    mov    rax,QWORD PTR [rip+0x2f05]        # 3ff0 <_ITM_registerTMCloneTable@Base>
    10eb:       48 85 c0                test   rax,rax
    10ee:       74 08                   je     10f8 <register_tm_clones+0x38>
    10f0:       ff e0                   jmp    rax
    10f2:       66 0f 1f 44 00 00       nop    WORD PTR [rax+rax*1+0x0]
    10f8:       c3                      ret
    10f9:       0f 1f 80 00 00 00 00    nop    DWORD PTR [rax+0x0]

0000000000001100 <__do_global_dtors_aux>:
    1100:       f3 0f 1e fa             endbr64
    1104:       80 3d 05 2f 00 00 00    cmp    BYTE PTR [rip+0x2f05],0x0        # 4010 <__TMC_END__>
    110b:       75 2b                   jne    1138 <__do_global_dtors_aux+0x38>
    110d:       55                      push   rbp
    110e:       48 83 3d e2 2e 00 00    cmp    QWORD PTR [rip+0x2ee2],0x0        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1115:       00 
    1116:       48 89 e5                mov    rbp,rsp
    1119:       74 0c                   je     1127 <__do_global_dtors_aux+0x27>
    111b:       48 8b 3d e6 2e 00 00    mov    rdi,QWORD PTR [rip+0x2ee6]        # 4008 <__dso_handle>
    1122:       e8 19 ff ff ff          call   1040 <__cxa_finalize@plt>
    1127:       e8 64 ff ff ff          call   1090 <deregister_tm_clones>
    112c:       c6 05 dd 2e 00 00 01    mov    BYTE PTR [rip+0x2edd],0x1        # 4010 <__TMC_END__>
    1133:       5d                      pop    rbp
    1134:       c3                      ret
    1135:       0f 1f 00                nop    DWORD PTR [rax]
    1138:       c3                      ret
    1139:       0f 1f 80 00 00 00 00    nop    DWORD PTR [rax+0x0]

0000000000001140 <frame_dummy>:
    1140:       f3 0f 1e fa             endbr64
    1144:       e9 77 ff ff ff          jmp    10c0 <register_tm_clones>

0000000000001149 <sum>:
    1149:       f3 0f 1e fa             endbr64
    114d:       55                      push   rbp
    114e:       48 89 e5                mov    rbp,rsp
    1151:       89 7d fc                mov    DWORD PTR [rbp-0x4],edi
    1154:       89 75 f8                mov    DWORD PTR [rbp-0x8],esi
    1157:       8b 55 fc                mov    edx,DWORD PTR [rbp-0x4]
    115a:       8b 45 f8                mov    eax,DWORD PTR [rbp-0x8]
    115d:       01 d0                   add    eax,edx
    115f:       5d                      pop    rbp
    1160:       c3                      ret

0000000000001161 <dbl>:
    1161:       f3 0f 1e fa             endbr64
    1165:       55                      push   rbp
    1166:       48 89 e5                mov    rbp,rsp
    1169:       89 7d fc                mov    DWORD PTR [rbp-0x4],edi
    116c:       8b 45 fc                mov    eax,DWORD PTR [rbp-0x4]
    116f:       01 c0                   add    eax,eax
    1171:       5d                      pop    rbp
    1172:       c3                      ret

0000000000001173 <call_fn>:
    1173:       f3 0f 1e fa             endbr64
    1177:       55                      push   rbp
    1178:       48 89 e5                mov    rbp,rsp
    117b:       48 83 ec 10             sub    rsp,0x10
    117f:       48 89 7d f8             mov    QWORD PTR [rbp-0x8],rdi
    1183:       48 8b 45 f8             mov    rax,QWORD PTR [rbp-0x8]
    1187:       bf 2a 00 00 00          mov    edi,0x2a
    118c:       ff d0                   call   rax
    118e:       89 c6                   mov    esi,eax
    1190:       48 8d 05 6d 0e 00 00    lea    rax,[rip+0xe6d]        # 2004 <_IO_stdin_used+0x4>
    1197:       48 89 c7                mov    rdi,rax
    119a:       b8 00 00 00 00          mov    eax,0x0
    119f:       e8 ac fe ff ff          call   1050 <printf@plt>
    11a4:       90                      nop
    11a5:       c9                      leave
    11a6:       c3                      ret

00000000000011a7 <erase_type>:
    11a7:       f3 0f 1e fa             endbr64
    11ab:       55                      push   rbp
    11ac:       48 89 e5                mov    rbp,rsp
    11af:       48 83 ec 10             sub    rsp,0x10
    11b3:       48 89 7d f8             mov    QWORD PTR [rbp-0x8],rdi
    11b7:       48 8b 45 f8             mov    rax,QWORD PTR [rbp-0x8]
    11bb:       48 89 c7                mov    rdi,rax
    11be:       e8 b0 ff ff ff          call   1173 <call_fn>
    11c3:       90                      nop
    11c4:       c9                      leave
    11c5:       c3                      ret

00000000000011c6 <main>:
    11c6:       f3 0f 1e fa             endbr64
    11ca:       55                      push   rbp
    11cb:       48 89 e5                mov    rbp,rsp
    11ce:       48 8d 05 74 ff ff ff    lea    rax,[rip+0xffffffffffffff74]        # 1149 <sum>
    11d5:       48 89 c7                mov    rdi,rax
    11d8:       e8 ca ff ff ff          call   11a7 <erase_type>
    11dd:       b8 00 00 00 00          mov    eax,0x0
    11e2:       5d                      pop    rbp
    11e3:       c3                      ret

Disassembly of section .fini:

00000000000011e4 <_fini>:
    11e4:       f3 0f 1e fa             endbr64
    11e8:       48 83 ec 08             sub    rsp,0x8
    11ec:       48 83 c4 08             add    rsp,0x8
    11f0:       c3                      ret
```

Дальнейший анализ я проводить пока не буду ввиду нехватки времени.
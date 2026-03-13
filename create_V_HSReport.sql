SELECT * FROM V_HSReport WHERE applyno IN {reportNo}

-- 插入数据
INSERT INTO dbo.V_HSReport
(tjh, Accno, PatientId, registerDate, patientName, PatientSex, PatientAge, CardNo, PatientBirthday, Modality, ExamName, nameEng, patientSource, OutpatientId, InpatientId, ExamDate, Examdesc, ExamResult, TechnicianDR, ReportDr, VerifyDr, ReportDate, VerifyDate, ReportDrSign, VerifyDrSign, pdffile)
VALUES
(
    '2600461',
    'C26569357',
    '20261231175',
    '2026-01-05 16:29:26.000',
    N'张焕珍',
    N'女',
    '57.00岁',
    '2600461',
    '1968-12-17 00:00:00.000',
    'US',
    N'心脏超声',
    'zhang huan zhen',
    N'住院',
    NULL,
    '2600461',
    '2026-01-06 15:48:15.000',
    N'名称  测值mm  标准  名称  测值mm  标准  二尖瓣频谱  三尖瓣频谱  主动瓣频谱  主动脉根部内径  21  21-36  升主动脉内径  23  22-38  E峰流速0.63m/s         (-)  流速1.49m/s    左房前后径  33  23-36  右房左右径  37  30-40  室间隔厚度  8  <11  左房左右径  38  30-40  A峰流速1.07m/s    肺动脉流速1.30m/s    左室舒张末内径  48  36-54  左房上下径  48  35-50  左室后壁厚度  9  <11  主肺动脉径  20  14-28   SV:59 ml  EDV:110 ml      HR:78bpm     CO:4.6l/min     EF  53.7%  >50%  FS  28%  >25%                            各房室内径正常。左室壁及室间隔厚度正常，运动幅度正常。      各瓣膜形态正常，启闭尚可。CDFI:主动脉瓣口未见明显返流；二尖瓣口及三尖瓣口显示少许返流。房间隔、室间隔回声连续。升主动脉内径正常，腔内未及异常回声。肺动脉内径正常，血流速度，频谱形态正常。      二尖瓣血流频谱E峰＜A峰。      心包腔内未及液性暗区。',
    N'二尖瓣口及三尖瓣口少许返流        左心室收缩功能正常          左心室舒张功能减低',
    N'王彦萍',
    N'张勇',
    N'张勇',
    '2026-01-12 09:43:00.000',
    '2026-01-12 09:43:17.670',
    0x424DFA17000000000000360400002800000059000000370000000100080000000000C413000004100000,
    0x424DFA17000000000000360400002800000059000000370000000100080000000000C413000004100000,
    NULL
)
GO

-- 验证
SELECT * FROM dbo.V_HSReport
GO
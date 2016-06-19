Quantitative Evaluation of Temporal Regularizers in Compressed Sensing Dynamic Contrast Enhanced MRI of the Breast

##How to use this package?

####1. Install Matlab
The CS reconstructions in the paper used the software **Matlab**. Please install Matlab [here](http://www.mathworks.com/products/matlab/index.html?s_tid=gn_loc_drop). The version we used in the paper is R2015b.
We recommend using R2015b or above. Using former versions may cause warnings or errors.

####2. Install julia
The DCE analysis in the paper used the software **Julia**. Julia is a completely free software that looks like Matlab, but runs much fater. In particular, for the problem of DCE MRI, Julia's simple and flexible parallel computing model allows almost perfect parallelization of the nonlinear least squares fitting problem.

Please install Julia [here](http://julialang.org/). The version we used in the paper is v0.4.3. We recommend using v0.4.2 or above. Using former versions may cause warnings or errors.

####3. Install DCEMRI.jl
**DCEMRI.jl** is a fast, validated open source toolkit for dynamic contrast enhanced MRI analysis. In the paper, we used DCEMRI.jl toolkit to do the DCE analysis. The installation of the toolkit is very simple and the tuturial is [here](https://github.com/davidssmith/DCEMRI.jl#as-a-shell-command).

####4. Specify the path in julia.m
Before running the demo, you need to specify the julia path in the **julia.m** file depending on what operating system you are using and where you install your julia. Here is an example of the path:

For MacOS, the Matlab code is

``julia_path = '/Applications/Julia-0.4.2.app/Contents/Resources/julia/bin/julia';``

For Linux, the Matlab code is 

``julia_path = '/home/dss/git/julia/julia';``

For Windows, the Matlab code is 

``julia_path = 'C:\windows\julia\bin\julia';``

####5. Running the demo
After intalling the softwares and specifying the julia path, you are ready to run the demo. Congratulations!
The m-file you should run is **rundemo.m**. Here are some paremeters you can initialize and the numbers are by default:

- mask_num = 200; % Number of generated masks
- width = 10; % Central window width
- accel = 8; % Acceleration factor
- pick = [1 3 4 5 6 7]; % Mode selected

Here is an output of rundemo (mask_num = 1, width = 10, accel = 8, and pick = [1 3 4 5 6 7])
```
>> rundemo
running models
adding 4 workers
WARNING: `require` is deprecated, use `using` or `import` instead
 in depwarn at deprecated.jl:73
 [inlined code] from deprecated.jl:694
 in require at no file:0
 in fitdata at /Users/wangdong/.julia/v0.4/DCEMRI/src/science.jl:172
 in include at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in include_from_node1 at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in process_options at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in _start at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
while loading /Users/wangdong/Documents/MATLAB/qetsr/src/dcerun_ori.jl, in expression starting on line 3
WARNING: replacing module DCEMRI
found multi-flip data
fitting R1 relaxation rate to multi-flip data
fitting 12 x 2966 points on each of 4 workers
processed 11863 voxels in 5.1 s (2305.2 vox/s)

computing signal enhancement ratios
converting DCE signal to effective R1
converting effective R1 to tracer tissue concentration Ct
fitting DCE data
attempting Standard Tofts-Kety model
fitting 105 x 1202 points on each of 4 workers
processed 4810 voxels in 15.4 s (312.6 vox/s)

saving results to ../out/dce_ori_out.mat
Running 1th mask
Zerofill
ser=15.0693
running models
adding 4 workers
WARNING: `require` is deprecated, use `using` or `import` instead
 in depwarn at deprecated.jl:73
 [inlined code] from deprecated.jl:694
 in require at no file:0
 in fitdata at /Users/wangdong/.julia/v0.4/DCEMRI/src/science.jl:172
 in include at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in include_from_node1 at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in process_options at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in _start at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
while loading /Users/wangdong/Documents/MATLAB/qetsr/src/dcerun.jl, in expression starting on line 3
WARNING: replacing module DCEMRI
found multi-flip data
fitting R1 relaxation rate to multi-flip data
fitting 12 x 2966 points on each of 4 workers
processed 11863 voxels in 4.7 s (2519.4 vox/s)

computing signal enhancement ratios
converting DCE signal to effective R1
converting effective R1 to tracer tissue concentration Ct
fitting DCE data
attempting Standard Tofts-Kety model
fitting 105 x 778 points on each of 4 workers
processed 3112 voxels in 11.1 s (279.8 vox/s)

saving results to ../out/dce_Zero Filled_out.mat

ans =

     0

Running 1th mask
Run FT reconstruction
iter=1,rate=0.051194,ser=15.426
iter=2,rate=0.0231787,ser=16.0235
iter=3,rate=0.020051,ser=16.6223
iter=4,rate=0.0176988,ser=17.2293
iter=5,rate=0.0158996,ser=17.8486
iter=6,rate=0.0144887,ser=18.4839
iter=7,rate=0.0133487,ser=19.1371
iter=8,rate=0.0124371,ser=19.8077
iter=9,rate=0.0117261,ser=20.4926
iter=10,rate=0.0111345,ser=21.1857
iter=11,rate=0.0105974,ser=21.8776
iter=12,rate=0.0100647,ser=22.5546
iter=13,rate=0.00949801,ser=23.1998
iter=14,rate=0.00887696,ser=23.7945
iter=15,rate=0.00819908,ser=24.3219
iter=16,rate=0.00748001,ser=24.771
iter=17,rate=0.00675293,ser=25.1384
iter=18,rate=0.00605124,ser=25.429
iter=19,rate=0.00540095,ser=25.6532
iter=20,rate=0.00481888,ser=25.8236
iter=21,rate=0.00430984,ser=25.9524
iter=22,rate=0.00387807,ser=26.0501
iter=23,rate=0.00351208,ser=26.1249
iter=24,rate=0.00320677,ser=26.1824
iter=25,rate=0.00295216,ser=26.2268
iter=26,rate=0.00273604,ser=26.2608
iter=27,rate=0.0025479,ser=26.2865
iter=28,rate=0.00238268,ser=26.3053
iter=29,rate=0.00223816,ser=26.3183
iter=30,rate=0.00210683,ser=26.3266
iter=31,rate=0.00198734,ser=26.3312
iter=32,rate=0.00187863,ser=26.3326
iter=33,rate=0.00178076,ser=26.3315
iter=34,rate=0.00169218,ser=26.3284
iter=35,rate=0.00160748,ser=26.3238
ser=26.3238
running models
adding 4 workers
WARNING: `require` is deprecated, use `using` or `import` instead
 in depwarn at deprecated.jl:73
 [inlined code] from deprecated.jl:694
 in require at no file:0
 in fitdata at /Users/wangdong/.julia/v0.4/DCEMRI/src/science.jl:172
 in include at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in include_from_node1 at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in process_options at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in _start at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
while loading /Users/wangdong/Documents/MATLAB/qetsr/src/dcerun.jl, in expression starting on line 3
WARNING: replacing module DCEMRI
found multi-flip data
fitting R1 relaxation rate to multi-flip data
fitting 12 x 2966 points on each of 4 workers
processed 11863 voxels in 4.9 s (2429.6 vox/s)

computing signal enhancement ratios
converting DCE signal to effective R1
converting effective R1 to tracer tissue concentration Ct
fitting DCE data
attempting Standard Tofts-Kety model
fitting 105 x 190 points on each of 4 workers
processed 758 voxels in 2.7 s (278.4 vox/s)

saving results to ../out/dce_FT_out.mat

ans =

     0

Running 1th mask
Run WT reconstruction
iter=1,rate=0.0545535,ser=15.4535
iter=2,rate=0.0247228,ser=16.0587
iter=3,rate=0.021333,ser=16.6263
iter=4,rate=0.0186713,ser=17.153
iter=5,rate=0.0164212,ser=17.6342
iter=6,rate=0.0145357,ser=18.0667
iter=7,rate=0.0128744,ser=18.4484
iter=8,rate=0.0113896,ser=18.7797
iter=9,rate=0.0100057,ser=19.0639
iter=10,rate=0.00875153,ser=19.3065
iter=11,rate=0.007651,ser=19.5139
iter=12,rate=0.0067387,ser=19.6929
iter=13,rate=0.00602744,ser=19.8497
iter=14,rate=0.00548923,ser=19.9893
iter=15,rate=0.00507683,ser=20.1156
iter=16,rate=0.00474425,ser=20.2317
iter=17,rate=0.00446358,ser=20.3394
iter=18,rate=0.00421731,ser=20.4403
iter=19,rate=0.00399743,ser=20.5353
iter=20,rate=0.00380231,ser=20.625
iter=21,rate=0.00362777,ser=20.7095
iter=22,rate=0.00347207,ser=20.7893
iter=23,rate=0.00333219,ser=20.8644
iter=24,rate=0.00320512,ser=20.9349
iter=25,rate=0.00308835,ser=21.0011
iter=26,rate=0.00297983,ser=21.063
iter=27,rate=0.00287729,ser=21.1207
iter=28,rate=0.00277973,ser=21.1746
iter=29,rate=0.00268519,ser=21.2247
iter=30,rate=0.00259341,ser=21.2713
iter=31,rate=0.00250391,ser=21.3145
iter=32,rate=0.00241661,ser=21.3545
iter=33,rate=0.00233115,ser=21.3914
iter=34,rate=0.00224707,ser=21.4254
iter=35,rate=0.00216501,ser=21.4568
iter=36,rate=0.00208498,ser=21.4856
iter=37,rate=0.00200745,ser=21.512
iter=38,rate=0.00193201,ser=21.5362
iter=39,rate=0.00185941,ser=21.5583
iter=40,rate=0.00178831,ser=21.5784
iter=41,rate=0.00172008,ser=21.5969
iter=42,rate=0.00165371,ser=21.6137
iter=43,rate=0.00158992,ser=21.629
iter=44,rate=0.00152894,ser=21.6431
iter=45,rate=0.00147067,ser=21.6559
iter=46,rate=0.00141501,ser=21.6677
iter=47,rate=0.00136196,ser=21.6785
iter=48,rate=0.00131201,ser=21.6884
iter=49,rate=0.00126519,ser=21.6976
iter=50,rate=0.00122251,ser=21.706
iter=51,rate=0.00118063,ser=21.7138
iter=52,rate=0.00114133,ser=21.7211
iter=53,rate=0.001106,ser=21.7278
iter=54,rate=0.00107229,ser=21.7341
iter=55,rate=0.00104135,ser=21.7399
iter=56,rate=0.00101374,ser=21.7453
ser=21.7503
running models
adding 4 workers
WARNING: `require` is deprecated, use `using` or `import` instead
 in depwarn at deprecated.jl:73
 [inlined code] from deprecated.jl:694
 in require at no file:0
 in fitdata at /Users/wangdong/.julia/v0.4/DCEMRI/src/science.jl:172
 in include at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in include_from_node1 at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in process_options at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in _start at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
while loading /Users/wangdong/Documents/MATLAB/qetsr/src/dcerun.jl, in expression starting on line 3
WARNING: replacing module DCEMRI
found multi-flip data
fitting R1 relaxation rate to multi-flip data
fitting 12 x 2966 points on each of 4 workers
processed 11863 voxels in 4.9 s (2443.6 vox/s)

computing signal enhancement ratios
converting DCE signal to effective R1
converting effective R1 to tracer tissue concentration Ct
fitting DCE data
attempting Standard Tofts-Kety model
fitting 105 x 370 points on each of 4 workers
processed 1478 voxels in 2.7 s (549.9 vox/s)

saving results to ../out/dce_WT_out.mat

ans =

     0

Running 1th mask
Run TV reconstruction
iter=1,rate=0.0495861,ser=15.3958
iter=2,rate=0.0230234,ser=15.9256
iter=3,rate=0.0197927,ser=16.4294
iter=4,rate=0.0173785,ser=16.915
iter=5,rate=0.0154201,ser=17.3863
iter=6,rate=0.0138308,ser=17.8444
iter=7,rate=0.012425,ser=18.2906
iter=8,rate=0.0112638,ser=18.7251
iter=9,rate=0.0102721,ser=19.1474
iter=10,rate=0.00940399,ser=19.5578
iter=11,rate=0.0086466,ser=19.956
iter=12,rate=0.00800813,ser=20.3418
iter=13,rate=0.00742561,ser=20.7154
iter=14,rate=0.00691996,ser=21.0764
iter=15,rate=0.00647833,ser=21.4249
iter=16,rate=0.00607446,ser=21.7609
iter=17,rate=0.00572213,ser=22.0843
iter=18,rate=0.00541037,ser=22.3958
iter=19,rate=0.00510062,ser=22.695
iter=20,rate=0.00484941,ser=22.9822
iter=21,rate=0.00461747,ser=23.2575
iter=22,rate=0.00439133,ser=23.5209
iter=23,rate=0.00418064,ser=23.7727
iter=24,rate=0.00398409,ser=24.0127
iter=25,rate=0.00381489,ser=24.2413
iter=26,rate=0.00365506,ser=24.4588
iter=27,rate=0.00351185,ser=24.6652
iter=28,rate=0.00337076,ser=24.8608
iter=29,rate=0.00323815,ser=25.0461
iter=30,rate=0.00311103,ser=25.2211
iter=31,rate=0.0030023,ser=25.3863
iter=32,rate=0.00289229,ser=25.542
iter=33,rate=0.00279604,ser=25.6884
iter=34,rate=0.00269815,ser=25.8259
iter=35,rate=0.00260837,ser=25.9549
iter=36,rate=0.00251998,ser=26.0757
iter=37,rate=0.00242239,ser=26.1887
iter=38,rate=0.00235766,ser=26.2942
iter=39,rate=0.00228509,ser=26.3928
iter=40,rate=0.00221447,ser=26.4846
iter=41,rate=0.00215502,ser=26.5701
iter=42,rate=0.00209641,ser=26.6499
iter=43,rate=0.00204191,ser=26.724
iter=44,rate=0.00199077,ser=26.7929
iter=45,rate=0.00193904,ser=26.8568
iter=46,rate=0.00188053,ser=26.916
iter=47,rate=0.00183535,ser=26.9708
iter=48,rate=0.00179656,ser=27.0216
iter=49,rate=0.00174882,ser=27.0686
iter=50,rate=0.00169375,ser=27.112
iter=51,rate=0.00165399,ser=27.1521
iter=52,rate=0.00160861,ser=27.189
iter=53,rate=0.00159398,ser=27.2232
iter=54,rate=0.00156016,ser=27.2549
iter=55,rate=0.00152876,ser=27.2842
iter=56,rate=0.00147955,ser=27.3112
iter=57,rate=0.00146278,ser=27.336
iter=58,rate=0.0014366,ser=27.359
iter=59,rate=0.00140784,ser=27.3803
iter=60,rate=0.00138538,ser=27.4
iter=61,rate=0.00137422,ser=27.4182
iter=62,rate=0.00134309,ser=27.4351
iter=63,rate=0.00131068,ser=27.4507
iter=64,rate=0.00129991,ser=27.4652
iter=65,rate=0.00128822,ser=27.4788
iter=66,rate=0.0012661,ser=27.4915
iter=67,rate=0.00124749,ser=27.5033
iter=68,rate=0.00122638,ser=27.5142
iter=69,rate=0.00121168,ser=27.5245
iter=70,rate=0.00119166,ser=27.5341
iter=71,rate=0.00116591,ser=27.5431
iter=72,rate=0.00116299,ser=27.5516
iter=73,rate=0.00115203,ser=27.5597
iter=74,rate=0.00113098,ser=27.5674
iter=75,rate=0.00113954,ser=27.5747
iter=76,rate=0.0011265,ser=27.5817
iter=77,rate=0.00112172,ser=27.5883
iter=78,rate=0.00112238,ser=27.5948
iter=79,rate=0.0010982,ser=27.601
iter=80,rate=0.00107242,ser=27.6068
iter=81,rate=0.00107111,ser=27.6123
iter=82,rate=0.00106109,ser=27.6177
iter=83,rate=0.00105783,ser=27.623
iter=84,rate=0.00104345,ser=27.628
iter=85,rate=0.00103202,ser=27.6329
iter=86,rate=0.00103295,ser=27.6375
iter=87,rate=0.00102295,ser=27.642
iter=88,rate=0.00102163,ser=27.6463
iter=89,rate=0.00101618,ser=27.6506
iter=90,rate=0.00100492,ser=27.6547
ser=27.6587
running models
adding 4 workers
WARNING: `require` is deprecated, use `using` or `import` instead
 in depwarn at deprecated.jl:73
 [inlined code] from deprecated.jl:694
 in require at no file:0
 in fitdata at /Users/wangdong/.julia/v0.4/DCEMRI/src/science.jl:172
 in include at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in include_from_node1 at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in process_options at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in _start at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
while loading /Users/wangdong/Documents/MATLAB/qetsr/src/dcerun.jl, in expression starting on line 3
WARNING: replacing module DCEMRI
found multi-flip data
fitting R1 relaxation rate to multi-flip data
fitting 12 x 2966 points on each of 4 workers
processed 11863 voxels in 5.2 s (2286.1 vox/s)

computing signal enhancement ratios
converting DCE signal to effective R1
converting effective R1 to tracer tissue concentration Ct
fitting DCE data
attempting Standard Tofts-Kety model
fitting 105 x 506 points on each of 4 workers
processed 2022 voxels in 3.0 s (670.8 vox/s)

saving results to ../out/dce_TV_out.mat

ans =

     0

Running 1th mask
Run TGV reconstruction
iter=1,rate=0.0495065,ser=15.3941
iter=2,rate=0.0230204,ser=15.9202
iter=3,rate=0.0197847,ser=16.4195
iter=4,rate=0.0173659,ser=16.9
iter=5,rate=0.0153884,ser=17.3659
iter=6,rate=0.0137908,ser=17.8184
iter=7,rate=0.0124034,ser=18.2589
iter=8,rate=0.0112471,ser=18.6878
iter=9,rate=0.0102606,ser=19.105
iter=10,rate=0.00938372,ser=19.5105
iter=11,rate=0.00864712,ser=19.9041
iter=12,rate=0.00800276,ser=20.2858
iter=13,rate=0.00742869,ser=20.6555
iter=14,rate=0.00692785,ser=21.0131
iter=15,rate=0.00648097,ser=21.3585
iter=16,rate=0.00608038,ser=21.6918
iter=17,rate=0.00572961,ser=22.0132
iter=18,rate=0.00541936,ser=22.3226
iter=19,rate=0.00511085,ser=22.6202
iter=20,rate=0.0048556,ser=22.9061
iter=21,rate=0.00462859,ser=23.1803
iter=22,rate=0.00441425,ser=23.4433
iter=23,rate=0.00419256,ser=23.6947
iter=24,rate=0.00399862,ser=23.9348
iter=25,rate=0.00382742,ser=24.1639
iter=26,rate=0.00367615,ser=24.382
iter=27,rate=0.00353147,ser=24.5894
iter=28,rate=0.0033866,ser=24.7864
iter=29,rate=0.00325101,ser=24.9732
iter=30,rate=0.00313591,ser=25.15
iter=31,rate=0.00301129,ser=25.3172
iter=32,rate=0.00290068,ser=25.4749
iter=33,rate=0.00280877,ser=25.6233
iter=34,rate=0.00271452,ser=25.7632
iter=35,rate=0.00262078,ser=25.8945
iter=36,rate=0.00253459,ser=26.0178
iter=37,rate=0.00244938,ser=26.1333
iter=38,rate=0.0023732,ser=26.2414
iter=39,rate=0.00230829,ser=26.3424
iter=40,rate=0.0022469,ser=26.4368
iter=41,rate=0.00217121,ser=26.5249
iter=42,rate=0.00212069,ser=26.6071
iter=43,rate=0.00205086,ser=26.6836
iter=44,rate=0.0020038,ser=26.7548
iter=45,rate=0.00194549,ser=26.8211
iter=46,rate=0.00189712,ser=26.8825
iter=47,rate=0.00184957,ser=26.9395
iter=48,rate=0.00180661,ser=26.9923
iter=49,rate=0.00176417,ser=27.0413
iter=50,rate=0.00171764,ser=27.0867
iter=51,rate=0.00167273,ser=27.1286
iter=52,rate=0.00163571,ser=27.1675
iter=53,rate=0.001606,ser=27.2034
iter=54,rate=0.00157211,ser=27.2367
iter=55,rate=0.00154553,ser=27.2674
iter=56,rate=0.00151845,ser=27.2959
iter=57,rate=0.00148038,ser=27.3223
iter=58,rate=0.00145092,ser=27.3466
iter=59,rate=0.00142685,ser=27.3691
iter=60,rate=0.00140857,ser=27.39
iter=61,rate=0.00138161,ser=27.4093
iter=62,rate=0.00135479,ser=27.4271
iter=63,rate=0.00132275,ser=27.4437
iter=64,rate=0.00131224,ser=27.459
iter=65,rate=0.00129438,ser=27.4732
iter=66,rate=0.00127354,ser=27.4864
iter=67,rate=0.00126796,ser=27.4988
iter=68,rate=0.00123912,ser=27.5104
iter=69,rate=0.00123186,ser=27.5212
iter=70,rate=0.00121817,ser=27.5314
iter=71,rate=0.00119012,ser=27.541
iter=72,rate=0.00117959,ser=27.55
iter=73,rate=0.00116346,ser=27.5585
iter=74,rate=0.00115348,ser=27.5665
iter=75,rate=0.00113772,ser=27.5741
iter=76,rate=0.00113106,ser=27.5813
iter=77,rate=0.00111857,ser=27.5882
iter=78,rate=0.00111454,ser=27.5948
iter=79,rate=0.00109767,ser=27.6012
iter=80,rate=0.0010851,ser=27.6073
iter=81,rate=0.00108332,ser=27.6132
iter=82,rate=0.00107094,ser=27.6188
iter=83,rate=0.00106039,ser=27.6243
iter=84,rate=0.00105451,ser=27.6295
iter=85,rate=0.00104654,ser=27.6346
iter=86,rate=0.00104636,ser=27.6395
iter=87,rate=0.00105357,ser=27.6442
iter=88,rate=0.00104238,ser=27.6489
iter=89,rate=0.00102356,ser=27.6534
iter=90,rate=0.00102216,ser=27.6576
iter=91,rate=0.00102247,ser=27.6618
iter=92,rate=0.00100688,ser=27.6658
ser=27.6697
running models
adding 4 workers
WARNING: `require` is deprecated, use `using` or `import` instead
 in depwarn at deprecated.jl:73
 [inlined code] from deprecated.jl:694
 in require at no file:0
 in fitdata at /Users/wangdong/.julia/v0.4/DCEMRI/src/science.jl:172
 in include at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in include_from_node1 at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in process_options at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in _start at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
while loading /Users/wangdong/Documents/MATLAB/qetsr/src/dcerun.jl, in expression starting on line 3
WARNING: replacing module DCEMRI
found multi-flip data
fitting R1 relaxation rate to multi-flip data
fitting 12 x 2966 points on each of 4 workers
processed 11863 voxels in 4.8 s (2488.9 vox/s)

computing signal enhancement ratios
converting DCE signal to effective R1
converting effective R1 to tracer tissue concentration Ct
fitting DCE data
attempting Standard Tofts-Kety model
fitting 105 x 508 points on each of 4 workers
processed 2031 voxels in 2.9 s (707.1 vox/s)

saving results to ../out/dce_TGV_out.mat

ans =

     0

Running 1th mask
Run NN reconstruction
iter=1,rate=0.04892,ser=15.3697
iter=2,rate=0.0226862,ser=15.8679
iter=3,rate=0.0191944,ser=16.3396
iter=4,rate=0.0164409,ser=16.7971
iter=5,rate=0.0143442,ser=17.251
iter=6,rate=0.0126363,ser=17.7097
iter=7,rate=0.0114087,ser=18.1807
iter=8,rate=0.0105017,ser=18.6696
iter=9,rate=0.00989657,ser=19.1817
iter=10,rate=0.00947924,ser=19.7215
iter=11,rate=0.0091827,ser=20.2923
iter=12,rate=0.00897685,ser=20.897
iter=13,rate=0.0088108,ser=21.5371
iter=14,rate=0.00865783,ser=22.2125
iter=15,rate=0.00849655,ser=22.9212
iter=16,rate=0.00831356,ser=23.6586
iter=17,rate=0.00809715,ser=24.4163
iter=18,rate=0.00784818,ser=25.181
iter=19,rate=0.00755813,ser=25.9348
iter=20,rate=0.00723046,ser=26.6542
iter=21,rate=0.00686123,ser=27.3113
iter=22,rate=0.00644499,ser=27.8783
iter=23,rate=0.00597821,ser=28.3326
iter=24,rate=0.00546706,ser=28.6643
iter=25,rate=0.0049237,ser=28.8791
iter=26,rate=0.00434927,ser=28.9966
iter=27,rate=0.00378729,ser=29.0436
iter=28,rate=0.00327475,ser=29.0472
iter=29,rate=0.0028171,ser=29.0302
iter=30,rate=0.00242393,ser=29.0083
iter=31,rate=0.00210669,ser=28.9909
iter=32,rate=0.00187424,ser=28.9827
iter=33,rate=0.00171534,ser=28.9844
iter=34,rate=0.00162579,ser=28.9943
iter=35,rate=0.00158957,ser=29.0098
iter=36,rate=0.00158271,ser=29.0276
iter=37,rate=0.00158946,ser=29.0448
iter=38,rate=0.00159256,ser=29.0591
iter=39,rate=0.0015849,ser=29.0689
iter=40,rate=0.00156349,ser=29.0738
ser=29.0738
running models
adding 4 workers
WARNING: `require` is deprecated, use `using` or `import` instead
 in depwarn at deprecated.jl:73
 [inlined code] from deprecated.jl:694
 in require at no file:0
 in fitdata at /Users/wangdong/.julia/v0.4/DCEMRI/src/science.jl:172
 in include at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in include_from_node1 at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in process_options at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
 in _start at /Applications/Julia-0.4.2.app/Contents/Resources/julia/lib/julia/sys.dylib
while loading /Users/wangdong/Documents/MATLAB/qetsr/src/dcerun.jl, in expression starting on line 3
WARNING: replacing module DCEMRI
found multi-flip data
fitting R1 relaxation rate to multi-flip data
fitting 12 x 2966 points on each of 4 workers
processed 11863 voxels in 4.7 s (2530.5 vox/s)

computing signal enhancement ratios
converting DCE signal to effective R1
converting effective R1 to tracer tissue concentration Ct
fitting DCE data
attempting Standard Tofts-Kety model
fitting 105 x 393 points on each of 4 workers
processed 1571 voxels in 5.5 s (285.8 vox/s)

saving results to ../out/dce_NN_out.mat

ans =

     0

```
All experiments were run on a dual Xeon E5-2665 2.40 GHz workstation with 20 GB of RAM with MATLAB 2015b (Mathworks, Natick, MA) and Julia 0.4.3. It takes about 1 day to run the demo by default.

##Funding Resource
Financial support from NCI/NIH K25 CA176219, NCI/NIH U01 CA142565, and the National Nature Science Foundation of China (Grants 91330101 and 11531005). TEY is the W.A. “Tex” Moncrief Professor of Computational Oncology and is a CPRIT Scholar in Cancer Research.

function autoFmaskBatch()
global filepath_work;
% This can automatically find all Landsats 4-8 and Sentinel-2 images
% (folder) and to process them one by one.

    fprintf('Fmask 4.0 batch starts ...\n');
    filepath_work = pwd; % CD to the path; or, type in the path of your working directory here.
    [~, ~, paths, ~] = CheckImagesPath(filepath_work);
    delete(gcp('nocreate'))
    parpool(3)
    parfor i=1: length(paths)
%         cd(paths{i});
        fprintf('At %s.\n',paths{i});
        autoFmask('path_data', paths{i}, 'filepath_work', filepath_work);% 4.0
    end
end

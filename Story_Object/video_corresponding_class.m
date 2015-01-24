
%% Expects an Map where Keys are ImageNet classes and Values are the videos in which they are appearing.
function video_corresponding_class(classes)
	imagenet_classes = keys(classes);
	for i = 1:size(classes,1)
		fid = fopen(fullfile('Inverted_Index',strcat('Class','_',num2str(i),'.txt')),'w');
		video_index = classes(imagenet_classes{i});
		for j = 1:size(video_index,2)
			fprintf(fid,'%s\n',strcat('vid',num2str(video_index(j)),'.webm'));
		end
		fclose(fid);
	end
end

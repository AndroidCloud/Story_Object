%% Input is a map between 'class_name' -> 'videos_in_which_that_class_is_appearing' and the id of the class you want to have

function [frequency,class_id] = find_co_occuring_classes(classes,class_name)
	fid = fopen(fullfile('./Inverted_Index',strcat('Class_',num2str(class_name),'.txt')),'rt');
	tmp = textscan(fid, '%s');
	fclose(fid);
	class_name	
	num_vid = size(tmp{1},1);
	number_of_classes = size(classes,1);
	intersection_frequency = zeros(number_of_classes,1);
	for i = 1:number_of_classes
			fid = fopen(fullfile('./Inverted_Index',strcat('Class_',num2str(i),'.txt')),'rt');
			tmp_id = textscan(fid, '%s');
			fclose(fid);
			common =  intersect(tmp_id{1} , tmp{1});
			intersection_frequency(i) = size(common,1);
	end
	[frequency,class_id]= sort(intersection_frequency,'descend');
	frequency = frequency(2:size(frequency,1));
	class_id = class_id(2:size(class_id,1));
	classes_name =  keys(classes);
%	fid = fopen(fullfile('./Clique_1_frequency',strcat('Clique_Class_frequency_',num2str(class_name),'.txt')),'w');
	fid = fopen(fullfile('./Clique_1',strcat('Clique_Class_',num2str(class_name),'.txt')),'w');
%	i = 1;
%	while 1	
	for i = 1:20
		if frequency(i) >= 0
			fprintf(fid,'%s %d\n',classes_name{class_id(i)},frequency(i));
		end
	end
	fclose(fid);
end 

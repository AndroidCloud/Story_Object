function [classes_map,new_classes_map] = find_maximal_clique(classes)

	 for i=1:999
                fid = fopen(fullfile('./Clique_1',strcat('Clique_Class_',num2str(i),'.txt')),'rt');
                tmp_id = textscan(fid, '%d');   
                i   
                fclose(fid);
                a = containers.Map;
                b = tmp_id{1}(:);    
                key = ''; 
                for j = 1:size(b,1)
                        if i~= b(j)
                                if (i > b(j))
                                        key = strcat(num2str(b(j)),'+',num2str(i));
                                else
                                        key =  strcat(num2str(i),'+',num2str(b(j)));
                                end    
                                index = b(j);   
                                value = b(b~=index);
                                a(key) = value;
                        end 
                end 
                save(fullfile('CliqueMap',strcat('Class_',num2str(i),'.mat')),'a');    
        end 

	%%map stage
	'Mapping Done'	
	classes_map = containers.Map;
	new_classes_map = containers.Map;
	%% shuffle stage
	for i=1:999
		 load(fullfile('./CliqueMap',strcat('Class_',num2str(i),'.mat')));
		 key = keys(a);
		 vals = values(a);
		%i
		for k = 1:size(key, 2)
			[classes_map,new_classes_map] = insert_class(classes_map,key{k},vals{k},new_classes_map);
		end
	end
%	 write_cliques(new_classes_map,classes);	
end
function [classes_map,new_classes_map] = insert_class(classes_map,st,val,new_classes_map)

  	if  isKey(classes_map,st)
		st;
		val = intersect(val,classes_map(st));
		%% reduce stage
        	classes_map(st) = intersect(val,classes_map(st));
		new_classes_map(st) = val
	else
                classes_map(st) = val;
        end

end

	



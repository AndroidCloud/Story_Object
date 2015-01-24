function write_cliques(new_classes_map,classes)
	
	name_classes = keys(classes);
	key = keys(new_classes_map);
	val = values(new_classes_map);
	fid = fopen('Write_Clique_Name.txt','w');
	fid2 = fopen('Write_Clique_id.txt','w');
	for i = 1:size(val,2)
		e = strsplit(key{i},'+');
		if(size(val{i},1) ~= 0)
			if(size(val{i},2) ~= 0)
				v = val{i};
			%size(val{i})
			        for k = 1:size(v,1)
				    fprintf(fid,'%s || %s || %s\n',name_classes{str2num(e{1})},name_classes{str2num(e{2})},name_classes{v(k)});
				    fprintf(fid2,'%d || %d || %d\n',str2num(e{1}),str2num(e{2}),v(k));
				end
			end
		end
	end		  			
	fclose(fid);		
	fclose(fid2);		
				

end

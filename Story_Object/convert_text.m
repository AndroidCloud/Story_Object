function convert_text
        classes = Containers.Map;	
	for i=1:599
		try
	%	fid = fopen(fullfile('./TEXT',strcat('vid',num2str(i),'.txt')),'w');
		%i
		%classes_map_vid298.mat
		load(fullfile('./Histograms/',strcat('classes_map_vid',num2str(i),'.mat')));
        %		load 'Histograms/classes_map_vid1.mat';
		a = keys(classes_map);
		b = values(classes_map);
		for j=1:size(a,2)
			fprintf(fid,'%s %d\n',a{j},b{j});
		end
		fclose(fid);
		catch
			i
		end
	end
end
function classes_map = insert_class(classes_map,st,i)

  if  isKey(classes_map,st)
                classes_map(st) = classes_map(st) + 1;
        else
                 classes_map(st) = 1;
        end

end

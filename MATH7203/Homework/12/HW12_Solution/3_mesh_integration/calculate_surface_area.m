function area = calculate_surface_area(filename)

% Reading in the STL file describing the 3D geometric object
S = stlread(filename);

% Getting the triangle and vertex arrays
pts = S.Points;
tris = S.ConnectivityList;

% Plotting the object using trisurf() to verify it was read in correctly
figure, trisurf(tris, pts(:,1), pts(:,2), pts(:,3));

% Looping over all the triangles and compute their area
total_area = 0;
for i = 1:size(tris,1)
    p1 = pts(tris(i,1),:);
    p2 = pts(tris(i,2),:);
    p3 = pts(tris(i,3),:);
    
    u = p2 - p1;
    v = p3 - p1;
    
    A = 0.5 * norm(cross(u,v));
   
    total_area = total_area + A;
end

% Returning the total surface area of the object
area = total_area;

end

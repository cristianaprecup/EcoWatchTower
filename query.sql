SELECT 
    obs.ObservationID,
    obs.Timestamp,
    obs.Notes,
    usr.Username AS User,
    spc.SpeciesName,
    loc.LocationName
FROM 
    Observation obs
JOIN 
    User usr ON obs.UserID = usr.UserID
JOIN 
    Species spc ON obs.SpeciesID = spc.SpeciesID
JOIN 
    Location loc ON obs.LocationID = loc.LocationID
WHERE 
    EXTRACT(MONTH FROM obs.Timestamp) = 1
ORDER BY 
    obs.Timestamp DESC;




SELECT 
    obs.ObservationID,
    obs.Timestamp,
    obs.Notes,
    usr.Username AS User,
    spc.SpeciesName,
    loc.LocationName,
    w.Temperature,
    w.Humidity,
    w.WindSpeed
FROM 
    Observation obs
JOIN 
    User usr ON obs.UserID = usr.UserID
JOIN 
    Species spc ON obs.SpeciesID = spc.SpeciesID
JOIN 
    Location loc ON obs.LocationID = loc.LocationID
JOIN 
    Weather w ON obs.LocationID = w.LocationID AND obs.Timestamp = w.Timestamp
WHERE 
    MONTH(obs.Timestamp) = 1
ORDER BY 
    obs.Timestamp DESC;



SELECT 
    usr.Username,
    r.RoleName,
    p.PermissionName
FROM 
    User usr
JOIN 
    UserRole ur ON usr.UserID = ur.UserID
JOIN 
    Role r ON ur.RoleID = r.RoleID
JOIN 
    UserPermission up ON usr.UserID = up.UserID
JOIN 
    Permission p ON up.PermissionID = p.PermissionID
WHERE 
    usr.UserID = 1;




SELECT 
    rp.ProjectName,
    CONCAT(rs.FirstName, ' ', rs.LastName) AS Researcher,
    loc.LocationName
FROM 
    ResearchProject rp
JOIN 
    Researcher rs ON rp.ResearcherID = rs.ResearcherID
JOIN 
    ProjectLocation pl ON rp.ProjectID = pl.ProjectID
JOIN 
    Location loc ON pl.LocationID = loc.LocationID
ORDER BY 
    rp.ProjectName;



SELECT
  R.FirstName,
  R.LastName,
  RP.ProjectName,
  RP.Description,
  PA.AreaName AS ProtectedArea,
  PA.Regulations
FROM
  Researcher R
JOIN
  ResearchProject RP ON R.ResearcherID = RP.ResearcherID
JOIN
  ProjectLocation PL ON RP.ProjectID = PL.ProjectID
JOIN
  ProtectedAreas PA ON PL.LocationID = PA.LocationID;




SELECT
  U.UserID,
  U.Username,
  R.RoleName,
  P.PermissionName
FROM
  User U
LEFT JOIN
  UserRole UR ON U.UserID = UR.UserID
LEFT JOIN
  Role R ON UR.RoleID = R.RoleID
LEFT JOIN
  UserPermission UP ON U.UserID = UP.UserID
LEFT JOIN
  Permission P ON UP.PermissionID = P.PermissionID;

local connectedJson = importstr './connected.json';
local parsedConnectedJson = std.parseJson(connectedJson);

local overridesJson = importstr './overrides.json';
local parsedOverridesJson = std.parseJson(overridesJson);

{
  basics: parsedConnectedJson.basics + parsedOverridesJson.basics ,
  work: [
            ({
              company: w.company,
              position: w.position,
              website: w.website,
              location: w.location,
              summary: w.summary,
              isCurrentRole: w.isCurrentRole,
              startDate: w.startDate,
              start: w.start,
              highlights: w.highlights
            } + (if !w.isCurrentRole then {
                  endDate: w.endDate,
                  end: w.end,
                 } else {}
            )) for w in parsedConnectedJson.work
        ],
  volunteer: parsedConnectedJson.volunteer,
  education: parsedConnectedJson.education,
  awards: parsedConnectedJson.awards,
  publications: parsedConnectedJson.publications,
  skills: parsedOverridesJson.skills,
  languages: parsedConnectedJson.languages + parsedOverridesJson.languages,
  interests: parsedConnectedJson.interests + parsedOverridesJson.interests,
  references: parsedConnectedJson.references + parsedOverridesJson.references
}

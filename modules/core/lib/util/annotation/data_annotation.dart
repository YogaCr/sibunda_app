class _StaticData {
  const _StaticData();
}
/// Mark methods (usually of repos) that the data they return is probably static.
/// It means the probability of data to change is so small.
/// So it seems the methods marked by this [staticData] are dummy although the repos are real.
const staticData = _StaticData();

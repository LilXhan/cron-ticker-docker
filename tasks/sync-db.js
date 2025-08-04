let times = 0;

const syncDB = () => {
  times++;
  console.log('Tick every multiple 5: ', times);
  return times;
}

module.exports = {
  syncDB
};
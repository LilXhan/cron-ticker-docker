const { syncDB } = require('../../tasks/sync-db')

describe('Test in Sync-DB', () => {
  test('should execute the proccess 2 times:', () => {
    syncDB();
    const times = syncDB();
    expect(times).toBe(2);
  })
})
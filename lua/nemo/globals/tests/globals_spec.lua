local fn = G.fn

describe('testing reduce:', function ()
  local callback = function (total, value)
      return total + value
    end

  it('when `list` empty and `start` not `nil` then `start`', function ()
    local list = {}
    local start = 5
    local expected = start
    local got = fn.reduce(list, callback, start)
    assert.are.equal(expected, got)
  end)

  it('when `list` not empty and `start` not `nil` when OK', function ()
    local list = {1, 2, 3}
    local start = 5
    local expected = 11
    local got = fn.reduce(list, callback, start)
    assert.are.equal(expected, got)
  end)
end)

describe('testing map:', function ()
  local callback = function (value)
    return value * 2
  end

  it('when `list` is empty then `empty`', function ()
    local list = {}
    local expected = {}
    local got = fn.map(list, callback)
    assert.are.same(expected, got)
  end)

  it('when `list` is not empty then OK', function ()
    local list = {1, 2, 3}
    local expected = {2, 4, 6}
    local got = fn.map(list, callback)
    assert.are.same(expected, got)
  end)
end)

describe('testing forEach:', function ()
end)

describe('testing filter:', function ()
  local callback = function (value)
    return value % 2 == 0
  end

  it('when `list` is empty then `empty`', function ()
    local list = {}
    local expected = {}
    local got = fn.filter(list, callback)
    assert.are.same(expected, got)
  end)

  it('when `list` is not empty then OK', function ()
    local list = {1, 2, 3, 4}
    local expected = {2, 4}
    local got = fn.filter(list, callback)
    assert.are.same(expected, got)
  end)
end)

describe('testing zip:', function ()
  it('when `list1` and `list2` empty then `empty`', function ()
    local list1 = {}
    local list2 = {}
    local expected = {}
    local got = fn.zip(list1, list2)
    assert.are.same(expected, got)
  end)

  it('when `list1` or `list2` empty then `empty`', function ()
    local list1 = {1, 2, 3}
    local list2 = {}
    local expected = {}
    local got = fn.zip(list1, list2)
    assert.are.same(expected, got)
  end)

  it('when `len(list1)` == `len(list2)` then OK', function ()
    local list1 = {1, 2, 3}
    local list2 = {4, 5, 6}
    local expected = {
      {1, 4},
      {2, 5},
      {3, 6}
    }
    local got = fn.zip(list1, list2)
    assert.are.same(expected, got)
  end)

  it('when `len(list1)` > `len(list2)` then OK', function ()
    local list1 = {1, 2, 3, 4}
    local list2 = {4, 5, 6}
    local expected = {
      {1, 4},
      {2, 5},
      {3, 6}
    }
    local got = fn.zip(list1, list2)
    assert.are.same(expected, got)
  end)

  it('when `len(list1)` < `len(list2)` then OK', function ()
    local list1 = {1, 2 }
    local list2 = {4, 5, 6}
    local expected = {
      {1, 4},
      {2, 5},
    }
    local got = fn.zip(list1, list2)
    assert.are.same(expected, got)
  end)
end)


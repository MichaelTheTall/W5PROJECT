require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      # db = PG.connect({dbname: 'project_shop', host: 'localhost'})
      db = PG.connect({
        dbname: 'dbhrt4ki2270c',
        host: 'ec2-54-235-86-226.compute-1.amazonaws.com',
        port: 5432,
        user: 'mjwwokhiwuilrk',
        password: 'efe26a9e3a13012053d39ad4d1d82cb3feeab2e26bf1359a5a01853c8d217006'
        })
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end

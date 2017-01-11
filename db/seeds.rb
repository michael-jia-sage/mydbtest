# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@connection = ActiveRecord::Base.connection()

# randomly generate 10K customers
for i in 1..100000
  CustomerId = 7000000000 + i
  Employees = ['0', '1 - 5', '6 - 10', '11 - 20', '21 - 49', '50 - 99', '100 - 199', '200 - 499'].sample
  TwoYearSpend = ['Range 1', 'Range 2', 'Range 3', 'Range 4', 'Range 5'].sample
  CarePlan = ['Plan 1', 'Plan 2', 'Plan 3', 'Plan 4'].sample
  strSql = "INSERT INTO `mydbtest_development`.`customers` (CustomerId, Employees, TwoYearSpend, CarePlan) VALUES ('#{CustomerId}', '#{Employees}', '#{TwoYearSpend}', '#{CarePlan}');"
  connection.execute(strSql)
end

# for each customer, randomly create usage records
@usageTypes = %w(Window Report FinancialStatement Task Menu CustomReport Help AdvisorLaunchpad)
@dateYMs = ['201401', '201402', '201403', '201404', '201405', '201406', '201407', '201408', '201409', '201410', '201411', '201412']
           #['201501', '201502', '201503', '201504', '201505', '201506', '201507', '201508', '201509', '201510', '201511', '201512']
           #['201601', '201602', '201603', '201604', '201605', '201606', '201607', '201608', '201609', '201610', '201611', '201612']

for @DateYM in @dateYMs
  @customers = (7000000001..7000100000).to_a.shuffle
  for @CustomerId in @customers
    for j in 1..rand(1..90)
      @UsageType = @usageTypes.sample
      @Duration = @UsageType == 'Window' ? rand(0..1000) : 0
      @strSql = "INSERT INTO `mydbtest_development`.`usages` (CustomerId, DateYM, UsageType, HitCount, Duration)
                VALUES ('#{@CustomerId}', '#{@DateYM}',
                '#{@UsageType}',
                '#{rand(0..100)}',
                '#{@Duration}');"
      @connection.execute(@strSql)
    end
  end
end
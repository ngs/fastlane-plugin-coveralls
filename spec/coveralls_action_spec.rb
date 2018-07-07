require 'xccoveralls/runner'

describe Fastlane::Actions::CoverallsAction do
  describe '#run' do
    it 'Runs command' do
      params = {
        repo_token: 'asdf',
        derived_data_path: "your/custom/DerivedData",
        source_path: "your/src",
        ignorefile_path: "your/src/.coverallsignore"
      }
      fake_runner = 'runner'
      expect(fake_runner).to receive(:run!)
      expect(Xccoveralls::Runner).to receive(:new).with(params).and_return(fake_runner)

      Fastlane::Actions::CoverallsAction.run(params)
    end
  end
end

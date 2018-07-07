require 'xccoveralls/runner'
require 'xccoveralls/options'

describe Fastlane::Actions::CoverallsAction do
  describe '#run' do
    it 'Runs command' do
      params = {
        repo_token: 'asdf',
        derived_data_path: ".",
        source_path: ".",
        ignorefile_path: nil
      }
      expect(FastlaneCore::Helper).to receive(:mac?).and_return(true)
      opts = described_class.available_options
      config = FastlaneCore::Configuration.create(opts, params)
      fake_runner = 'runner'
      expect(fake_runner).to receive(:run!)
      expect(Xccoveralls::Runner).to receive(:new).with(params).and_return(fake_runner)

      Fastlane::Actions::CoverallsAction.run(config)
    end
  end
end

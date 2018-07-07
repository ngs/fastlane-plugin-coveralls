describe Fastlane::Actions::CoverallsAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The coveralls plugin is working!")

      Fastlane::Actions::CoverallsAction.run(nil)
    end
  end
end

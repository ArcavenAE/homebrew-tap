class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261016.211418.30e4f54"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-211418-30e4f54/marvel-darwin-arm64"
    sha256 "86ed068102631435fbbc8c83a4179a93f997490ccacffc423efcee0341a12ef3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-211418-30e4f54/marvel-darwin-amd64"
    sha256 "7dbc4f9ef8ce42a7a7b661f3c27fa65402d0bdc697020766faf14f3cbe404612"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-211418-30e4f54/marvel-linux-arm64"
    sha256 "f6f53e4cb6853f131aacb3fc2badfa81b329bc2701cdb2785d8e46c0ce59f4ae"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-211418-30e4f54/marvel-linux-amd64"
    sha256 "4b06af67e71580e68adb7b060069491c766667903441fa9c161de806feff232a"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end

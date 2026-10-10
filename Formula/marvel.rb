class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261010.134544.563f901"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-134544-563f901/marvel-darwin-arm64"
    sha256 "375e9abb8a55a3d4e8cf3bb55e0e3980b9faa62afaf6673fd077c43a4d92e015"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-134544-563f901/marvel-darwin-amd64"
    sha256 "3dcc14b1aac341c028bb211b4c21c9163920243b4dac13bdabe4e65f1eac1aab"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-134544-563f901/marvel-linux-arm64"
    sha256 "c6b81f9b4aa091b5ee59590059851f869b2192d45db609e35d5125bb27fca2cd"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-134544-563f901/marvel-linux-amd64"
    sha256 "8786043c03f7db9a834224e1f9910c0517d2533f86120808b49a2921980e8c64"
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

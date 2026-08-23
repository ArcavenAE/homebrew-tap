class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260823.204734.5c7a6d2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260823-204734-5c7a6d2/marvel-darwin-arm64"
    sha256 "90c4bd45de2075093ef98e1b1328bb5b463ec9fccf56082f143602c60ef9aa0e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260823-204734-5c7a6d2/marvel-darwin-amd64"
    sha256 "e2d5e352739e17a9fec5890f865fdf2405ff19b9bea4e2c8d4069979ea818c19"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260823-204734-5c7a6d2/marvel-linux-arm64"
    sha256 "2475a31f65f9d9087891663e50c944d035fddeee89279d2416a169365dc2cec2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260823-204734-5c7a6d2/marvel-linux-amd64"
    sha256 "8e0d4670831b1dd2b289f882fb49eff89d5a31191cd233e0c529813b6340f97f"
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

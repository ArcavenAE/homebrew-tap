class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.024835.b003cd3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-024835-b003cd3/marvel-darwin-arm64"
    sha256 "aba21ae3940c210ff23780483d053ec2836922805d6a3f27ab59d245ed99fba7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-024835-b003cd3/marvel-darwin-amd64"
    sha256 "bdab38b3319fbf733a31a4174b8c3f8da9d697ac9106063aded5c968e0e66858"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-024835-b003cd3/marvel-linux-arm64"
    sha256 "574a8305a83e48099a5959fac19db03fb86bc45dc7b5c4b1f653a9d7f9126d02"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-024835-b003cd3/marvel-linux-amd64"
    sha256 "3a8cec62b6349d3ec5d7de970720be86ff64e53c63aab71df5223d4b546734de"
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

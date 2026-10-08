class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.083430.11f6381"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-083430-11f6381/marvel-darwin-arm64"
    sha256 "37162afc6b2b7e1361712fd04011499d7c6afbb99e05f9c8803f43e608680168"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-083430-11f6381/marvel-darwin-amd64"
    sha256 "bdfae6228ab0de79afc96c57c269c2ea1944f3a8ffd0493f0c195870c2fc9f90"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-083430-11f6381/marvel-linux-arm64"
    sha256 "90be2edcf0d5de8bdca3086a3085d8cb5bafd80f21fa5e9b8c3c8cfd53261882"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-083430-11f6381/marvel-linux-amd64"
    sha256 "89cc9ff809a3311a031f798fe7a76c8f91bb195966733778321424783d43b6ce"
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

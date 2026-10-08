class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.003457.985fad1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-003457-985fad1/marvel-darwin-arm64"
    sha256 "b7ab9969229396873772e4aed4703d319a2dce969456d6370693989888493477"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-003457-985fad1/marvel-darwin-amd64"
    sha256 "947e36b157565049f85962399de7edb1b111f40f8afa290776f6ac02f38581da"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-003457-985fad1/marvel-linux-arm64"
    sha256 "92cf5b8d953243328ec15e1a8c7df95fe96759942c23dc5b39170ee350359300"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-003457-985fad1/marvel-linux-amd64"
    sha256 "30d5e060a90c817aee5e4bc0e6cc63128444fb33dd508a9b1e97c3f83b065d04"
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

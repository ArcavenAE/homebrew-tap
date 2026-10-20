class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261020.014412.695fdff"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-014412-695fdff/marvel-darwin-arm64"
    sha256 "551653647747b6251fd52b188fee33847bdf58fe1440e3cf78e3f8099d8221fe"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-014412-695fdff/marvel-darwin-amd64"
    sha256 "ef605ff00682ea555b8c6aacc173320a02e44df82526158e8bb6bdaa254f4828"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-014412-695fdff/marvel-linux-arm64"
    sha256 "9ca6353c5b181136c3bd40efa8949fe7669afd74f19aa02b7845ca3816c4a6f2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-014412-695fdff/marvel-linux-amd64"
    sha256 "bf254f59dd22bf9da18fbcaf12d463d78fc26bd63bab874f3e423fb51ca622f7"
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

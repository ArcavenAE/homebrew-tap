class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.002751.cbc13cb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-002751-cbc13cb/marvel-darwin-arm64"
    sha256 "793cfe51869746b227f972e0cc99365713257d89dfc6f715e47ef96d52106b09"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-002751-cbc13cb/marvel-darwin-amd64"
    sha256 "83c7f6bc96b4ab2f2ba3360fa1de209480756d25def2aaa5cf741f245a69281c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-002751-cbc13cb/marvel-linux-arm64"
    sha256 "682b47e1856dd7f138bac0cd45ba7d333b6ec4da66e3be250c54bc35b3deed68"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-002751-cbc13cb/marvel-linux-amd64"
    sha256 "adbbdaf6081a96e4f044c39621c4ec554283904a06622200c61292dd9aff20b4"
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
